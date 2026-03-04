<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>SIMS - System Alerts</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

        <body class="bg-light">

            <div class="wrapper">
    <jsp:include page="sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="topbar.jsp"/>
        <div class="page-content">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>System Alerts</h2>
                    <a href="${pageContext.request.contextPath}/alerts/add" class="btn btn-success">Create Alert</a>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>Date</th>
                                    <th>Level</th>
                                    <th>Message</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="alert" items="${alerts}">
                                    <tr>
                                        <td>${alert.date}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${alert.level == 'CRITICAL'}">
                                                    <span class="badge bg-danger">${alert.level}</span>
                                                </c:when>
                                                <c:when test="${alert.level == 'WARNING'}">
                                                    <span class="badge bg-warning text-dark">${alert.level}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-info text-dark">${alert.level}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${alert.message}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/alerts/delete/${alert.id}" class="btn btn-sm btn-outline-danger"
                                                onclick="return confirm('Dismiss alert?')">Dismiss</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty alerts}">
                                    <tr>
                                        <td colspan="4" class="text-center">No active alerts.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                    </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>



