<%@ Page Title="Add New User"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AddUser.aspx.cs"
    Inherits="EduCRM.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .add-user-page {
            padding: 30px;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0;
            font-size: 30px;
            font-weight: 700;
            color: #1e293b;
        }

        .page-header p {
            margin-top: 8px;
            color: #64748b;
            font-size: 14px;
        }

        .user-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            max-width: 850px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-group.full {
            width: 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #334155;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 13px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        .form-control:focus {
            border-color: #2563eb;
        }

        .button-row {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .btn {
            padding: 11px 22px;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-secondary {
            background: #e2e8f0;
            color: #334155;
        }

        .btn-secondary:hover {
            background: #cbd5e1;
        }

        .message {
            display: block;
            margin-top: 20px;
            font-size: 14px;
            font-weight: 600;
        }

        @media (max-width: 700px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .add-user-page {
                padding: 20px;
            }

            .user-card {
                padding: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="add-user-page">

        <div class="page-header">
            <h1>Add New User</h1>
            <p>Create a new user account for the EduFlow system.</p>
        </div>

        <div class="user-card">

            <div class="form-row">

                <div class="form-group">
                    <label for="txtFirstName">First Name</label>

                    <asp:TextBox
                        ID="txtFirstName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter first name">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtLastName">Last Name</label>

                    <asp:TextBox
                        ID="txtLastName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter last name">
                    </asp:TextBox>
                </div>

            </div>

            <div class="form-row">

                <div class="form-group">
                    <label for="txtEmail">Email</label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter email address">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPhone">Phone Number</label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter phone number">
                    </asp:TextBox>
                </div>

            </div>

            <div class="form-row">

                <div class="form-group">
                    <label for="txtUsername">Username</label>

                    <asp:TextBox
                        ID="txtUsername"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter username">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ddlRole">Role</label>

                    <asp:DropDownList
                        ID="ddlRole"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        <asp:ListItem Text="Counselor" Value="Counselor"></asp:ListItem>
                        <asp:ListItem Text="Staff" Value="Staff"></asp:ListItem>
                        <asp:ListItem Text="User" Value="User"></asp:ListItem>

                    </asp:DropDownList>
                </div>

            </div>

            <div class="form-row">

                <div class="form-group">
                    <label for="txtPassword">Password</label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Enter password">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtConfirmPassword">Confirm Password</label>

                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Confirm password">
                    </asp:TextBox>
                </div>

            </div>

            <div class="button-row">

                <asp:Button
                    ID="btnSave"
                    runat="server"
                    Text="Create User"
                    CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />

                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="btn btn-secondary"
                    CausesValidation="false"
                    OnClick="btnCancel_Click" />

            </div>

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>