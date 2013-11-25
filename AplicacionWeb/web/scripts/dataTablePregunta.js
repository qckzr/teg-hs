$(document).ready(function(){
    $("#enviar").hide();
    $('.idPregunta').click( function() {
        
        $("#preguntas").val(this.id);
        $("#enviar").click();
    });
});

