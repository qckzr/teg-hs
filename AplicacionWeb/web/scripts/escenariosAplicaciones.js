function escenariosAplicaciones(sel) {

    var myNode = document.getElementById("Escenarios");
    while (myNode.firstChild)
        myNode.removeChild(myNode.firstChild);



    for (var i = 1; i <= sel; i++) {
        var divControlGroup = document.createElement("div");
        var divControlGroup2 = document.createElement("div");
        var divControlsNombre = document.createElement("div");
        var divControlsDescripcion = document.createElement("div");
        divControlGroup.className = "control-group";
        divControlGroup2.className = "control-group";
        divControlsNombre.className = "controls";
        divControlsDescripcion.className = "controls";
        var text = document.createElement("input");
        text.type = "text";
        var nombre = "escenario";
        text.name = nombre.concat("", i.toString());
        var textArea = document.createElement("textarea");
        var descripcion = "descripcion";
        textArea.name = descripcion.concat("", i.toString());
        textArea.className = "span12";
        var foo = document.getElementById("Escenarios");
        var labelNombre = document.createElement("Label");
        labelNombre.className = "control-label";
        labelNombre.innerHTML = "Nombre:";
        var labelDescripcion = document.createElement("Label");
        labelDescripcion.innerHTML = "Descripcion:";
        labelDescripcion.className = "control-label";
        divControlsDescripcion.appendChild(textArea);
        divControlsNombre.appendChild(text);
        divControlGroup.appendChild(labelNombre);
        divControlGroup.appendChild(divControlsNombre);
        divControlGroup2.appendChild(labelDescripcion);
        divControlGroup2.appendChild(divControlsDescripcion);
        foo.appendChild(divControlGroup);
        foo.appendChild(divControlGroup2);
    }
    var valor = document.getElementById("cantidadEscenarios");
    valor.value = i.toString();
}