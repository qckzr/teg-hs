package controller;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Directorios;

/**
 *
 * @author sam
 */

public class FiltroUsuario implements Filter {
    
    private ArrayList<String> urlList;
     
    @Override
    public void destroy() {
    }
 
    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
        Boolean AcceptedRequest = false;

		if (session.getAttribute("nombre") ==null){
                    for(String u : urlList){
                        if(request.getServletPath().contains(u)){
                            AcceptedRequest = true;
                            break;
                        }
                    }
			if(!AcceptedRequest)
                            response.sendRedirect(request.getContextPath()+"/index.jsp");
                }

        chain.doFilter(req, res);
    }
 
    @Override
    public void init(FilterConfig config) throws ServletException {
        String urls = config.getInitParameter("avoid-urls");
        StringTokenizer token = new StringTokenizer(urls, ",");
 
        urlList = new ArrayList<>();
 
        while (token.hasMoreTokens()) {
            urlList.add(token.nextToken());
 
        }
        Directorios directorios  = new Directorios();
        urlList.add(directorios.getDirectorioEjecutables());
        urlList.add(directorios.getDirectorioImagenesEscenarios());
        urlList.add(directorios.getDirectorioImagenesTopico());
    }


}
