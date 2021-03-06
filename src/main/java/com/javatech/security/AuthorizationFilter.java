package com.javatech.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.constant.SystemConstant;
import com.javatech.model.UserModel;
import com.javatech.utils.SessionUtil;

public class AuthorizationFilter implements Filter {
	
	private String[] urlPermit = {"/login" , "/register", "/template", "/img", "/quen-mat-khau", "/doi-mat-khau"};
	
	@SuppressWarnings("unused")
	private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }
    
    private Boolean urlStartWiths(String url, String... strs) {
    	for (String str : strs) {
			if(url.startsWith(str)) {
				return true;
			}
		}
    	return false;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String url = request.getRequestURI();
        System.out.println(url);
        if(urlStartWiths(url, urlPermit)) {
        	filterChain.doFilter(servletRequest, servletResponse);
        	return;
        }
        UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        if (model != null) {
        	if (url.startsWith("/admin")) {
        		if (model.getRole().getCode().equals(SystemConstant.ADMIN_ROLE)
        			|| model.getRole().getCode().equals("ctv")) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if (model.getRole().getCode().equals(SystemConstant.USER_ROLE)) {
                    response.sendRedirect(request.getContextPath()+"/login?action=login&message=not_permission&alert=danger");
                }
        	} else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } else {
            response.sendRedirect(request.getContextPath()+"/login?action=login&message=not_login&alert=danger");
        }
    }

    @Override
    public void destroy() {

    }
}
