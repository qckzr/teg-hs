$(document).ready(function() {
    $(".informacion").click(function() {
        var aplicacionActiva = $("#ejecutable" + this.id + "\
                .informacion .aplicacionActiva").val();
        var idProceso = $("#ejecutable" + this.id + " \n\
                .informacion .idProceso").val();
        var memoriaDisponible = $("#ejecutable" + this.id + " \n\
                .informacion .memoriaDisponible").val();
        var numeroNodo = $("#ejecutable" + this.id + " \n\
                .informacion .numeroNodo").val();
        var procesosActivos = $("#ejecutable" + this.id + " \n\
                .informacion .procesosActivos").val();
        var puertosDisponibles = $("#ejecutable" + this.id + " \n\
                .informacion .puertosDisponibles").val();
        var usoCpu = $("#ejecutable" + this.id + " \n\
                .informacion .usoCpu").val();
        var direccionIp = $("#ejecutable" + this.id + " \n\
                .informacion .direccionIp").val();
        $.post('InformacionAgenteServlet', {aplicacionActiva: aplicacionActiva,
            idProceso: idProceso, memoriaDisponible: memoriaDisponible,
            numeroNodo: numeroNodo, procesosActivos: procesosActivos,
            puertosDisponibles: puertosDisponibles, usoCpu: usoCpu,
            direccionIp: direccionIp}, function(responseText) {

            var win = window.open("", "", "width=600,height=600");
            win.document.write(responseText);
        });
    });
    $(".detener").click(function() {

        var id = this.id;
        $('#' + id + '.iniciar').removeAttr("disabled");
        $('#' + id + '.detener').attr("disabled", true);
        $('#' + id + '.enviar').attr("disabled", true);
        $('#mensaje' + id).attr("disabled", true);
        $('#' + id + '.monitoreo').empty();
        $.post('CicloDeVidaServlet', {idEjecutable: id, instruccion: "detener"},
        function(responseText) {
            return;
        });
    });
    $(".enviar").click(function() {
        var id = this.id;
        var mensaje = $("#mensaje" + id).val();
        if (mensaje != "") {
            $("#mensaje" + id).val("");
            $.post('CicloDeVidaServlet', {idEjecutable: id, instruccion: "enviar",
                mensaje: mensaje}, function(responseText) {
                return;

            });
        }
        else {
            alert("No puede enviar un mensaje vacío");
        }
    });
    $(".iniciar").click(function() {
        var id = this.id;
        $('#' + id + '.detener').removeAttr("disabled");
        $('#' + id + '.enviar').removeAttr("disabled");
        $('#' + id + '.iniciar').attr("disabled", true);
        $('#mensaje' + id).removeAttr("disabled");
        $.post('CicloDeVidaServlet', {idEjecutable: id, instruccion: "iniciar"},
        function(responseText) {

            return;
        });

    });

    $("#eliminarTodo").click(function() {
        $('.iniciar').removeAttr("disabled");
        $('.detener').attr("disabled", true);
        $('.enviar').attr("disabled", true);
        $('.mensaje').attr("disabled", true);
        $('.monitoreo').empty();
        $.post('CicloDeVidaServlet', {instruccion: "eliminarTodo"},
        function(responseText) {
            alert("Se eliminó todo el ambiente");
            return;


        });
    });



});


