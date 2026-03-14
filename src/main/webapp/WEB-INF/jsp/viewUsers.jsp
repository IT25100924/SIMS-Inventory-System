<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SIMS - View Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="wrapper">
        <jsp:include page="sidebar.jsp" />
        <div class="main-content">
            <jsp:include page="topbar.jsp" />
            <div class="page-content">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>User Management</h2>
                    <a href="${pageContext.request.contextPath}/users/add" class="btn btn-success">Add New User</a>
                </div>

                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="userSearch" class="form-control border-start-0"
                            placeholder="Search by name, email, phone or role..."
                            oninput="filterTable('userSearch', 'userTable')">
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-body">
                        <table class="table table-striped table-hover" id="userTable">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td>${user.email}</td>
                                        <td>${user.phone}</td>
                                        <td><span class="badge bg-primary">${user.role}</span></td>
                                        <td>
                                            <div class="table-actions">
                                                <a href="${pageContext.request.contextPath}/users/edit/${user.id}"
                                                    class="action-btn action-btn-edit"
                                                    style="display:inline-flex;align-items:center;justify-content:center;gap:6px;min-width:84px;padding:9px 14px;border-radius:999px;border:1px solid rgba(138,43,226,0.14);background:rgba(138,43,226,0.10);color:#7c3aed;text-decoration:none;font-size:0.8rem;font-weight:700;line-height:1;box-shadow:0 8px 18px rgba(138,43,226,0.12);"
                                                    onmouseover="this.style.background='linear-gradient(135deg,#8a2be2 0%,#aa00ff 100%)';this.style.color='#ffffff';this.style.borderColor='transparent';"
                                                    onmouseout="this.style.background='rgba(138,43,226,0.10)';this.style.color='#7c3aed';this.style.borderColor='rgba(138,43,226,0.14)';"><i class="bi bi-pencil-square"></i><span>Edit</span></a>
                                                <a href="${pageContext.request.contextPath}/users/delete/${user.id}"
                                                    class="action-btn action-btn-delete"
                                                    style="display:inline-flex;align-items:center;justify-content:center;gap:6px;min-width:84px;padding:9px 14px;border-radius:999px;border:1px solid rgba(220,53,69,0.14);background:rgba(220,53,69,0.08);color:#dc3545;text-decoration:none;font-size:0.8rem;font-weight:700;line-height:1;box-shadow:0 8px 18px rgba(220,53,69,0.10);"
                                                    onmouseover="this.style.background='#dc3545';this.style.color='#ffffff';this.style.borderColor='transparent';"
                                                    onmouseout="this.style.background='rgba(220,53,69,0.08)';this.style.color='#dc3545';this.style.borderColor='rgba(220,53,69,0.14)';"
                                                    onclick="return confirm('Are you sure?')"><i class="bi bi-trash3"></i><span>Delete</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty users}">
                                    <tr>
                                        <td colspan="6" class="text-center">No users found.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterTable(inputId, tableId) {
            var query = document.getElementById(inputId).value.toLowerCase();
            var rows = document.getElementById(tableId).getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            for (var i = 0; i < rows.length; i++) {
                var text = rows[i].innerText.toLowerCase();
                rows[i].style.display = text.includes(query) ? '' : 'none';
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
