<%@ Page Title="Change Password"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs"
    Inherits="EduCRM.ChangePassword" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

<style>

.password-page {
    padding:25px 30px;
    background:#f7f9fc;
    min-height:calc(100vh - 70px);
}

.password-header {
    margin-bottom:20px;
}

.password-header h1 {
    margin:0;
    font-size:25px;
    color:#252c3a;
}

.password-header p {
    margin:6px 0 0;
    font-size:12px;
    color:#9299a5;
}

.password-grid {
    display:grid;
    grid-template-columns:1.5fr 1fr;
    gap:20px;
    max-width:900px;
}

.password-card {
    background:white;
    border:1px solid #e4e8ef;
    border-radius:10px;
    padding:22px;
}

.password-card h2 {
    margin:0;
    font-size:15px;
    color:#303745;
}

.password-card > p {
    margin:6px 0 20px;
    font-size:11px;
    color:#9299a5;
}

.form-group {
    margin-bottom:17px;
}

.form-group label {
    display:block;
    margin-bottom:7px;
    font-size:11px;
    font-weight:600;
    color:#505866;
}

.password-input {
    width:100%;
    height:40px;
    border:1px solid #dfe3e9;
    border-radius:6px;
    padding:0 11px;
    box-sizing:border-box;
    font-size:12px;
    outline:none;
}

.password-input:focus {
    border-color:#5b5ce2;
}

.password-rules {
    background:#f5f6ff;
    border-radius:7px;
    padding:13px;
    margin-bottom:18px;
}

.password-rules strong {
    font-size:11px;
    color:#4f57d5;
}

.password-rules ul {
    padding-left:17px;
    margin:9px 0 0;
}

.password-rules li {
    font-size:10px;
    color:#7c8491;
    margin-bottom:5px;
}

.password-actions {
    display:flex;
    justify-content:flex-end;
    gap:9px;
}

.cancel-btn {
    border:1px solid #dfe3e9;
    background:white;
    color:#596270;
    padding:9px 15px;
    border-radius:6px;
    font-size:11px;
}

.update-btn {
    border:none;
    background:#5b5ce2;
    color:white;
    padding:9px 15px;
    border-radius:6px;
    font-size:11px;
}

.security-card {
    background:#eef0ff;
    border:1px solid #dfe2ff;
    border-radius:10px;
    padding:20px;
}

.security-icon {
    width:35px;
    height:35px;
    border-radius:8px;
    background:#5b5ce2;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    margin-bottom:12px;
}

.security-card h2 {
    margin:0 0 12px;
    font-size:14px;
    color:#454d91;
}

.security-item {
    display:flex;
    gap:8px;
    margin-bottom:11px;
    font-size:10px;
    color:#666f86;
}

.security-item i {
    color:#5b5ce2;
    margin-top:2px;
}

@media(max-width:750px) {
    .password-grid {
        grid-template-columns:1fr;
    }
}

</style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="password-page">

    <div class="password-header">

        <h1>Change Password</h1>

        <p>
            Update your account password and keep your account secure.
        </p>

    </div>


    <div class="password-grid">

        <!-- PASSWORD FORM -->

        <div class="password-card">

            <h2>Set New Password</h2>

            <p>
                Enter your current password and choose a new password.
            </p>


            <div class="form-group">

                <label>Current Password *</label>

                <input type="password"
                       class="password-input"
                       placeholder="Enter current password" />

            </div>


            <div class="form-group">

                <label>New Password *</label>

                <input type="password"
                       class="password-input"
                       placeholder="Enter new password" />

            </div>


            <div class="password-rules">

                <strong>Password Requirements</strong>

                <ul>

                    <li>
                        At least 8 characters
                    </li>

                    <li>
                        One uppercase letter
                    </li>

                    <li>
                        One lowercase letter
                    </li>

                    <li>
                        One number
                    </li>

                    <li>
                        One special character
                    </li>

                </ul>

            </div>


            <div class="form-group">

                <label>Confirm New Password *</label>

                <input type="password"
                       class="password-input"
                       placeholder="Confirm new password" />

            </div>


            <div style="font-size:10px;color:#9299a5;margin-bottom:17px;">

                <input type="checkbox" />
                Log out of all other active sessions

            </div>


            <div class="password-actions">

                <button type="button"
                        class="cancel-btn">
                    Cancel
                </button>

                <button type="button"
                        class="update-btn">
                    <i class="fas fa-lock"></i>
                    Update Password
                </button>

            </div>

        </div>


        <!-- SECURITY INFORMATION -->

        <div class="security-card">

            <div class="security-icon">
                <i class="fas fa-shield-alt"></i>
            </div>

            <h2>Password Security</h2>


            <div class="security-item">

                <i class="fas fa-check-circle"></i>

                <span>
                    Use a password that is unique to this account.
                </span>

            </div>


            <div class="security-item">

                <i class="fas fa-check-circle"></i>

                <span>
                    Avoid using personal information in your password.
                </span>

            </div>


            <div class="security-item">

                <i class="fas fa-check-circle"></i>

                <span>
                    Do not share your password with anyone.
                </span>

            </div>


            <div class="security-item">

                <i class="fas fa-check-circle"></i>

                <span>
                    Change your password regularly for better security.
                </span>

            </div>


            <div class="security-item">

                <i class="fas fa-check-circle"></i>

                <span>
                    Always log out when using a shared computer.
                </span>

            </div>

        </div>

    </div>

</div>

</asp:Content>