$(document).ready(function(){
    $("#enviar").hide();
    $('.idAplicacion').click( function() {
        
        $("#aplicaciones").val(this.id);
        $("#enviar").click();
    });
});

