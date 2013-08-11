 $(document).ready(function() {
     var imagen = document.getElementById("imagen");
        $('.formularios').submit(function() {
           
           if (imagen.value == "false"){
                $.post($(this).attr("action"), $(this).serialize(), function(data) {
                    
                    $('.formularios').hide();
                    $("#results").html(data);
               });
           }
            else{
                
                $.post($(this).attr("action"), $(this).serialize(), function(data) {
                    $('.formularios').hide();
                    
                    var win = window.open("","","width=400,height=200");
                    win.document.write(data);

               });
                   
               }
           
               
    
    return false; // prevent normal submit
});
    });