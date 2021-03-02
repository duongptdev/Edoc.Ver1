(function postSelectionClickHandle() {
    var footerBtn = document.querySelector("#footer-btn");

    var selectionBtn = document.querySelector("#selection-input");

    footerBtn.addEventListener("click", function () {
        selectionBtn.click();
    });
  })();