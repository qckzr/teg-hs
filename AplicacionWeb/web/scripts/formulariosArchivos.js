 $(document).ready(function() {
        
        $('.formularios').submit(function() { 
        
        $.post($(this).attr("action"), $(this).serialize(), function(data) {
                    $('.formularios').hide();
                    var win = window.open("","","width=400,height=200");
                    win.document.write(data);
               });
    
    return false; // prevent normal submit
});
    });

