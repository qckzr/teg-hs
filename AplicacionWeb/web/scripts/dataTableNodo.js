$(document).ready(function() {
    $("#enviar").hide();
    $('.idNodo').click(function() {

        $("#nodos").val(this.id);
        $("#enviar").click();
    });
});

