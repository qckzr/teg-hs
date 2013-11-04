
$(document).ready( function(){
   $(".volver").click(function(){
      window.close();
      $.post('TerminarAplicacionServlet',{},function(){
         document.location.href='topicos.jsp';
         return;
      });
      
   }); 
});
