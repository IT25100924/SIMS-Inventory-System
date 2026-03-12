<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>SIMS - View Stock Out History</title>
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
                                <h2>Stock Out History (Sales)</h2>
                                <a href="${pageContext.request.contextPath}/stockout/add" class="btn btn-success">Record
                                    New Stock Out</a>
                            </div>

                            <!-- Search Bar -->
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0"><i
                                            class="bi bi-search text-muted"></i></span>
                                    <input type="text" id="stockOutSearch" class="form-control border-start-0"
                                        placeholder="Search by product ID, destination or date..."
                                        oninput="filterTable('stockOutSearch', 'stockOutTable')">
                                </div>
                            </div>

                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <table class="table table-striped table-hover" id="stockOutTable">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Product ID</th>
                                                <th>Destination</th>
                                                <th>Quantity</th>
                                                <th>Unit Price ($)</th>
                                                <th>Total Revenue ($)</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="stockout" items="${stockOuts}">
                                                <tr>
                                                    <td>${stockout.id}</td>
                                                    <td>${stockout.productId}</td>
                                                    <td>${stockout.destination}</td>
                                                    <td><span class="badge bg-danger">-${stockout.quantity}</span></td>
                                                    <td>${stockout.unitPrice}</td>
                                                    <td class="fw-bold">${stockout.quantity * stockout.unitPrice}</td>
                                                    <td>${stockout.date}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty stockOuts}">
                                                <tr>
                                                    <td colspan="7" class="text-center">No stock out records found.</td>
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