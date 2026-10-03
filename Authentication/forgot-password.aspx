<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="EduFlow.Authentication.forgot_password" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password - Education CRM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .auth-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1) 0%, rgba(0, 81, 213, 0.1) 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            border: 2px solid rgba(79, 70, 229, 0.2);
        }

            .auth-icon i {
                color: var(--primary);
                font-size: 36px;
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

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--primary);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s;
            margin-top: 24px;
        }

            .back-link:hover {
                color: var(--primary-dark);
                gap: 12px;
            }

            .back-link i {
                font-size: 12px;
            }

        .success-message {
            background: rgba(34, 197, 94, 0.1);
            border: 1px solid rgba(34, 197, 94, 0.3);
            border-radius: 0.5rem;
            padding: 16px;
            margin-bottom: 24px;
            display: none;
        }

            .success-message.show {
                display: block;
                animation: slideIn 0.3s ease;
            }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-message-content {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .success-message-icon {
            width: 20px;
            height: 20px;
            background: var(--success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            margin-top: 2px;
        }

            .success-message-icon i {
                color: white;
                font-size: 12px;
            }

        .success-message-text h4 {
            font-size: 14px;
            font-weight: 600;
            color: var(--success);
            margin: 0 0 4px 0;
        }

        .success-message-text p {
            font-size: 13px;
            color: var(--on-surface-variant);
            margin: 0;
            line-height: 1.5;
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
                <div class="auth-icon">
                    <i class="fas fa-lock"></i>
                </div>
                <h1 class="auth-title">Forgot Password?</h1>
                <p class="auth-subtitle">No worries, we'll send you reset instructions</p>
            </div>

            <div class="success-message" id="successMessage">
                <div class="success-message-content">
                    <div class="success-message-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <div class="success-message-text">
                        <h4>Email Sent Successfully!</h4>
                        <p>We've sent password reset instructions to your email address. Please check your inbox and spam folder.</p>
                    </div>
                </div>
            </div>

            <form id="forgot_password" runat="server">
                <div id="forgotPasswordPanel">
                    <div class="mb-4">
                        <label for="txtEmail" class="form-label">EMAIL ADDRESS</label>
                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter your registered email"
                            ClientIDMode="Static">
        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            CssClass="text-danger small"
                            Display="Dynamic"
                            ErrorMessage="Please enter a valid email address"
                            ValidationGroup="ForgotGroup" />
                    </div>

                    <asp:LinkButton
                        ID="btnReset"
                        runat="server"
                        CssClass="btn btn-primary w-100"
                        ValidationGroup="ForgotGroup"
                        OnClick="btnReset_Click"
                        OnClientClick="if(Page_ClientValidate('ForgotGroup')) { showSpinner(); return true; } else { return false; }">
        <span id="btnText">Send Reset Link</span>
        <span id="btnSpinner" class="spinner-border spinner-border-sm d-none" role="status">
            <span class="visually-hidden">Loading...</span>
        </span>
    </asp:LinkButton>
                </div>
            </form>

            <div class="text-center">
                <a href="login.aspx" class="back-link">
                    <i class="fas fa-arrow-left"></i>
                    <span>Back to Login</span>
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function showSpinner() {
            document.getElementById('btnText').classList.add('d-none');
            document.getElementById('btnSpinner').classList.remove('d-none');
        }
</script>

</body>
</html>
