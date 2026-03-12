<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.inventory.sims.model.User" %>
        <% User loggedIn=(User) session.getAttribute("loggedInUser"); String displayName=(loggedIn !=null) ?
            loggedIn.getName() : "User" ; String displayRole=(loggedIn !=null) ? loggedIn.getRole() : "" ; String
            initials="" ; if (displayName.trim().length()> 0) {
            String[] parts = displayName.trim().split("\\s+");
            initials += Character.toUpperCase(parts[0].charAt(0));
            if (parts.length > 1) initials += Character.toUpperCase(parts[parts.length - 1].charAt(0));
            }
            %>
            <!-- Topbar Component -->
            <header class="topbar">
                <div class="topbar-right">
                    <div class="notification-bell">
                        <i class="bi bi-bell-fill"></i>
                        <span class="notification-badge"></span>
                    </div>

                    <div class="user-profile">
                        <div class="avatar">
                            <%= initials %>
                        </div>
                        <div class="user-info">
                            <span class="user-name">
                                <%= displayName %>
                            </span>
                            <span class="user-role">
                                <%= displayRole %>
                            </span>
                        </div>
                    </div>

                    <a href="${pageContext.request.contextPath}/logout" title="Logout"
                        style="color: var(--text-muted); font-size: 1.2rem; text-decoration: none; transition: color 0.2s;"
                        onmouseover="this.style.color='#dc3545'" onmouseout="this.style.color='var(--text-muted)'">
                        <i class="bi bi-box-arrow-right"></i>
                    </a>
                </div>
            </header>