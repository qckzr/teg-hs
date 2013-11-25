$(document).ready(function(){
        $('a').click( function() {
            $('#resultado').empty();
            $('#resultado').load(retornarPagina(this.id));   
            });
        });
        
    function retornarPagina(id){
        switch (id){
            case 'crearUsuario':
                return 'usuarios/crearUsuario.jsp';
                
            case 'modificarUsuario':
                return 'usuarios/modificarUsuario1.jsp';
                
            case 'eliminarUsuario':
                return 'usuarios/eliminarUsuario1.jsp';
                
            case 'consultarUsuario':
                return 'usuarios/consultarUsuario1.jsp';
            
            case 'crearTopico':
                return 'topicos/crearTopico.jsp';
                
            case 'modificarTopico':
                return 'topicos/modificarTopico1.jsp';
                
            case 'eliminarTopico':
                return 'topicos/eliminarTopico1.jsp';
                
            case 'consultarTopico':
                return 'topicos/consultarTopico1.jsp';
                
            case 'crearPregunta':
                return 'preguntas/crearPregunta.jsp';
                
            case 'modificarPregunta':
                return 'preguntas/modificarPregunta1.jsp';
                
            case 'eliminarPregunta':
                return 'preguntas/eliminarPregunta1.jsp';
                
            case 'consultarPregunta':
                return 'preguntas/consultarPregunta1.jsp';
                
            case 'crearAplicacion':
                return 'aplicaciones/crearAplicacion.jsp';
                
            case 'modificarAplicacion':
                return 'aplicaciones/modificarAplicacion1.jsp';
                
            case 'eliminarAplicacion':
                return 'aplicaciones/eliminarAplicacion1.jsp';
                
            case 'consultarAplicacion':
                return 'aplicaciones/consultarAplicacion1.jsp';
                
            case 'crearEjecutable':
                return 'ejecutables/cargarEjecutable.jsp';
                
            case 'modificarEjecutable':
                return 'ejecutables/modificarEjecutable1.jsp';
                
            case 'eliminarEjecutable':
                return 'ejecutables/eliminarEjecutable1.jsp';
                
            case 'consultarEjecutable':
                return 'ejecutables/consultarEjecutable1.jsp';
                
            case 'crearNodo':
                return 'nodos/crearNodo.jsp';
                
            case 'modificarNodo':
                return 'nodos/modificarNodo1.jsp';
                
            case 'eliminarNodo':
                return 'nodos/eliminarNodo1.jsp';
                
            case 'consultarNodo':
                return 'nodos/consultarNodo1.jsp';
            
            case 'crearEvento':
                return 'eventos/crearEvento.jsp';
                
            case 'modificarEvento':
                return 'eventos/modificarEvento1.jsp';
                
            case 'eliminarEvento':
                return 'eventos/eliminarEvento1.jsp';
                
            case 'consultarEvento':
                return 'eventos/consultarEvento1.jsp';    
                
                
        }   
    }

