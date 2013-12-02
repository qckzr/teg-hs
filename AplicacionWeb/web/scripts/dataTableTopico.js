$(document).ready(function() {
    $("#enviar").hide();
    $('.idTopico').click(function() {

        $("#topicos").val(this.id);
        $("#enviar").click();
    });
});

