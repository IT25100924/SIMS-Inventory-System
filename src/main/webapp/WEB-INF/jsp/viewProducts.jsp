<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>SIMS - View Products</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body class="bg-light">
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
                                <h2>Product Catalog</h2>
                                <a href="${pageContext.request.contextPath}/products/add" class="btn btn-success">Add
                                    New Product</a>
                            </div>

                            <!-- Search Bar -->
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0"><i
                                            class="bi bi-search text-muted"></i></span>
                                    <input type="text" id="productSearch" class="form-control border-start-0"
                                        placeholder="Search by product name or ID..."
                                        oninput="filterTable('productSearch', 'productTable')">
                                </div>
                            </div>

                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <table class="table table-striped table-hover" id="productTable">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Price ($)</th>
                                                <th>Quantity in Stock</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>${product.name}</td>
                                                    <td>${product.price}</td>
                                                    <td>
                                                        <span
                                                            class="badge ${product.quantity < 10 ? 'bg-danger' : 'bg-success'}">
                                                            ${product.quantity}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/products/edit/${product.id}"
                                                            class="btn btn-sm btn-primary">Edit</a>
                                                        <a href="${pageContext.request.contextPath}/products/delete/${product.id}"
                                                            class="btn btn-sm btn-danger"
                                                            onclick="return confirm('Are you sure?')">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty products}">
                                                <tr>
                                                    <td colspan="5" class="text-center">No products found.</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
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
                        </div>
                    </div>
                </div>

        </html>