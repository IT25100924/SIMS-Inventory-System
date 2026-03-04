<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>SIMS - Edit Product</title>
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
                            <h3 class="mb-0">Edit Product</h3>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/products/edit" method="post">
                                <input type="hidden" name="id" value="${product.id}">
                                <div class="mb-3">
                                    <label class="form-label">Product Name</label>
                                    <input type="text" name="name" class="form-control" value="${product.name}"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Unit Price ($)</label>
                                    <input type="number" step="0.01" name="price" class="form-control"
                                        value="${product.price}" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Quantity</label>
                                    <input type="number" name="quantity" class="form-control"
                                        value="${product.quantity}" required readonly>
                                    <small class="text-muted">Quantity can only be changed via Stock In/Out
                                        transactions.</small>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Update Product</button>
                                <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary w-100 mt-2">Cancel</a>
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



