$(document).ready(function() {
    $(".linkEscenario").click(function() {


        var id = this.id;
        var nombre = $("#" + id + ".nombreEscenario").val();
        var descripcion = $("#" + id + ".descripcionEscenario").val();
        var imagen = $("#" + id + ".imagenEscenario").val();
        $.post('MostrarEscenarioServlet', {nombre: nombre, descripcion: descripcion, imagen: imagen}, function(responseText) {

            var win = window.open("", "", "width=600,height=600", "");
            win.document.write(responseText);
        });
    });
});
