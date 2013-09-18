
$(document).ready( function(){
   $(".volver").click(function(){
      var idTopico = $("#idTopico").val();
      window.close();
      $.post('TerminarAplicacionServlet',{},function(){
         //document.location.href='aplicaciones.jsp?idTopico='+idTopico; 
         document.location.href='topicos.jsp';
         return;
      });
      
   }); 
});
