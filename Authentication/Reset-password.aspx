<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset-password.aspx.cs" Inherits="EduFlow.Authentication.Reset_password" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - Education CRM</title>
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

            .form-control.is-valid {
                border-color: var(--success);
            }

                .form-control.is-valid:focus {
                    box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.1);
                }

        .invalid-feedback,
        .valid-feedback {
            font-size: 12px;
            margin-top: 4px;
        }

        .invalid-feedback {
            color: var(--error);
        }

        .valid-feedback {
            color: var(--success);
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

        .password-strength {
            margin-top: 12px;
            padding: 12px;
            background: rgba(79, 70, 229, 0.05);
            border-radius: 0.5rem;
            border: 1px solid rgba(79, 70, 229, 0.1);
        }

        .password-strength-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: 8px;
            display: block;
        }

        .password-strength-bar {
            height: 4px;
            background: var(--border-subtle);
            border-radius: 2px;
            overflow: hidden;
            margin-bottom: 12px;
        }

        .password-strength-progress {
            height: 100%;
            width: 0;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

            .password-strength-progress.weak {
                width: 33%;
                background: var(--error);
            }

            .password-strength-progress.medium {
                width: 66%;
                background: #F59E0B;
            }

            .password-strength-progress.strong {
                width: 100%;
                background: var(--success);
            }

        .password-requirements {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .password-requirements li {
                font-size: 12px;
                color: var(--on-surface-variant);
                padding: 4px 0;
                display: flex;
                align-items: center;
                gap: 8px;
            }

                .password-requirements li i {
                    font-size: 10px;
                    color: var(--border-subtle);
                }

                .password-requirements li.valid {
                    color: var(--success);
                }

                    .password-requirements li.valid i {
                        color: var(--success);
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
                    <i class="fas fa-key"></i>
                </div>
                <h1 class="auth-title">Set New Password</h1>
                <p class="auth-subtitle">Your new password must be different from previously used passwords</p>
            </div>

            <form id="reset_password" runat="server">
                <div id="resetPasswordPanel">
                    <div class="mb-3">
                        <label for="txtNewPassword" class="form-label">NEW PASSWORD</label>
                        <div style="position: relative;">
                            <asp:TextBox
                                ID="txtNewPassword"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                placeholder="Enter new password"
                                ClientIDMode="Static"
                                oninput="checkPasswordStrength()">
            </asp:TextBox>
                            <button type="button" class="password-toggle" id="toggleNewPassword" onclick="togglePassword('txtNewPassword', 'eyeIconNew')">
                                <i class="fas fa-eye" id="eyeIconNew"></i>
                            </button>
                        </div>

                        <asp:RequiredFieldValidator
                            ID="rfvNewPassword"
                            runat="server"
                            ControlToValidate="txtNewPassword"
                            CssClass="text-danger small d-block mt-1"
                            Display="Dynamic"
                            ErrorMessage="Password is required"
                            ValidationGroup="ResetGroup" />

                        <asp:RegularExpressionValidator
                            ID="revNewPassword"
                            runat="server"
                            ControlToValidate="txtNewPassword"
                            CssClass="text-danger small d-block mt-1"
                            Display="Dynamic"
                            ErrorMessage="Password must meet all requirements"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                            ValidationGroup="ResetGroup" />
                    </div>

                    <!-- Password Strength UI remains standard HTML for client-side manipulation -->
                    <div class="password-strength">
                        <span class="password-strength-label">Password Strength</span>
                        <div class="password-strength-bar">
                            <div class="password-strength-progress" id="strengthBar"></div>
                        </div>
                        <ul class="password-requirements">
                            <li id="req-length">
                                <i class="fas fa-circle"></i>
                                <span>At least 8 characters</span>
                            </li>
                            <li id="req-uppercase">
                                <i class="fas fa-circle"></i>
                                <span>One uppercase letter</span>
                            </li>
                            <li id="req-lowercase">
                                <i class="fas fa-circle"></i>
                                <span>One lowercase letter</span>
                            </li>
                            <li id="req-number">
                                <i class="fas fa-circle"></i>
                                <span>One number</span>
                            </li>
                        </ul>
                    </div>

                    <div class="mb-4 mt-3">
                        <label for="txtConfirmPassword" class="form-label">CONFIRM PASSWORD</label>
                        <div style="position: relative;">
                            <asp:TextBox
                                ID="txtConfirmPassword"
                                runat="server"
                                CssClass="form-control"
                                TextMode="Password"
                                placeholder="Re-enter your password"
                                ClientIDMode="Static">
            </asp:TextBox>
                            <button type="button" class="password-toggle" id="toggleConfirmPassword" onclick="togglePassword('txtConfirmPassword', 'eyeIconConfirm')">
                                <i class="fas fa-eye" id="eyeIconConfirm"></i>
                            </button>
                        </div>

                        <asp:RequiredFieldValidator
                            ID="rfvConfirmPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            CssClass="text-danger small d-block mt-1"
                            Display="Dynamic"
                            ErrorMessage="Please confirm your password"
                            ValidationGroup="ResetGroup" />

                        <asp:CompareValidator
                            ID="cvPasswords"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtNewPassword"
                            Operator="Equal"
                            CssClass="text-danger small d-block mt-1"
                            Display="Dynamic"
                            ErrorMessage="Passwords do not match"
                            ValidationGroup="ResetGroup" />
                    </div>

                    <asp:LinkButton
                        ID="LinkButton1"
                        runat="server"
                        CssClass="btn btn-primary w-100"
                        ValidationGroup="ResetGroup"
                        OnClick="btnReset_Click"
                        OnClientClick="if(Page_ClientValidate('ResetGroup')) { showSpinner(); return true; } else { return false; }">
        <span id="btnText">Reset Password</span>
        <span id="btnSpinner" class="spinner-border spinner-border-sm d-none" role="status">
            <span class="visually-hidden">Loading...</span>
        </span>
    </asp:LinkButton>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        // Reusable function for both password toggles
        function togglePassword(inputId, iconId) {
            const passwordInput = document.getElementById(inputId);
            const eyeIcon = document.getElementById(iconId);

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.classList.remove('fa-eye');
                eyeIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                eyeIcon.classList.remove('fa-eye-slash');
                eyeIcon.classList.add('fa-eye');
            }
        }

        // Password strength logic
        function checkPasswordStrength() {
            const password = document.getElementById('txtNewPassword').value;
            const strengthBar = document.getElementById('strengthBar');

            // Requirements
            const hasLength = password.length >= 8;
            const hasUpper = /[A-Z]/.test(password);
            const hasLower = /[a-z]/.test(password);
            const hasNumber = /[0-9]/.test(password);

            // Update UI list
            updateRequirement('req-length', hasLength);
            updateRequirement('req-uppercase', hasUpper);
            updateRequirement('req-lowercase', hasLower);
            updateRequirement('req-number', hasNumber);

            // Update progress bar
            let strength = 0;
            if (hasLength) strength += 25;
            if (hasUpper) strength += 25;
            if (hasLower) strength += 25;
            if (hasNumber) strength += 25;

            strengthBar.style.width = strength + '%';

            // Optional: Change bar color based on strength
            if (strength <= 50) {
                strengthBar.style.backgroundColor = '#dc3545'; // red
            } else if (strength === 75) {
                strengthBar.style.backgroundColor = '#ffc107'; // yellow
            } else {
                strengthBar.style.backgroundColor = '#198754'; // green
            }
        }

        function updateRequirement(elementId, isValid) {
            const el = document.getElementById(elementId);
            const icon = el.querySelector('i');
            if (isValid) {
                icon.classList.remove('fa-circle');
                icon.classList.add('fa-check-circle', 'text-success');
            } else {
                icon.classList.add('fa-circle');
                icon.classList.remove('fa-check-circle', 'text-success');
            }
        }

        function showSpinner() {
            document.getElementById('btnText').classList.add('d-none');
            document.getElementById('btnSpinner').classList.remove('d-none');
        }
</script>

</body>
</html>