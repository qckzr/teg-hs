  $(document).ready(function() {
      window.setInterval(function monitorear(){

        var nodo1 = $("#ejecutable1 #1").val();
        if (nodo1){
            $.post('MonitoreoServlet',{nodo:nodo1,tipo:1},function(responseText) {
                $("#ejecutable1 .cursor").remove();
                $("#ejecutable1 .monitoreo").append(responseText);
                var $cont = $('#ejecutable1 .monitoreo');
                $cont[0].scrollTop = $cont[0].scrollHeight;
                

           
            });
            var nodo1 = $("#ejecutable1 #1").val();
            $.post('MonitoreoServlet',{nodo:nodo1,tipo:0},function(responseText){
               $("#ejecutable1 .informacion").html(responseText);
               
            });
        }
        var nodo2 = $("#ejecutable2 #2").val();
        if (nodo2){
            $.post('MonitoreoServlet',{nodo:nodo2,tipo:1},function(responseText) { 
                    $("#ejecutable2 .monitoreo").append(responseText);
                    var $cont = $('#ejecutable2 .monitoreo');
                $cont[0].scrollTop = $cont[0].scrollHeight;
                    
            });
            $.post('MonitoreoServlet',{nodo:nodo2,tipo:0},function(responseText){
               $("#ejecutable2 .informacion").html(responseText);
               
            });
          
            
            
        }
        var nodo3 = $("#ejecutable3 #3").val();
        if (nodo3){
            $.post('MonitoreoServlet',{nodo:nodo3,tipo:1},function(responseText) { 
                    $("#ejecutable3 .monitoreo").append(responseText);
                    var $cont = $('#ejecutable3 .monitoreo');
                $cont[0].scrollTop = $cont[0].scrollHeight;
                    
            });
            $.post('MonitoreoServlet',{nodo:nodo3,tipo:0},function(responseText){
               $("#ejecutable3 .informacion").html(responseText);
               
            });
           
            
            
        }
        var nodo4 = $("#ejecutable4 #4").val();
        if (nodo4){
            $.post('MonitoreoServlet',{nodo:nodo4,tipo:1},function(responseText) { 
                    $("#ejecutable4 .monitoreo").append(responseText);
                    var $cont = $('#ejecutable4 .monitoreo');
                $cont[0].scrollTop = $cont[0].scrollHeight;
                    
            }); 
            
            $.post('MonitoreoServlet',{nodo:nodo4,tipo:0},function(responseText){
               $("#ejecutable4 .informacion").html(responseText);
               
            });
          
            
            
        }
        return;
        
      
      },5000);
      
  });


