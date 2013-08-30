$(document).ready(function(){
 
   $("#login").click(function(){
       var usuario = $("#usuario").val();
       var password = $("#contrasena").val();
       $.post('IniciarSesion',{sesion:"iniciar",usuario:usuario,password:password},function(responseText) { 
           $("#usuario").val("");
           $("#contrasena").val("");
           $("#usuario").hide();
           $("#contrasena").hide();
           $("#login").hide();
           $("#logout").show();
            return;
        });
   })
   
   $("#infoUsuario a").click(function(){
       $.post('IniciarSesion',{sesion:"desconectar"},function(responseText) { 
           location.reload();
        
            return;
   });
});
});