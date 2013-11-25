$(document).ready(function(){
    $("#enviar").hide();
    $('.idEjecutable').click( function() {
        
        $("#ejecutables").val(this.id);
        $("#enviar").click();
    });
});

