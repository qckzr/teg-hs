 $(document).ready(function() {
     
     $("#checkboxImagen").click(function(){
        if($("#imagen").val() == "true") {
            $("#imagen").val("false");
        } else {
            $("#imagen").val("true");
        }
     });
 
        
        
        $('.formularios').submit(function() {
        
            var imagen = $("#imagen").val();
           if (imagen.value == "false"){
                $.post($(this).attr("action"), $(this).serialize(), function(data) {
                    
                    $('.formularios').hide();
                    $("#results").html(data);
               });
           } else{
                
                $.post($(this).attr("action"), $(this).serialize(), function(data) {
                    $('.formularios').hide();
                    
                    var win = window.open("","","width=400,height=200");
                    win.document.write(data);

               });
                   
               }
           
               
    
    return false;
});
    });