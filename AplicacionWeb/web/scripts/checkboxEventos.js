$(document).ready(function() {

    $(".checkboxEvento").click(function() {

        var id = this.id;
        if ($("#evento" + id).val() == "true") {
            $("#evento" + id).val("false");
        } else {
            $("#evento" + id).val("true");
        }
    });
});


