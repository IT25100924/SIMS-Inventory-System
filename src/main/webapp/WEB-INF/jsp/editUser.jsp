<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>SIMS - Edit User</title>
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
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-dark text-white">
                            <h3 class="mb-0">Edit User</h3>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/users/edit" method="post">
                                <input type="hidden" name="id" value="${user.id}">
                                <div class="mb-3">
                                    <label class="form-label">Name</label>
                                    <input type="text" name="name" class="form-control" value="${user.name}" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" value="${user.email}"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone</label>
                                    <input type="text" name="phone" class="form-control" value="${user.phone}" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Role</label>
                                    <select name="role" class="form-select" required>
                                        <option value="ADMIN" ${user.role=='ADMIN' ? 'selected' : '' }>ADMIN</option>
                                        <option value="MANAGER" ${user.role=='MANAGER' ? 'selected' : '' }>MANAGER
                                        </option>
                                        <option value="STAFF" ${user.role=='STAFF' ? 'selected' : '' }>STAFF</option>
                                    </select>
                                </div>
                                <!-- Keeping password hidden/simple for this university project -->
                                <input type="hidden" name="password" value="${user.password}">
                                <button type="submit" class="btn btn-primary w-100">Update User</button>
                                <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary w-100 mt-2">Cancel</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
                </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>



