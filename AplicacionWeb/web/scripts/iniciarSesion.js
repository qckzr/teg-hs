$(document).ready(function(){
   $("#login").click(function(){
       var usuario = $("#usuario").val();
       var password = $("#contrasena").val();
       $.post('IniciarSesion',{sesion:"iniciar",usuario:usuario,password:password},function(responseText) { 
           alert ("Entró");
           $("#usuario").val("");
           $("#contrasena").val("");
        
            return;
        });
   })
   
   $("#logout").click(function(){
       $.post('IniciarSesion',{sesion:"desconectar"},function(responseText) { 
           alert ("Se ha desconectado");
           location.reload();
        
            return;
   });
});
});