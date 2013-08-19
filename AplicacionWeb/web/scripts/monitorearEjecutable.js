  $(document).ready(function() {
      window.setInterval(function monitorear(){

        var nodo1 = $("#ejecutable1 #1").val();
        if (nodo1){
            $.post('MonitoreoServlet',{nodo:nodo1},function(responseText) {                
                $("#ejecutable1 #monitoreo").append(responseText);
                return;

           
            }); 
        }
        var nodo2 = $("#ejecutable2 #2").val();
        if (nodo2){
            $.post('MonitoreoServlet',{nodo:nodo2},function(responseText) { 
                    $("#ejecutable2 #monitoreo").append(responseText);
                    return;
            }); 
            
            
        }
        var nodo3 = $("#ejecutable3 #3").val();
        if (nodo3){
            $.post('MonitoreoServlet',{nodo:nodo3},function(responseText) { 
                    $("#ejecutable3 #monitoreo").append(responseText);
                    return;
            }); 
            
            
        }
        var nodo4 = $("#ejecutable4 #4").val();
        if (nodo4){
            $.post('MonitoreoServlet',{nodo:nodo4},function(responseText) { 
                    $("#ejecutable4 #monitoreo").append(responseText);
                    return;
            }); 
            
            
        }
        
        
      },5000);
      
  });


