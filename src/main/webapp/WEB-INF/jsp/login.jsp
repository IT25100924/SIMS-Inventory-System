<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SIMS - Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <style>
            /* ── Login-specific overrides ── */
            body.login-page {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #f3e8ff 0%, #e9d5ff 40%, #ddd6fe 100%);
                position: relative;
                overflow: hidden;
            }

            /* Decorative blobs */
            body.login-page::before,
            body.login-page::after {
                content: '';
                position: fixed;
                border-radius: 50%;
                filter: blur(80px);
                opacity: 0.35;
                pointer-events: none;
            }

            body.login-page::before {
                width: 500px;
                height: 500px;
                background: #8a2be2;
                top: -120px;
                left: -120px;
            }

            body.login-page::after {
                width: 400px;
                height: 400px;
                background: #aa00ff;
                bottom: -100px;
                right: -100px;
            }

            .login-card {
                background: rgba(255, 255, 255, 0.80);
                backdrop-filter: blur(18px);
                -webkit-backdrop-filter: blur(18px);
                border: 1px solid rgba(255, 255, 255, 0.6);
                border-radius: 20px;
                padding: 48px 40px 40px;
                width: 100%;
                max-width: 420px;
                box-shadow: 0 20px 60px rgba(138, 43, 226, 0.15), 0 4px 16px rgba(0, 0, 0, 0.06);
                animation: slideUp 0.45s cubic-bezier(0.16, 1, 0.3, 1) both;
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .login-brand {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                margin-bottom: 8px;
            }

            .login-brand-icon {
                width: 48px;
                height: 48px;
                border-radius: 14px;
                background: var(--primary-gradient);
                display: flex;
                align-items: center;
                justify-content: center;
                color: #fff;
                font-size: 1.5rem;
                box-shadow: 0 4px 14px rgba(138, 43, 226, 0.4);
            }

            .login-brand-name {
                font-size: 1.9rem;
                font-weight: 800;
                background: var(--primary-gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                letter-spacing: -0.5px;
            }

            .login-subtitle {
                text-align: center;
                color: var(--text-muted);
                font-size: 0.9rem;
                margin-bottom: 32px;
            }

            .login-label {
                font-weight: 600;
                font-size: 0.85rem;
                color: var(--text-main);
                margin-bottom: 6px;
            }

            .login-input-wrap {
                position: relative;
            }

            .login-input-wrap i {
                position: absolute;
                left: 14px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--text-muted);
                font-size: 1rem;
                pointer-events: none;
            }

            .login-input-wrap .form-control {
                padding-left: 40px;
                border-radius: 10px;
                border: 1.5px solid var(--border-color);
                font-size: 0.93rem;
                transition: border-color 0.2s, box-shadow 0.2s;
            }

            .login-input-wrap .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px var(--primary-light);
            }

            .toggle-password {
                position: absolute;
                right: 14px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                color: var(--text-muted);
                font-size: 1rem;
                transition: color 0.2s;
            }

            .toggle-password:hover {
                color: var(--primary-color);
            }

            .btn-login {
                background: var(--primary-gradient);
                border: none;
                border-radius: 10px;
                padding: 12px;
                font-weight: 600;
                font-size: 0.97rem;
                letter-spacing: 0.2px;
                transition: opacity 0.2s, transform 0.15s;
                box-shadow: 0 4px 14px rgba(138, 43, 226, 0.35);
            }

            .btn-login:hover {
                opacity: 0.92;
                transform: translateY(-1px);
            }

            .btn-login:active {
                transform: translateY(0);
            }

            .error-alert {
                border-radius: 10px;
                font-size: 0.88rem;
                padding: 10px 14px;
                border: none;
                background-color: #f8d7da;
                color: #842029;
                display: flex;
                align-items: center;
                gap: 8px;
                animation: shake 0.4s ease;
            }

            @keyframes shake {

                0%,
                100% {
                    transform: translateX(0);
                }

                20% {
                    transform: translateX(-6px);
                }

                40% {
                    transform: translateX(6px);
                }

                60% {
                    transform: translateX(-4px);
                }

                80% {
                    transform: translateX(4px);
                }
            }

            .login-footer {
                text-align: center;
                margin-top: 20px;
                font-size: 0.8rem;
                color: var(--text-muted);
            }
        </style>
    </head>

    <body class="login-page">

        <div class="login-card">

            <!-- Brand -->
            <div class="login-brand">
                <div class="login-brand-icon">
                    <i class="bi bi-boxes"></i>
                </div>
                <span class="login-brand-name">SIMS</span>
            </div>
            <p class="login-subtitle">Smart Inventory Management System</p>

            <!-- Error alert -->
            <% if (request.getAttribute("error") !=null) { %>
                <div class="error-alert mb-3">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>

                    <!-- Login form -->
                    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>

                        <div class="mb-4">
                            <label class="login-label">Email Address</label>
                            <div class="login-input-wrap">
                                <i class="bi bi-envelope"></i>
                                <input type="email" name="email" class="form-control" placeholder="you@example.com"
                                    required autofocus>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="login-label">Password</label>
                            <div class="login-input-wrap">
                                <i class="bi bi-lock"></i>
                                <input type="password" name="password" id="passwordInput" class="form-control"
                                    placeholder="Enter your password" required>
                                <i class="bi bi-eye toggle-password" id="togglePwd"></i>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-login btn-primary w-100 text-white">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
                        </button>

                    </form>

                    <div class="login-footer">
                        &copy; 2025 SIMS &mdash; Inventory Management
                    </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Toggle password visibility
            document.getElementById('togglePwd').addEventListener('click', function () {
                const input = document.getElementById('passwordInput');
                const isHidden = input.type === 'password';
                input.type = isHidden ? 'text' : 'password';
                this.classList.toggle('bi-eye', !isHidden);
                this.classList.toggle('bi-eye-slash', isHidden);
            });
        </script>
    </body>

    </html>