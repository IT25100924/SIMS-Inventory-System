<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>SIMS - Record Stock Out</title>
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
                                <h3 class="mb-0">Record Stock Out (Sale/Distribution)</h3>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/stockout/add" method="post">
                                    <div class="mb-3">
                                        <label class="form-label">Product</label>
                                        <select name="productId" class="form-select" required>
                                            <option value="">Select Product...</option>
                                            <c:forEach var="prod" items="${products}">
                                                <option value="${prod.id}">${prod.name} (Current Qty: ${prod.quantity})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Destination / Customer</label>
                                        <input type="text" name="destination" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Quantity</label>
                                        <input type="number" name="quantity" class="form-control" required min="1">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Unit Price Sold ($)</label>
                                        <input type="number" step="0.01" name="unitPrice" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Date</label>
                                        <input type="date" name="date" class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">Save Stock Out</button>
                                    <a href="${pageContext.request.contextPath}/stockout" class="btn btn-secondary w-100 mt-2">Cancel</a>
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



