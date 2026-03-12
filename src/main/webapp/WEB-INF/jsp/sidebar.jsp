<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!-- Sidebar Component -->
        <nav class="sidebar">
            <a href="${pageContext.request.contextPath}/" class="sidebar-brand">
                <i class="bi bi-box-seam-fill"></i> SIMS
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
        </nav>