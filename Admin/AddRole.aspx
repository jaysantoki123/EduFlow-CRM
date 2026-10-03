<%@ Page Title="Add Role"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="AddRole.aspx.cs"
    Inherits="EduCRM.AddRole" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .add-role-page {
            padding: 30px;
            background: #F8FAFC;
            min-height: calc(100vh - 70px);
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .page-title {
            margin: 0;
            font-size: 25px;
            font-weight: 700;
            color: #252C3A;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 15px;
            border-radius: 6px;
            background: #FFFFFF;
            border: 1px solid #E2E8EF;
            color: #555E70;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .form-card {
            background: #FFFFFF;
            border: 1px solid #E4E8EF;
            border-radius: 10px;
            padding: 25px;
            max-width: 850px;
        }

        .form-title {
            margin: 0 0 20px;
            font-size: 16px;
            color: #303745;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        .form-label {
            font-size: 11px;
            font-weight: 600;
            color: #626B79;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 12px;
            border: 1px solid #DDE2EA;
            border-radius: 6px;
            font-size: 12px;
            color: #343B49;
            outline: none;
        }

        .form-control:focus {
            border-color: #5B5CE2;
        }

        textarea.form-control {
            min-height: 90px;
            resize: vertical;
        }

        .permission-title {
            margin-top: 25px;
            margin-bottom: 12px;
            font-size: 14px;
            font-weight: 700;
            color: #303745;
        }

        .permission-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }

        .permission-item {
            padding: 11px;
            background: #F8F9FC;
            border: 1px solid #E6E9EF;
            border-radius: 6px;
            font-size: 11px;
            color: #555E70;
        }

        .permission-item input {
            margin-right: 7px;
            accent-color: #5B5CE2;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .save-button {
            border: none;
            background: #5B5CE2;
            color: #FFFFFF;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #FFFFFF;
            color: #626B79;
            border: 1px solid #DDE2EA;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        @media(max-width:700px) {

            .form-grid,
            .permission-list {
                grid-template-columns: 1fr;
            }

            .add-role-page {
                padding: 20px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="add-role-page">

        <div class="page-header">

            <h1 class="page-title">
                Add Role
            </h1>

            <a href="<%= ResolveUrl("~/Admin/RolesPermissions.aspx") %>"
               class="back-button">

                <i class="fas fa-arrow-left"></i>
                Back

            </a>

        </div>


        <div class="form-card">

            <h2 class="form-title">
                Role Information
            </h2>


            <div class="form-grid">

                <div class="form-group">

                    <label class="form-label">
                        Role Name
                    </label>

                    <asp:TextBox ID="txtRoleName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter role name">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Role Status
                    </label>

                    <asp:DropDownList ID="ddlStatus"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem Text="Active"
                            Value="Active" />

                        <asp:ListItem Text="Limited"
                            Value="Limited" />

                        <asp:ListItem Text="Read Only"
                            Value="Read Only" />

                    </asp:DropDownList>

                </div>


                <div class="form-group full">

                    <label class="form-label">
                        Description
                    </label>

                    <asp:TextBox ID="txtDescription"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        placeholder="Enter role description">
                    </asp:TextBox>

                </div>

            </div>


            <h3 class="permission-title">
                Permissions
            </h3>


            <div class="permission-list">

                <label class="permission-item">
                    <asp:CheckBox ID="chkDashboard"
                        runat="server" />
                    View Dashboard
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkUsers"
                        runat="server" />
                    View Users
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkAddUser"
                        runat="server" />
                    Add New User
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkEditUser"
                        runat="server" />
                    Edit User
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkCourses"
                        runat="server" />
                    View Courses
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkApplications"
                        runat="server" />
                    View Applications
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkReports"
                        runat="server" />
                    View Reports
                </label>

                <label class="permission-item">
                    <asp:CheckBox ID="chkSettings"
                        runat="server" />
                    View Settings
                </label>

            </div>


            <div class="form-actions">

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save Role"
                    CssClass="save-button"
                    OnClick="btnSave_Click" />

                <a href="<%= ResolveUrl("~/Admin/RolesPermissions.aspx") %>"
                   class="cancel-button">
                    Cancel
                </a>

            </div>


            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>