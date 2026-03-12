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
            <header class="topbar"
                style="height: 80px !important; display: flex; justify-content: flex-end; align-items: center; padding: 0 40px; box-sizing: border-box; background: #ffffff; border-bottom: 1px solid rgba(0,0,0,0.06); position: sticky; top: 0; z-index: 1000;">
                <div class="topbar-right" style="display: flex; align-items: center; gap: 32px;">
                    <a href="${pageContext.request.contextPath}/alerts" class="notification-bell"
                        style="color: var(--text-muted); font-size: 1.4rem; transition: all 0.2s; cursor: pointer; text-decoration: none; display: flex; align-items: center; position: relative;"
                        onmouseover="this.style.color='var(--primary-color)'"
                        onmouseout="this.style.color='var(--text-muted)'">
                        <i class="bi bi-bell-fill"></i>
                        <span class="notification-badge"
                            style="background: #ef4444; border: 2.5px solid #fff; width: 10px; height: 10px; top: -1px; right: -1px; position: absolute; border-radius: 50%;"></span>
                    </a>

                    <div class="user-profile"
                        style="display: flex; align-items: center; gap: 14px; background: rgba(108, 99, 255, 0.08); backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px); border: 1px solid rgba(108, 99, 255, 0.12); border-radius: 16px; padding: 8px 18px 8px 8px; cursor: pointer; transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); min-width: 160px;"
                        onmouseover="this.style.background='rgba(108, 99, 255, 0.15)'; this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 15px rgba(108, 99, 255, 0.15)';"
                        onmouseout="this.style.background='rgba(108, 99, 255, 0.08)'; this.style.transform='translateY(0)'; this.style.boxShadow='none';">

                        <div class="avatar"
                            style="width: 42px; height: 42px; border-radius: 12px; background: linear-gradient(135deg, #6c63ff 0%, #a855f7 100%); color: #fff; font-weight: 700; font-size: 1rem; display: flex; align-items: center; justify-content: center; flex-shrink: 0; box-shadow: 0 4px 12px rgba(108, 99, 255, 0.3);">
                            <%= initials %>
                        </div>

                        <div class="user-info" style="display: flex; flex-direction: column; line-height: 1.2;">
                            <span
                                style="font-weight: 700; font-size: 0.95rem; color: #1e293b; letter-spacing: -0.01em; white-space: nowrap;">
                                <%= displayName %>
                            </span>
                            <span
                                style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.06em; color: #6366f1; margin-top: 2px;">
                                <%= displayRole %>
                            </span>
                        </div>
                    </div>
                </div>
            </header>