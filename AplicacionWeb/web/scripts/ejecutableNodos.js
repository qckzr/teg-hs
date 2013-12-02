$(document).ready(function() {
    $("#aplicacion").change(function() {
        var value = $(this).val();
        $.post('EjecutableNodoServlet', {idAplicacion: value},
        function(responseText) {
            $('#node').html(responseText);
            return;
        });

    });
    var value = $("#aplicacion").val();
    $.post('EjecutableNodoServlet', {idAplicacion: value},
    function(responseText) {
        $('#node').html(responseText);
        return;
    });
});

