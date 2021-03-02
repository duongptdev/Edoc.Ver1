(function acceptCheckboxClickHandle() {
    var blurBackground = document.querySelector(".hide-background");

    var checkboxInput = document.querySelector("#accept-checkbox-id");

    checkboxInput.addEventListener("change", function () {
        if (checkboxInput.checked == true) {
            blurBackground.style.display = "none";
        }
    });
})();
