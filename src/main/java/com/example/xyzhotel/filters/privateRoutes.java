package com.example.xyzhotel.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class privateRoutes implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // todo
    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)arg0;

        if(request.getRequestURI().startsWith("/user") || request.getRequestURI().startsWith("/admin")){

            HttpSession session = request.getSession();

            if(session.getAttribute("username")==null){
                request.getRequestDispatcher("/jsp/auth/login.jsp").forward(request, arg1);
            }
            else if(session.getAttribute("role") == null){
                request.getRequestDispatcher("/jsp/auth/login.jsp").forward(request, arg1);
            }
        }
        arg2.doFilter(request, arg1);
        //post-processing

    }

    @Override
    public void destroy() {
        // todo
    }
}
