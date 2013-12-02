
$(document).ready(function() {
    $('.formularios').submit(function() {

        $.post($(this).attr("action"), $(this).serialize(), function(data) {
            $('.formularios').hide();
            $("#results").html(data);
        });
        return false;
    });
});


