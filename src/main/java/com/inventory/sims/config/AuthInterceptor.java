package com.inventory.sims.config;

import com.inventory.sims.model.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();

        // Allow static resources and login page
        if (uri.startsWith(request.getContextPath() + "/css/") ||
                uri.startsWith(request.getContextPath() + "/js/") ||
                uri.startsWith(request.getContextPath() + "/images/") ||
                uri.equals(request.getContextPath() + "/login") ||
                uri.equals(request.getContextPath() + "/logout")) {
            return true;
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }

        // Restrict /users to ADMIN only
        if (uri.startsWith(request.getContextPath() + "/users") && !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }

        return true;
    }
}
