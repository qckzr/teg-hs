 $(document).ready(function() {
   $(".informacion").click(function(){
      //$.post('CicloDeVidaServlet',{idAplicacion:value},function(responseText) { 
     //                   $('#node').html(responseText);         
       //                 return;
       
       alert ("informacion"+this.id);
       //             }); 
   });
   $(".detener").click(function(){
       
       var id = this.id;
    //   alert ("Se Detuvo el nodo "+id);
      $.post('CicloDeVidaServlet',{idEjecutable:id,instruccion:"detener"},function(responseText) { 
     //                   $('#node').html(responseText);   
                        alert ("Se Detuvo el nodo con el ejecutable: "+id);      
                        return;
                    }); 
   });
   $(".enviar").click(function(){
      var id = this.id;
      var mensaje = $("#mensaje"+id).val();
      if (mensaje!=""){
            $.post('CicloDeVidaServlet',{idEjecutable:id,instruccion:"enviar",mensaje:mensaje},function(responseText) { 
                alert("Se envió el mensaje: "+mensaje+" al nodo con el ejecutable: "+id);
                return;
       
            }); 
      }
      else{
          alert ("No puede enviar un mensaje vacío");
      }
   });
   $(".iniciar").click(function(){
   //   $.post('EjecutableNodoServlet',{idAplicacion:value},function(responseText) { 
     //                   $('#node').html(responseText);         
       //                 return;
       
       alert ("iniciar"+this.id);
       //             }); 
   });
   
   $(".eliminarTodo").click(function(){
      $.post('CicloDeVidaServlet',{instruccion:"eliminarTodo"},function(responseText) { 
                        alert("Se eliminó todo el ambiente");
                       return;
       

        }); 
   });
   
   
   
 });


