function valor(){
var checkbox = document.getElementById("checkboxImagen");
var imagen = document.getElementById("imagen");
           if (checkbox.checked==true){
                imagen.value = "true";
                return;
            }
            else{
                imagen.value = "false";
                return;
            }
}
            
           


