(function uploadFileClickHandle() {
    var uploadFileBtn = document.querySelector("#upload-file-btn");
    var uploadFileInput = document.querySelector("#FileUpload2");
    var fileName = document.querySelector("#file-name");
    var cardPDF = document.querySelector("#card-pdf");
    var dropArea = document.querySelector("#drop-area");
    var fileSize = document.querySelector("#file-size");

    function formatBytes(bytes, decimals = 2) {
        if (bytes === 0) return '0 Bytes';

        const k = 1024;
        const dm = decimals < 0 ? 0 : decimals;
        const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

        const i = Math.floor(Math.log(bytes) / Math.log(k));

        return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
    }

    function setText(v){
        fileSize.innerHTML = formatBytes(v);
    }

    uploadFileBtn.addEventListener("click", function () {
        uploadFileInput.click();
    });

    uploadFileInput.addEventListener("change", function () {
        dropArea.style.display = "none";
        cardPDF.style.display = "block";
        fileName.textContent = this.files[0].name;
        setText(this.files[0].size);
    });
})();
(function dragAndDropUploadHandle() {
    var dropArea = document.getElementById("drop-area");

    // dropArea.addEventListener("dragenter", handlerFunction);
    // dropArea.addEventListener("dragleave", handlerFunction);
    dropArea.addEventListener("dragover", handlerFunction);
    dropArea.addEventListener("drop", handlerFunction);

    function handlerFunction(e) {
        e.preventDefault(); // khong chay event mac dinh khi keo tha (mo file)
        e.stopPropagation(); // len google doc
        console.log(e, this);

        if (!e.dataTransfer || e.dataTransfer.files.length < 1) return;

        // var files = e.dataTransfer.files;

        // files.forEach(function(file) {

        // })
    }
})();

