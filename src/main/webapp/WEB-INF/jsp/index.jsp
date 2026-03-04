<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>SIMS - Dashboard</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Bootstrap Icons -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <!-- Custom CSS -->
            <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        </head>

        <body>

            <div class="wrapper">
                <!-- Import Sidebar -->
                <jsp:include page="sidebar.jsp" />

                <!-- Main Content -->
                <div class="main-content">
                    <!-- Import Topbar -->
                    <jsp:include page="topbar.jsp" />

                    <div class="page-content">
                        <h1 class="page-title">Dashboard Overview</h1>
                        <p class="page-subtitle">Welcome back, here's what's happening today.</p>

                        <div class="row g-4 mb-4">
                            <!-- Stat Card 1 -->
                            <div class="col-12 col-md-6 col-xl-3">
                                <div class="dashboard-card stat-card">
                                    <div class="stat-info">
                                        <span class="stat-label">Total Items</span>
                                        <span class="stat-value">${totalItems}</span>
                                        <span class="stat-trend trend-up"><i class="bi bi-arrow-up-right"></i> +12% from
                                            last month</span>
                                    </div>
                                    <div class="stat-icon icon-purple">
                                        <i class="bi bi-stack"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Stat Card 2 -->
                            <div class="col-12 col-md-6 col-xl-3">
                                <div class="dashboard-card stat-card">
                                    <div class="stat-info">
                                        <span class="stat-label">Low Stock Alerts</span>
                                        <span class="stat-value text-danger">${lowStockAlerts}</span>
                                        <span class="stat-trend trend-down"><i class="bi bi-exclamation-triangle"></i>
                                            Needs
                                            immediate action</span>
                                    </div>
                                    <div class="stat-icon icon-red">
                                        <i class="bi bi-exclamation-circle"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Stat Card 3 -->
                            <div class="col-12 col-md-6 col-xl-3">
                                <div class="dashboard-card stat-card">
                                    <div class="stat-info">
                                        <span class="stat-label">Today's Shipments</span>
                                        <span class="stat-value">${todayShipments}</span>
                                        <span class="stat-trend trend-up"><i class="bi bi-check-circle"></i> 98% on
                                            time</span>
                                    </div>
                                    <div class="stat-icon icon-purple">
                                        <i class="bi bi-truck"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Stat Card 4 -->
                            <div class="col-12 col-md-6 col-xl-3">
                                <div class="dashboard-card stat-card">
                                    <div class="stat-info">
                                        <span class="stat-label">Total Suppliers</span>
                                        <span class="stat-value">${totalSuppliers}</span>
                                        <span class="stat-trend trend-up"><i class="bi bi-plus"></i> 3 new this
                                            week</span>
                                    </div>
                                    <div class="stat-icon icon-purple">
                                        <i class="bi bi-shop"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row g-4 mb-4">
                            <!-- Recent Transactions Table -->
                            <div class="col-12 col-xl-8">
                                <div class="custom-table-container">
                                    <div class="custom-table-header">
                                        <h5>Recent Transactions</h5>
                                        <a href="#" class="btn btn-sm text-primary fw-bold text-decoration-none">View
                                            All</a>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>TXN ID</th>
                                                <th>ITEM</th>
                                                <th>TYPE</th>
                                                <th>DATE</th>
                                                <th>STATUS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="txn" items="${recentTransactions}">
                                                <c:set var="type" value="${txn.type}" />
                                                <tr>
                                                    <td><span class="text-muted fw-bold">${txn.id}</span></td>
                                                    <td><span class="fw-semibold">${productNames[txn.productId]}</span>
                                                    </td>
                                                    <c:choose>
                                                        <c:when test="${type == 'StockIn'}">
                                                            <td class="text-success"><i
                                                                    class="bi bi-arrow-down-short"></i> Stock-In</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="text-primary"><i
                                                                    class="bi bi-arrow-up-short"></i> Stock-Out</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td class="text-muted">${txn.date}</td>
                                                    <td><span class="status-badge status-completed">Completed</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty recentTransactions}">
                                                <tr>
                                                    <td colspan="5" class="text-center">No recent transactions.</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- Stock Trends Chart Placeholder -->
                            <div class="col-12 col-xl-4">
                                <div class="dashboard-card d-flex flex-column op-100">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h5 class="mb-0 fw-bold">Stock Trends</h5>
                                        <select class="form-select form-select-sm w-auto">
                                            <option>Last 7 Days</option>
                                            <option>Last 30 Days</option>
                                        </select>
                                    </div>
                                    <div class="flex-grow-1 d-flex align-items-center justify-content-center bg-light rounded"
                                        style="min-height: 250px; background: linear-gradient(180deg, rgba(138,43,226,0.05) 0%, rgba(138,43,226,0.2) 100%); position:relative;">
                                        <!-- Mockup of a line chart using CSS standard to match screenshot approx -->
                                        <svg width="100%" height="200" viewBox="0 0 400 200" preserveAspectRatio="none">
                                            <!-- Grid lines -->
                                            <line x1="0" y1="50" x2="400" y2="50" stroke="#e9ecef" stroke-width="1"
                                                stroke-dasharray="4" />
                                            <line x1="0" y1="100" x2="400" y2="100" stroke="#e9ecef" stroke-width="1"
                                                stroke-dasharray="4" />
                                            <line x1="0" y1="150" x2="400" y2="150" stroke="#e9ecef" stroke-width="1"
                                                stroke-dasharray="4" />

                                            <!-- Gradient Fill under line -->
                                            <linearGradient id="chartGradient" x1="0" x2="0" y1="0" y2="1">
                                                <stop offset="0%" stop-color="#8a2be2" stop-opacity="0.2" />
                                                <stop offset="100%" stop-color="#8a2be2" stop-opacity="0" />
                                            </linearGradient>
                                            <path d="M0,160 Q50,120 100,140 T200,150 T280,70 T400,20 L400,200 L0,200 Z"
                                                fill="url(#chartGradient)" />

                                            <!-- The Line itself -->
                                            <path d="M0,160 Q50,120 100,140 T200,150 T280,70 T400,20" fill="none"
                                                stroke="#d500f9" stroke-width="6" stroke-linecap="round" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> <!-- /.page-content -->
                </div> <!-- /.main-content -->
            </div> <!-- /.wrapper -->

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>