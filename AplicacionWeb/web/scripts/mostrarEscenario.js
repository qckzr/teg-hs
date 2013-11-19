$(document).ready(function(){
    $(".linkEscenario").click(function(){
        
        
        var id = this.id;
        var nombre = $("#"+id+".nombreEscenario").val();
        var descripcion = $("#"+id+".descripcionEscenario").val();
        var imagen = $("#"+id+".imagenEscenario").val(); 
         $.post('MostrarEscenarioServlet',{nombre:nombre,descripcion:descripcion,imagen:imagen},function(responseText) { 

            var win = window.open("","","width=300,height=500","");
            win.document.write(responseText);
         });
    });
});
////$(document).ready(function(){
//    
//    $(".linkEscenario").click(function(e){
//        
//        
//        var id = this.id;
//        var nombre = $("#"+id+".nombreEscenario").val();
//        var descripcion = $("#"+id+".descripcionEscenario").val();
//        var imagen = $("#"+id+".imagenEscenario").val(); 
//         $.post('MostrarEscenarioServlet',{nombre:nombre,descripcion:descripcion,imagen:imagen},function(responseText) { 
//
//            var win = window.open("","","width=300,height=500");
//            win.document.write(responseText);
//         
//      
//   
//
//        //funciona esto V
//        
//        
////        $('#asd').html("<p>"+nombre+"<br/>"+descripcion+"<br/>"+imagen+"</p>");
////          // var a =   $('#asd').dialog({
////          $('#asd').dialog({
////    autoOpen: false,
////    modal: false,
////    position: [e.pageX+5, e.pageY+5]
//});
//
//       //    a.dialog('open');
//
//          
//        // });
//    });
//    
////    $("#asd").dialog({
////        autoOpen: false,
////        show: "blind",
////        hide: "explode"
////    });
////    
////    $(".linkEscenario").bind("mouseover", function () {
////        $("#asd").dialog('open'); // open
////        
////        
////    });
////    $(".linkEscenario").bind("mouseleave", function () {
////        $("#asd").dialog('close'); // open
////    });
//});
//
