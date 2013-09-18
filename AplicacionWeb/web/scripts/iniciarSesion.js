$(document).ready(function(){
 
   $("#login").click(function(){
       var usuario = $("#usuario").val();
       var password = $("#contrasena").val();
       $.post('IniciarSesion',{sesion:"iniciar",usuario:usuario,password:password},function(responseText) { 
           $("#usuario").val("");
           location.reload();
            return;
        });
   })
   
   $("#logout").click(function(){
       $.post('IniciarSesion',{sesion:"desconectar"},function(responseText) { 
           location.reload();
            return;
   });
});
});