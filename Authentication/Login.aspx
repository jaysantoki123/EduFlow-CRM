<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EduFlow.Authentication.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Education CRM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="js/auth.js"></script>
    <style>
        :root {
            --primary: #4f46e5;
            --primary-dark: #3525cd;
            --secondary: #0051d5;
            --surface: #f9f9ff;
            --surface-bright: #ffffff;
            --on-surface: #111c2d;
            --on-surface-variant: #464555;
            --outline: #777587;
            --border-subtle: #E2E8F0;
            --sidebar-bg: #0F172A;
            --success: #22C55E;
            --error: #ba1a1a;
            --background-main: #F8FAFC;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 16px;
            position: relative;
            overflow: hidden;
        }

            body::before {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(79, 70, 229, 0.3) 0%, transparent 70%);
                top: -250px;
                right: -250px;
                border-radius: 50%;
                animation: float 6s ease-in-out infinite;
            }

            body::after {
                content: '';
                position: absolute;
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, rgba(0, 81, 213, 0.2) 0%, transparent 70%);
                bottom: -200px;
                left: -200px;
                border-radius: 50%;
                animation: float 8s ease-in-out infinite reverse;
            }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(20px);
            }
        }

        .auth-container {
            width: 100%;
            max-width: 480px;
            position: relative;
            z-index: 1;
        }

        .auth-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 1rem;
            border: 1px solid rgba(226, 232, 240, 0.5);
            padding: 48px 40px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .auth-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .auth-logo {
            width: 64px;
            height: 64px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
        }

            .auth-logo i {
                color: white;
                font-size: 32px;
            }

        .auth-title {
            font-family: 'Montserrat', sans-serif;
            font-size: 32px;
            font-weight: 700;
            color: var(--on-surface);
            margin-bottom: 8px;
            line-height: 1.2;
        }

        .auth-subtitle {
            font-size: 14px;
            color: var(--on-surface-variant);
            font-weight: 400;
            line-height: 20px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: 8px;
            letter-spacing: 0.05em;
        }

        .form-control {
            height: 48px;
            border: 1px solid var(--border-subtle);
            border-radius: 0.5rem;
            padding: 12px 16px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
        }

            .form-control:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
                outline: none;
                background: white;
            }

            .form-control.is-invalid {
                border-color: var(--error);
            }

                .form-control.is-invalid:focus {
                    box-shadow: 0 0 0 3px rgba(186, 26, 26, 0.1);
                }

        .invalid-feedback {
            font-size: 12px;
            margin-top: 4px;
            color: var(--error);
        }

        .password-toggle {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--on-surface-variant);
            cursor: pointer;
            padding: 4px;
            transition: color 0.2s;
        }

            .password-toggle:hover {
                color: var(--primary);
            }

        .form-check-input {
            width: 18px;
            height: 18px;
            border: 2px solid var(--border-subtle);
            border-radius: 0.25rem;
            cursor: pointer;
        }

            .form-check-input:checked {
                background-color: var(--primary);
                border-color: var(--primary);
            }

        .form-check-label {
            font-size: 14px;
            color: var(--on-surface-variant);
            margin-left: 8px;
            cursor: pointer;
        }

        .btn-primary {
            height: 48px;
            background: linear-gradient(180deg, var(--primary) 0%, var(--primary-dark) 100%);
            border: none;
            border-radius: 0.5rem;
            font-size: 16px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.3);
        }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.4);
                background: linear-gradient(180deg, var(--primary-dark) 0%, var(--primary) 100%);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            .btn-primary:disabled {
                opacity: 0.6;
                cursor: not-allowed;
                transform: none;
            }

        .forgot-link {
            color: var(--primary);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s;
        }

            .forgot-link:hover {
                color: var(--primary-dark);
                text-decoration: underline;
            }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 24px 0;
        }

            .divider::before,
            .divider::after {
                content: '';
                flex: 1;
                border-bottom: 1px solid var(--border-subtle);
            }

            .divider span {
                padding: 0 16px;
                color: var(--on-surface-variant);
                font-size: 12px;
                font-weight: 500;
            }

        .btn-outline {
            height: 48px;
            background: white;
            border: 1px solid var(--border-subtle);
            border-radius: 0.5rem;
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

            .btn-outline:hover {
                border-color: var(--primary);
                background: rgba(79, 70, 229, 0.05);
                color: var(--primary);
            }

            .btn-outline img {
                width: 20px;
                height: 20px;
            }

        .auth-footer {
            text-align: center;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid var(--border-subtle);
        }

            .auth-footer p {
                font-size: 14px;
                color: var(--on-surface-variant);
                margin: 0;
            }

            .auth-footer a {
                color: var(--primary);
                font-weight: 600;
                text-decoration: none;
            }

                .auth-footer a:hover {
                    text-decoration: underline;
                }

        .spinner-border-sm {
            width: 16px;
            height: 16px;
            border-width: 2px;
        }

        @media (max-width: 576px) {
            .auth-card {
                padding: 32px 24px;
            }

            .auth-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <div class="auth-logo">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <h1 class="auth-title">Welcome Back</h1>
                <p class="auth-subtitle">Sign in to your account to continue</p>
            </div>

            <form id="login_form" runat="server">
                <div id="loginFormPanel" class="login-form-container" runat="server">
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">EMAIL ADDRESS</label>
                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter your email"
                            ClientIDMode="Static">
        </asp:TextBox>

                        <!-- ASP.NET Validator replacing the static invalid-feedback -->
                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="text-danger small"
                            Display="Dynamic"
                            ErrorMessage="Please enter a valid email address"
                            ValidationGroup="LoginGroup" />
                    </div>

                    <div class="mb-3">
                        <label for="txtPassword" class="form-label">PASSWORD</label>
                        <div style="position: relative;">
                            <asp:TextBox
                                ID="txtPassword"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                placeholder="Enter your password"
                                ClientIDMode="Static">
            </asp:TextBox>
                            <button type="button" class="password-toggle" id="togglePassword" onclick="togglePasswordVisibility()">
                                <i class="fas fa-eye" id="eyeIcon"></i>
                            </button>
                        </div>

                        <asp:RequiredFieldValidator
                            ID="rfvPassword"
                            runat="server"
                            ControlToValidate="txtPassword"
                            CssClass="text-danger small"
                            Display="Dynamic"
                            ErrorMessage="Password is required"
                            ValidationGroup="LoginGroup" />
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" ClientIDMode="Static" />
                            <label class="form-check-label" for="chkRememberMe">
                                Remember me
           
                            </label>
                        </div>
                        <asp:HyperLink ID="lnkForgot" runat="server" NavigateUrl="forgot-password.aspx" CssClass="forgot-link">
            Forgot Password?
        </asp:HyperLink>
                    </div>

                    <asp:LinkButton
                        ID="btnLogin"
                        runat="server"
                        CssClass="btn btn-primary w-100"
                        ValidationGroup="LoginGroup"
                        OnClick="btnLogin_Click"
                        OnClientClick="if(Page_ClientValidate('LoginGroup')) { showSpinner(); return true; } else { return false; }">
        <span id="btnText">Sign In</span>
        <span id="btnSpinner" class="spinner-border spinner-border-sm d-none" role="status">
            <span class="visually-hidden">Loading...</span>
        </span>
    </asp:LinkButton>
                </div>
            </form>

            <div class="divider">
                <span>QUICK DEMO ACCESS</span>
            </div>

            <div class="d-flex flex-column gap-2">
                <button type="button" class="btn text-white" style="background: linear-gradient(135deg, #4f46e5 0%, #3525cd 100%); font-weight: 600; border: none;" onclick="quickLogin('admin')">
                    <i class="fas fa-user-shield me-2"></i>Log in as Admin
                </button>
                <button type="button" class="btn text-white" style="background: linear-gradient(135deg, #0051d5 0%, #0041a8 100%); font-weight: 600; border: none;" onclick="quickLogin('manager')">
                    <i class="fas fa-user-tie me-2"></i>Log in as Admission Manager
                </button>
                <button type="button" class="btn text-white" style="background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%); font-weight: 600; border: none;" onclick="quickLogin('counselor')">
                    <i class="fas fa-user me-2"></i>Log in as Counselor
                </button>
                <button type="button" class="btn text-white" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); font-weight: 600; border: none;" onclick="quickLogin('student')">
                    <i class="fas fa-graduation-cap me-2"></i>Log in as Student Portal
                </button>
            </div>

            <div class="auth-footer">
                <p>Don't have an account? <a href="#">Contact Administrator</a></p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
