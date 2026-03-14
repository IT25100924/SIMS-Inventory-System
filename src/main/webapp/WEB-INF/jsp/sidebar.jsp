<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!-- Sidebar Component -->
        <nav class="sidebar">
            <a href="${pageContext.request.contextPath}/" class="brand-container"
                style="display:flex;align-items:center;gap:12px;margin:20px 20px 18px;padding-bottom:18px;border-bottom:1px solid #eef0f4;text-decoration:none;">
                <div class="brand-mark"
                    style="width:42px;height:42px;min-width:42px;border-radius:12px;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,#f3e8ff 0%,#ffffff 100%);box-shadow:0 6px 16px rgba(138,43,226,0.12);overflow:hidden;">
                    <img src="${pageContext.request.contextPath}/images/sims-logo.png" alt="SIMS logo" class="brand-logo"
                        style="width:26px;height:26px;display:block;object-fit:contain;">
                </div>
                <div class="brand-copy" style="display:flex;flex-direction:column;min-width:0;line-height:1.1;">
                    <span class="brand-name"
                        style="font-family:'Inter',sans-serif;font-size:1.2rem;font-weight:800;letter-spacing:-0.03em;color:#1f2937;">SIMS</span>
                    <span class="brand-tagline"
                        style="font-family:'Inter',sans-serif;margin-top:4px;font-size:0.7rem;font-weight:700;letter-spacing:0.12em;text-transform:uppercase;color:#7c3aed;">Inventory System</span>
                </div>
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

            <ul class="sidebar-menu sidebar-menu-secondary"
                style="margin-top:auto;padding-top:18px;padding-bottom:20px;border-top:1px solid #e9ecef;">
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/logout" class="sidebar-link sidebar-link-logout"
                        style="color:#dc3545;font-weight:600;"
                        onmouseover="this.style.backgroundColor='rgba(220,53,69,0.12)'; this.style.color='#dc3545';"
                        onmouseout="this.style.backgroundColor=''; this.style.color='#dc3545';">
                        <i class="bi bi-box-arrow-left"></i> Log Out
                    </a>
                </li>
            </ul>
        </nav>
