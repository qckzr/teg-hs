$(document).ready(function() {
    $("#enviar").hide();
    $('.idEvento').click(function() {

        $("#eventos").val(this.id);
        $("#enviar").click();
    });
});

