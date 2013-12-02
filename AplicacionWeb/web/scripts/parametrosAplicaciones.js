function parametrosAplicaciones(sel) {

    var myNode = document.getElementById("Parametros");
    while (myNode.firstChild)
        myNode.removeChild(myNode.firstChild);



    for (var i = 1; i <= sel; i++) {
        var divControlGroup = document.createElement("div");
        var divControlGroup2 = document.createElement("div");
        var divControlsNombre = document.createElement("div");
        var divControlsValor = document.createElement("div");
        divControlGroup.className = "control-group";
        divControlGroup2.className = "control-group";
        divControlsNombre.className = "controls";
        divControlsValor.className = "controls";
        var element1 = document.createElement("input");
        var labelNombre = document.createElement("Label");
        labelNombre.className = "control-label";
        labelNombre.innerHTML = "Nombre:";
        var labelValor = document.createElement("Label");
        labelValor.className = "control-label";
        labelValor.innerHTML = "Valor:";
        element1.setAttribute("type", "text");
        var nombreParametro = "nombreParametro";
        var nombreP = nombreParametro.concat("", i.toString());
        element1.setAttribute("name", nombreP);
        element1.setAttribute("value", nombreP);
        var element = document.createElement("input");
        element.setAttribute("type", "text");
        var parametro = "parametro";
        var nombre = parametro.concat("", i.toString());
        element.setAttribute("name", nombre);
        element.setAttribute("value", nombre);
        var foo = document.getElementById("Parametros");
        divControlsNombre.appendChild(element1);
        divControlsValor.appendChild(element);
        divControlGroup.appendChild(labelNombre);
        divControlGroup.appendChild(divControlsNombre);
        foo.appendChild(divControlGroup);
        divControlGroup2.appendChild(labelValor);
        divControlGroup2.appendChild(divControlsValor);
        foo.appendChild(divControlGroup2);
    }
    var valor = document.getElementById("cantidadParametros");
    valor.value = i.toString();
}