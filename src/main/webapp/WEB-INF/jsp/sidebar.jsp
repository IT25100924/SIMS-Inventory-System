<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!-- Sidebar Component -->
        <nav class="sidebar">
            <a href="${pageContext.request.contextPath}/" class="brand-container" style="padding: 24px; display: flex; align-items: center; gap: 12px; text-decoration: none; width: 100%; box-sizing: border-box;">
                <div class="brand-icon" style="width: 32px; height: 32px; border-radius: 9px; background: linear-gradient(135deg, #8a2be2 0%, #aa00ff 100%); display: flex; align-items: center; justify-content: center; color: #fff; font-size: 1.1rem; box-shadow: 0 4px 10px rgba(138, 43, 226, 0.3); flex-shrink: 0;">
                    <i class="bi bi-boxes"></i>
                </div>
                <span class="brand-name" style="font-size: 1.5rem; font-weight: 800; background: linear-gradient(135deg, #8a2be2 0%, #aa00ff 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; color: #8a2be2; letter-spacing: -0.5px;">SIMS</span>
            </a>

            <ul class="sidebar-menu">
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/"
                        class="sidebar-link ${pageContext.request.requestURI eq '/index.jsp' || pageContext.request.requestURI eq '/' ? 'active' : ''}">
                        <i class="bi bi-grid-1x2-fill"></i> Dashboard
                    </a>
                </li>
                <c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                    <li class="sidebar-item">
                        <a href="${pageContext.request.contextPath}/users"
                            class="sidebar-link ${pageContext.request.requestURI.contains('/users') ? 'active' : ''}">
                            <i class="bi bi-people-fill"></i> Staff / Users
                        </a>
                    </li>
                </c:if>
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/products"
                        class="sidebar-link ${pageContext.request.requestURI.contains('/products') ? 'active' : ''}">
                        <i class="bi bi-box-fill"></i> Products
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/suppliers"
                        class="sidebar-link ${pageContext.request.requestURI.contains('/suppliers') ? 'active' : ''}">
                        <i class="bi bi-truck"></i> Suppliers
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/stockin"
                        class="sidebar-link ${pageContext.request.requestURI.contains('/stockin') ? 'active' : ''}">
                        <i class="bi bi-box-arrow-in-down"></i> Stock-In
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/stockout"
                        class="sidebar-link ${pageContext.request.requestURI.contains('/stockout') ? 'active' : ''}">
                        <i class="bi bi-box-arrow-up"></i> Stock-Out
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/alerts"
                        class="sidebar-link ${pageContext.request.requestURI.contains('/alerts') ? 'active' : ''}">
                        <i class="bi bi-bell-fill"></i> Alerts
                    </a>
                </li>
            </ul>

            <hr style="border-color: rgba(255,255,255,0.15); margin: 8px 16px;">

            <ul class="sidebar-menu" style="margin-top:0;">
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/logout" class="sidebar-link" style="color:#ff6b6b;"
                        onmouseover="this.style.background='rgba(255,107,107,0.12)'"
                        onmouseout="this.style.background=''">
                        <i class="bi bi-box-arrow-left"></i> Log Out
                    </a>
                </li>
            </ul>
        </nav>