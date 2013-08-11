function parametrosAplicaciones(sel) {
    
        var myNode = document.getElementById("Parametros");
        while (myNode.firstChild)
            myNode.removeChild(myNode.firstChild);
            
        
             
        for (var i=1;i<=sel;i++){
            var element1 = document.createElement("input");
            element1.setAttribute("type", "text");
            var nombreParametro = "nombreParametro";
            var nombreP = nombreParametro.concat("",i.toString());
            element1.setAttribute("name",nombreP);
            element1.setAttribute("value",nombreP);
            var element = document.createElement("input");
            element.setAttribute("type", "text");
            var parametro = "parametro";
            var nombre = parametro.concat("",i.toString());
            element.setAttribute("name",nombre);
            element.setAttribute("value",nombre);
            var foo = document.getElementById("Parametros");
            foo.appendChild(element1);
            foo.appendChild(element);
            }
        var valor = document.getElementById("cantidadParametros");
        valor.value = i.toString();
    }