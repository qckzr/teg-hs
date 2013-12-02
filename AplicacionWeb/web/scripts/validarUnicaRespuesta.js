function validarUnicaRespuesta(check) {
    for (var i = 1; i <= 4; i++) {
        var a = "";
        var checkBox = document.getElementById(a.concat("checkbox", i));
        if ((checkBox.checked == true) && (checkBox != check)) {
            checkBox.checked = false;
            checkBox.value = "NULL";
            check.value = "'SI'";
            return;
        }
    }
    check.value = "'SI'";
    return;
}