<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>SIMS - View Users</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body class="bg-light">

            <div class="wrapper">
                <jsp:include page="sidebar.jsp" />
                <div class="main-content">
                    <jsp:include page="topbar.jsp" />
                    <div class="page-content">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2>User Management</h2>
                            <a href="${pageContext.request.contextPath}/users/add" class="btn btn-success">Add New
                                User</a>
                        </div>

                        <div class="row mb-4">
                            <div class="col-12 col-md-6">
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0">
                                        <i class="bi bi-search text-muted"></i>
                                    </span>
                                    <input type="text" id="userSearch" class="form-control border-start-0 ps-0"
                                        placeholder="Search by name, email, phone or role..."
                                        oninput="filterTable('userSearch', 'userTable')">
                                </div>
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
                                                    <a href="${pageContext.request.contextPath}/users/edit/${user.id}"
                                                        class="btn btn-sm btn-primary">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/users/delete/${user.id}"
                                                        class="btn btn-sm btn-danger"
                                                        onclick="return confirm('Are you sure?')">Delete</a>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                function filterTable(inputId, tableId) {
                    let input = document.getElementById(inputId);
                    let filter = input.value.toLowerCase();
                    let table = document.getElementById(tableId);
                    let tr = table.getElementsByTagName("tr");

                    for (let i = 1; i < tr.length; i++) {
                        let show = false;
                        let td = tr[i].getElementsByTagName("td");
                        for (let j = 0; j < td.length; j++) {
                            if (td[j]) {
                                if (td[j].innerText.toLowerCase().indexOf(filter) > -1) {
                                    show = true;
                                    break;
                                }
                            }
                        }
                        tr[i].style.display = show ? "" : "none";
                    }
                }
            </script>
        </body>

        </html>