 function escenariosAplicaciones(sel) {
    
        var myNode = document.getElementById("Escenarios");
        while (myNode.firstChild)
            myNode.removeChild(myNode.firstChild);
            
        
             
        for (var i=1;i<=sel;i++){
            var text = document.createElement("input");
            text.type = "text";
            var nombre = "escenario";           
            text.name = nombre.concat("",i.toString());
            var textArea = document.createElement("textarea");
            var descripcion = "descripcion";
            textArea.name = descripcion.concat("",i.toString());
            var foo = document.getElementById("Escenarios");
            var labelNombre = document.createElement("Label");
            labelNombre.innerHTML = "Nombre:";
            var labelDescripcion = document.createElement("Label");            
            labelDescripcion.innerHTML = "Descripcion:";           
            foo.appendChild(labelNombre);
            foo.appendChild(text);
            foo.appendChild(labelDescripcion);
            foo.appendChild(textArea);
            }
        var valor = document.getElementById("cantidadEscenarios");
        valor.value = i.toString();
    }