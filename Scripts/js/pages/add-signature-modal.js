(function acceptCheckboxClickHandle() {
    var blurBackground = document.querySelector(".hide-background");

    var checkboxInput = document.querySelector("#accept-checkbox-id");

    checkboxInput.addEventListener("change", function () {
        if (checkboxInput.checked == true) {
            blurBackground.style.display = "none";
        }
    });
})();

(function postSelectionClickHandle() {

    var signBtn = document.querySelector("#sign-button");
    var signModal = document.querySelector(".background-modal");

    var closeModalBtn = document.querySelector(".close-button");

    signBtn.addEventListener("click", function () {
        signModal.style.display = "flex";
    });

    closeModalBtn.addEventListener("click", function () {
        signModal.style.display = "none";
    });
})();

(function showCertInfo() {

    var signMethodSelection = document.querySelector("#sign-method");

    var usbTokenInfo = document.querySelector(".usb-token");
    var mobileSignInfo = document.querySelector(".mobile-sign");

    signMethodSelection.addEventListener('change', function () {
        var style = this.value == 'usb-token' ? 'block' : 'none';
        usbTokenInfo.style.display = style;

        var style = this.value == 'mobile-sign' ? 'block' : 'none';
        mobileSignInfo.style.display = style;
    });
})();


