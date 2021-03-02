<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Danhsachyeucau.aspx.vb" Inherits="Danhsachyeucau" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="FileSaver.min.js"></script>
    <script type="text/javascript">
        Object.defineProperty(Date.prototype, 'YYYYMMDDHHMMSS', {
            value: function() {
                function pad2(n) {  // always returns a string
                    return (n < 10 ? '0' : '') + n;
                }

                return this.getFullYear() +
                       pad2(this.getMonth() + 1) + 
                       pad2(this.getDate()) +
                       pad2(this.getHours()) +
                       pad2(this.getMinutes()) +
                       pad2(this.getSeconds());
            }
        });



        function Taomoiyeucau(s, e) {
            window.location.href = 'Taoyeucauky.aspx';
        }

        $(document).ready(function () {
            var user = localStorage.getItem("user");
            var serial, phuongthuc;
            serial = localStorage.getItem("serial");
            phuongthuc = localStorage.getItem("phuongthucky");
            //if (user == null) {
            //    window.location = 'signin.aspx';

            //}
            else {
                hduser.Set('value', user);
                hdserial.Set('value', serial);
                hdphuongthuc.Set('value', phuongthuc);
                //alert(hduser.Get('value'));
                ShowVBDi();
            }
        });

        function Viewfile(s, e) {
            var duongdan = s.cp_path;
            
            var doc = duongdan;
         
            console.log(duongdan);
            sessionStorage.setItem("path", doc);
            sessionStorage.setItem('document',doc)
           
            if (duongdan != null || duongdan != '') {
                hdduongdan.Set('value', duongdan);

                const instance = getInstance();
                if (instance!=null){
                    instance.loadDocument(doc);
                }
                else{
                    
                    WebViewer(
                         {
                       //    path: 'http://localhost:8001/lib/',
                             path: 'http://edoc.nacencomm.vn/lib/',
                             //pdftronServer: 'http://localhost:8001',
                             initialDoc: doc,
                         },
                         document.getElementById('viewer1')
                     ).then(instance => {
                         //samplesSetup(instance);
                   
                  

                         const {Annotations, docViewer, annotManager } = instance;

                  
                         const getMouseLocation = e => {
                    
                             const {  docViewer, annotManager } = instance;
                             const scrollElement = docViewer.getScrollViewElement();
                             const scrollLeft = scrollElement.scrollLeft || 0;
                             const scrollTop = scrollElement.scrollTop || 0;

                             //var pagenumber = docViewer.getCurrentPage();
                             const doc = docViewer.getDocument();
                             ////const pdfCoords = doc.getViewerCoordinates(pagenumber, e.x, e.y); 
                             //const viewerCoords1  = doc.getViewerCoordinates(pagenumber, e.x, e.y);
                             //const pdfCoords = doc.getPDFCoordinates(pagenumber, viewerCoords.x, viewerCoords.y);

                             var windowCoordinates ={x:e.pageX + scrollLeft,y:e.pageY + scrollTop}

                             const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                             const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                             const clickedPage = (page.first !== null) ? page.first : docViewer.getCurrentPage();
                             const pageCoordinates = displayMode.windowToPage(windowCoordinates, clickedPage);
                        
                             const viewerCoords = doc.getViewerCoordinates(clickedPage, pageCoordinates.x, pageCoordinates.y);

                             sessionStorage.setItem('x',viewerCoords.x);
                             sessionStorage.setItem('y',viewerCoords.y);

                             return {
                                 x: viewerCoords.x, // e.pageX + scrollLeft,
                                 y:  viewerCoords.y //e.pageY + scrollTop
                             };
                         };

                         instance.setHeaderItems(header => {
                             header.push({
                                 type: 'actionButton',
                                 img: '/img/logoNCM1.png',
                                 onClick: async () => {
                                     const doc = docViewer.getDocument();
                                     const xfdfString = await annotManager.exportAnnotations();                                
                                     const data = await doc.getFileData({
                                         // saves the document with annotations in it
                                         xfdfString
                                     });
                                     const arr = new Uint8Array(data);
                                     const blob = new Blob([arr], { type: 'application/pdf' });
                   
                                     var a = "test";
                                     // sessionStorage.setItem('val',blob);

                                     var reader = new FileReader();
                                     reader.readAsDataURL(blob); 
                                     reader.onloadend = function() {
                                         var base64data = reader.result;                
                                         sessionStorage.setItem('val',base64data);
                                         cpsave.PerformCallback(base64data);
                                     }
                                     //   cpsave.PerformCallback(blob);
                                     //window.saveAs(blob, a + '.pdf');
                                 }
                             })

                             docViewer.on('mouseLeftDown', e => {
                                 // refer to getMouseLocation implementation above
                                 const windowCoordinates = getMouseLocation(e);
                                 //  console.log(windowCoordinates);
                                 txtstartx.SetText(windowCoordinates.x);
                                 txtstarty.SetText(windowCoordinates.y);
                             });

                             docViewer.on('mouseLeftUp', e => {
                                 // refer to getMouseLocation implementation above
                                 const windowCoordinates = getMouseLocation(e);
                                 const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                                 const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                                 //  console.log(windowCoordinates);
                                 txtendx.SetText(windowCoordinates.x);
                                 txtendy.SetText(windowCoordinates.y);
                                 const clickedPage = docViewer.getCurrentPage();
                                 const rectangleAnnot = new Annotations.RectangleAnnotation();
                                 rectangleAnnot.PageNumber = clickedPage;
                                 // values are in page coordinates with (0, 0) in the top left

                                 var startx,starty,endx,endy;
                                 startx=txtstartx.GetText();
                                 starty=txtstarty.GetText();
                                 endx=txtendx.GetText();
                                 endy=txtendy.GetText();

                                 var width,height;
                                 width= Math.abs(endx - startx);
                                 height=Math.abs(starty - endy);

                                 const doc = docViewer.getDocument();
                                 var point={x:startx,y:starty}
                                 const viewerCoords1 = doc.getViewerCoordinates(clickedPage, startx, starty);
                    
                                 rectangleAnnot.X = viewerCoords1.x;
                                 rectangleAnnot.Y = viewerCoords1.y;
                                 rectangleAnnot.Width = width;
                                 rectangleAnnot.Height = height;
                                 annotManager.redrawAnnotation(rectangleAnnot);
                                 var signinfo = txtstartx.GetText() + " " + txtstarty.GetText() + " " + width + " " + height + " " + clickedPage;
                                 sessionStorage.setItem("signInfo",signinfo);
                                 sessionStorage.setItem("signpage",clickedPage);

                             });
                         });
                     });   
                }
            
         

                pnguidi.SetVisible(false);
                pnvbden.SetVisible(true);
                pnview.SetVisible(true);
               
            } else {
                alert('Không tìm thấy file');
            }

        }

        function ShowVBDi(s, e) {

            pnguidi.SetVisible(true);
            pnvbden.SetVisible(false);
            pnview.SetVisible(false);

            griddagui.PerformCallback();

        }

        function ShowVBDen(s, e) {
            pnguidi.SetVisible(false);
            pnvbden.SetVisible(true);
            pnview.SetVisible(false);
            griddanhan.PerformCallback();
        }
        
        function EndRender(s,e){
            var res= e.result;
            if(res==1){
                alert('Lưu file thành công');
            }
            else{
                alert(res);
            }
        }

    

        function SignDoc(){
            loading.Show();
            phuongthuc = localStorage.getItem("phuongthucky");
          
            var kq;
            if(phuongthuc==1)
            {
                var page=sessionStorage.getItem("signpage");
                cpsign.PerformCallback(page);
            }
            else{
                loading.Hide();
                var linkfile=sessionStorage.getItem('document');
                var code=new Date().YYYYMMDDHHMMSS();
                var tk =hduser.Get("value");
                var info= sessionStorage.getItem("signInfo");
              
                if(info!=null){
                    $.ajax({
                        type: "POST",
                        url: "http://27.71.231.212:8039/apiEdoc.asmx/TaoYCKy",
                        data: JSON.stringify({ Code: code,Taikhoan:tk,Linkfile:linkfile,Info: info }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d>0)
                            {
                                alert('Gửi yêu cầu ký văn bản thành công. Nếu ký bằng USB token, vui lòng ký văn bản đang chờ bằng tool ký bằng USB Token.');
                                
                                //cpchecksigned.PerformCallback(code);

                            }
                        },

                        failure: function (response) {

                        },
                        error: function (response) {
                        }
                    });
                }
                else{
                    alert('Chưa chọn vùng ký trên văn bản')
                }             
            }            
        }

        function EndSignDoc(s,e){
            loading.Hide();
            var res=e.result;
            if(res==1)
            {
                alert('Ký văn bản thành công');
                var doc=s.cp_path;               
                console.log(s.cp_path);
                const instance = getInstance();                
                instance.loadDocument(doc);

            }
            else{
                alert('Có lỗi:' + res);
            }
        }       

        function RefreshDoc(){
             var doc= hdduongdan.Get('value');//sessionStorage.getItem('document')
          
            const instance = getInstance();
            if (instance!=null){
                alert('not null');
                instance.closeDocument().then(function() {
                    console.log('Document is closed');
                    instance.loadDocument(doc);
                });
            
            }
        }

       
    </script>

    <script src="lib/webviewer.min.js"></script>
    <script src="modernizr.custom.min.js"></script>
  <dx:ASPxLoadingPanel ID="loading" runat="server" ClientInstanceName="loading" Text="Đang xử lý" modal="true" />
    <script src="old-browser-checker.js"></script>
    <%--<script src="global.js"></script>--%>
       <dx:ASPxHiddenField ID="hdserial" runat="server" ClientInstanceName="hdserial"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="hdphuongthuc" runat="server" ClientInstanceName="hdphuongthuc"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="hdduongdan" ClientInstanceName="hdduongdan" runat="server"></dx:ASPxHiddenField>
    <dx:ASPxCallback ID="cpSave" runat="server" OnCallback="cpSave_Callback" ClientInstanceName="cpsave">
      <ClientSideEvents CallbackComplete="EndRender" />
    </dx:ASPxCallback>

      <dx:ASPxCallback ID="cpsign" runat="server" OnCallback="cpsign_Callback" ClientInstanceName="cpsign">
      <ClientSideEvents CallbackComplete="EndSignDoc" />
    </dx:ASPxCallback>

    <div style="font-family: Courier New">

        <dx:ASPxPopupControl ID="popEdit" runat="server" ClientInstanceName="popedit" Width="1000px"
            Theme="Material" HeaderText="Xem file văn bản" ShowOnPageLoad="false"
            CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <dx:ASPxPanel ID="pnViewVB" runat="server" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent>
                                View pdf
                                   <iframe id="pdfview" runat="server" width="100%" height="1000px"></iframe>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <div class="row" style="padding: 20px">
            <div class="col-md-2" style="padding-top: 50px">

                <dx:ASPxButton ID="btnCreatenew" runat="server" Text="Tạo mới" Width="280px" Theme="Material" Font-Bold="true" Font-Size="13pt" Font-Names="Courier New" AutoPostBack="false">
                    <ClientSideEvents Click="Taomoiyeucau" />
                </dx:ASPxButton>

                <hr />
                <table class="table table-bordered">
                    <tr style="height: 50px">
                        <td>
                            <dx:ASPxButton ID="btnVBDi" runat="server" Text="Tài liệu đã gửi" RenderMode="Link" Theme="Material" Font-Size="12pt" AutoPostBack="false">
                                <ClientSideEvents Click="ShowVBDi" />
                            </dx:ASPxButton>

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnVBDen" runat="server" Text="Tài liệu đã nhận" RenderMode="Link" Theme="Material" Font-Size="12pt" AutoPostBack="false">
                                <ClientSideEvents Click="ShowVBDen" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>

                <dx:ASPxTextBox ID="txtstartx"  ClientInstanceName="txtstartx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtstarty"  ClientInstanceName="txtstarty" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtendx"  ClientInstanceName="txtendx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtendy"  ClientInstanceName="txtendy" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
            </div>

            <div class="col-md-10">
                <h3><b>DANH SÁCH VĂN BẢN, TÀI LIỆU</b></h3>
                <hr />
                <dx:ASPxPanel ID="pnGuidi" runat="server" Width="100%" ClientInstanceName="pnguidi" ClientVisible="true">
                    <PanelCollection>
                        <dx:PanelContent>
                            <h4><b>TÀI LIỆU ĐÃ GỬI</b></h4>
                            <dx:ASPxGridView ID="gridDanhsach" runat="server" Theme="Material" Width="100%" OnDataBinding="gridDanhsach_DataBinding" OnCustomUnboundColumnData="gridDanhsach_CustomUnboundColumnData" OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText"
                                OnCustomCallback="gridDanhsach_CustomCallback" ClientInstanceName="griddagui" AutoGenerateColumns="false">
                                <Columns>
                                    <dx:GridViewDataColumn FieldName="idFile" Caption="idVB"></dx:GridViewDataColumn>

                                    <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tên văn bản"></dx:GridViewDataColumn>
                                    <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                                    <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Taikhoanky" Caption="Email tiếp nhận"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Vitriluu" Caption="Đường dẫn file" Visible="false"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="PhanloaiVB" Caption="Phan loai vb" Visible="false"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn Caption="Chức năng">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btnXem" runat="server" Text="Xem" OnInit="btnXem_Init" RenderMode="Link" ClientEnabled="true"  AutoPostBack="false">
                                                <ClientSideEvents Click="Viewfile" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
                                </Columns>
                                <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                                <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                                    <Footer Font-Bold="True" ForeColor="Black"></Footer>
                                </Styles>
                                <Settings ShowColumnHeaders="true" ShowFooter="true" />
                            </dx:ASPxGridView>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>



                <dx:ASPxPanel ID="pnVBDen" runat="server" Width="100%" ClientInstanceName="pnvbden" ClientVisible="false">
                    <PanelCollection>
                        <dx:PanelContent>
                            <h4><b>TÀI LIỆU NHẬN</b></h4>
                            <dx:ASPxGridView ID="gridVBnhan" runat="server" Theme="Material" Width="100%" OnDataBinding="gridVBnhan_DataBinding" OnCustomUnboundColumnData="gridVBnhan_CustomUnboundColumnData" OnCustomColumnDisplayText="gridVBnhan_CustomColumnDisplayText"
                                OnCustomCallback="gridVBnhan_CustomCallback" ClientInstanceName="griddanhan" AutoGenerateColumns="false">
                                <Columns>
                                    <dx:GridViewDataColumn FieldName="idFile" Caption="idVB"></dx:GridViewDataColumn>

                                    <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tên văn bản"></dx:GridViewDataColumn>
                                    <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                                    <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Taikhoantao" UnboundType="String" Caption="Email gửi"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Vitriluu" Caption="Đường dẫn file" Visible="false"></dx:GridViewDataColumn>
                                      <dx:GridViewDataColumn FieldName="PhanloaiVB" Caption="Phan loai vb" Visible="false"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn Caption="Chức năng">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btnXemvbnhan" runat="server" Text="Xem" OnInit="btnXemvbnhan_Init" RenderMode="Link" ClientEnabled="true" AutoPostBack="false">
                                                <ClientSideEvents Click="Viewfile" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
                                </Columns>
                                <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                                <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                                    <Footer Font-Bold="True" ForeColor="Black"></Footer>
                                </Styles>
                                <Settings ShowColumnHeaders="true" ShowFooter="true" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>


                <dx:ASPxPanel ID="pnViewfile" runat="server" Width="100%" ClientInstanceName="pnview" ClientVisible="false">
                    <PanelCollection>
                        <dx:PanelContent>
                            <div style="width:100%;padding-bottom:10px">
                                 <div style="float:left">
                                                  <img src="img/icons8-info-40.png" style="height:32px" />
                                                  Bấm và giữ chuột để chọn vùng ký! <a href="#" onclick="SignDoc()">Bấm vào đây để ký văn bản</a>
                                        &nbsp;&nbsp;&nbsp;<a href="#" onclick="RefreshDoc()">Xem văn bản đã ký</a>
                                              </div>

                                <table style="width:100%">
                                    <tr>
                                        <td style="width:100px">
                                              <dx:ASPxButton ID="btnSign" runat="server" Text="Sign" OnClick="btnSign_Click" ClientVisible="false" />
                                        </td>
                                          <td>
                                             
                                          </td>   
                                    </tr>
                                </table>
                            </div>
                          

                            <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                            <%-- <iframe id="Iframe1" runat="server" width="100%" height="1000px"></iframe>--%>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>


            </div>



        </div>
        <asp:SqlDataSource ID="dsDagui" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsDanhan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>

<%--        <script src="menu-button.js"></script>
   --%>
    </div>
</asp:Content>

