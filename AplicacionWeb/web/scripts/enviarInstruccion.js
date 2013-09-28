 $(document).ready(function() {
   $(".informacion").click(function(){
      
        var aplicacionActiva = $("#ejecutable"+this.id+" .informacion .aplicacionActiva").val();
        var idProceso = $("#ejecutable"+this.id+" .informacion .idProceso").val();
        var memoriaDisponible = $("#ejecutable"+this.id+" .informacion .memoriaDisponible").val();
        var numeroNodo = $("#ejecutable"+this.id+" .informacion .numeroNodo").val();
        var procesosActivos = $("#ejecutable"+this.id+" .informacion .procesosActivos").val();
        var puertosDisponibles = $("#ejecutable"+this.id+" .informacion .puertosDisponibles").val();
        var usoCpu = $("#ejecutable"+this.id+" .informacion .usoCpu").val();
        var direccionIp = $("#ejecutable"+this.id+" .informacion .direccionIp").val();
        $.post('InformacionAgenteServlet',{aplicacionActiva:aplicacionActiva,
            idProceso:idProceso,memoriaDisponible:memoriaDisponible,
            numeroNodo:numeroNodo,procesosActivos:procesosActivos,
            puertosDisponibles:puertosDisponibles,usoCpu:usoCpu,direccionIp:direccionIp},function(responseText) { 

            var win = window.open("","","width=300,height=500");
            win.document.write(responseText);
         });
   });
   $(".detener").click(function(){
       
       var id = this.id;
      $.post('CicloDeVidaServlet',{idEjecutable:id,instruccion:"detener"},function(responseText) { 
                        alert ("Se Detuvo el nodo con el ejecutable: "+id);      
                        return;
                    }); 
   });
   $(".enviar").click(function(){
      var id = this.id;
      var mensaje = $("#mensaje"+id).val();
      if (mensaje!=""){
            $("#mensaje"+id).val("");
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
       var id = this.id;
       $.post('CicloDeVidaServlet',{idEjecutable:id,instruccion:"iniciar"},function(responseText) { 
                        alert ("Se inicio el nodo con el ejecutable: "+id);      
                        return;
                    }); 
   //   $.post('EjecutableNodoServlet',{idAplicacion:value},function(responseText) { 
     //                   $('#node').html(responseText);         
       //                 return;
       
       //             }); 
   });
   
   $(".eliminarTodo").click(function(){
      $.post('CicloDeVidaServlet',{instruccion:"eliminarTodo"},function(responseText) { 
                        alert("Se eliminó todo el ambiente");
                       return;
       

        }); 
   });
   
   
   
 });


