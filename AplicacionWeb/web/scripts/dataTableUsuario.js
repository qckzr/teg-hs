$(document).ready(function(){
    $("#enviar").hide();
    $('.idUsuario').click( function() {
        
        $("#usuarios").val(this.id);
        $("#enviar").click();
    });
});

