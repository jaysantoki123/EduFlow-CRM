<%@ Page Title="Roles & Permissions"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="RolesPermissions.aspx.cs"
    Inherits="EduCRM.RolesPermissions" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           PAGE
        ===================================================== */

        .roles-page {
            padding: 24px;
        }

        .roles-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .roles-page-title h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 700;
            color: #202938;
        }

        .roles-page-title p {
            margin: 5px 0 0;
            color: #8a93a3;
            font-size: 13px;
        }


        /* =====================================================
           ADD ROLE
        ===================================================== */

        .add-role-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;

            background: #5b5ce2;
            color: white;

            border: none;
            border-radius: 7px;

            padding: 10px 16px;

            font-size: 13px;
            font-weight: 600;

            text-decoration: none;
            cursor: pointer;

            transition: all .2s ease;
        }

        .add-role-btn:hover {
            background: #4d4ed0;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(91,92,226,.20);
        }


        /* =====================================================
           ROLE CARDS
        ===================================================== */

        .role-cards-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 24px;
        }

        .role-card {
            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 9px;
            padding: 20px;

            transition:
                transform .2s ease,
                box-shadow .2s ease,
                border-color .2s ease;
        }

        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15,23,42,.10);
            border-color: #c7d2fe;
        }

        .role-card.removing {
            opacity: 0;
            transform: scale(.95);
        }


        /* =====================================================
           ROLE CARD HEADER
        ===================================================== */

        .role-card-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            margin-bottom: 14px;
        }

        .role-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .role-icon {
            width: 42px;
            height: 42px;

            border-radius: 8px;

            background: #f0f1ff;
            color: #5b5ce2;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 16px;
        }

        .role-name {
            font-size: 15px;
            font-weight: 700;
            color: #202938;
            margin: 0;
        }

        .role-subtitle {
            font-size: 11px;
            color: #9299a5;
            margin-top: 4px;
        }


        /* =====================================================
           EDIT DELETE
        ===================================================== */

        .role-actions {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .role-action-btn {
            width: 28px;
            height: 28px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 6px;

            color: #8a93a3;

            cursor: pointer;

            transition: all .2s ease;
        }

        .role-action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 9px rgba(15,23,42,.10);
        }

        .role-edit-btn:hover {
            background: #f2f2ff;
            border-color: #c7c8ff;
            color: #5b5ce2;
        }

        .role-delete-btn:hover {
            background: #fff1f2;
            border-color: #fecaca;
            color: #dc2626;
        }


        /* =====================================================
           ROLE DESCRIPTION
        ===================================================== */

        .role-description {
            color: #687180;
            font-size: 12px;
            line-height: 1.6;
            margin-bottom: 15px;
        }


        /* =====================================================
           PERMISSION TAGS
        ===================================================== */

        .role-permissions {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .permission-tag {
            padding: 5px 8px;

            background: #f5f6fa;
            color: #697180;

            border-radius: 5px;

            font-size: 10px;
            font-weight: 500;
        }


        /* =====================================================
           PERMISSION OVERVIEW
        ===================================================== */

        .permissions-card {
            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 9px;
            overflow: hidden;

            transition: all .2s ease;
        }

        .permissions-card:hover {
            box-shadow: 0 8px 20px rgba(15,23,42,.07);
        }

        .permissions-card-header {
            padding: 18px 20px;
            border-bottom: 1px solid #edf0f4;
        }

        .permissions-card-header h2 {
            margin: 0;
            font-size: 16px;
            color: #202938;
        }

        .permissions-card-header p {
            margin: 5px 0 0;
            font-size: 11px;
            color: #9299a5;
        }

        .permissions-table-wrapper {
            overflow-x: auto;
        }

        .permissions-table {
            width: 100%;
            border-collapse: collapse;
        }

        .permissions-table th {
            background: #f8f9fb;
            padding: 13px 10px;

            font-size: 11px;
            font-weight: 600;

            color: #697180;

            text-align: center;

            border-bottom: 1px solid #e2e6ed;
        }

        .permissions-table th:first-child {
            text-align: left;
            padding-left: 20px;
        }

        .permissions-table td {
            padding: 12px 10px;

            text-align: center;

            font-size: 11px;
            color: #596273;

            border-bottom: 1px solid #edf0f4;
        }

        .permissions-table td:first-child {
            text-align: left;
            padding-left: 20px;

            font-weight: 500;
            color: #374151;
        }

        .permissions-table tbody tr:not(.permission-category):hover td {
            background: #fafbff;
        }

        .permission-category td {
            background: #f5f6ff;
            color: #5556c8;
            font-weight: 700;
        }

        .permissions-table input[type="checkbox"] {
            width: 15px;
            height: 15px;
            accent-color: #5b5ce2;
            cursor: pointer;
        }


        /* =====================================================
           EDIT VIEW
        ===================================================== */

        #editRoleView {
            display: none;
        }

        .edit-role-card {
            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 9px;
            overflow: hidden;
        }

        .edit-role-header {
            padding: 20px 22px;
            border-bottom: 1px solid #edf0f4;
        }

        .edit-role-header h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #202938;
        }

        .edit-role-header p {
            margin: 5px 0 0;
            color: #8a93a3;
            font-size: 12px;
        }

        .edit-role-body {
            padding: 22px;
        }


        /* =====================================================
           FORM
        ===================================================== */

        .edit-form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;

            margin-bottom: 18px;
        }

        .edit-form-group {
            display: flex;
            flex-direction: column;
        }

        .edit-form-group.full {
            grid-column: 1 / -1;
        }

        .edit-form-label {
            font-size: 13px;
            font-weight: 600;
            color: #424b59;
            margin-bottom: 7px;
        }

        .edit-input,
        .edit-select,
        .edit-textarea {
            width: 100%;
            box-sizing: border-box;

            border: 1px solid #dfe3e9;
            border-radius: 7px;

            padding: 0 12px;

            font-size: 13px;
            color: #374151;

            background: #ffffff;

            outline: none;

            transition: border-color .2s ease,
                        box-shadow .2s ease;
        }

        .edit-input,
        .edit-select {
            height: 43px;
        }

        .edit-textarea {
            min-height: 95px;
            padding-top: 12px;
            resize: vertical;
            font-family: inherit;
        }

        .edit-input:focus,
        .edit-select:focus,
        .edit-textarea:focus {
            border-color: #5b5ce2;
            box-shadow: 0 0 0 3px rgba(91,92,226,.08);
        }


        /* =====================================================
           EDIT PERMISSIONS
        ===================================================== */

        .edit-permissions-section {
            margin-top: 24px;
            padding-top: 22px;

            border-top: 1px solid #edf0f4;
        }

        .edit-permissions-title {
            margin-bottom: 15px;
        }

        .edit-permissions-title h3 {
            margin: 0;
            font-size: 15px;
            font-weight: 700;
            color: #202938;
        }

        .edit-permissions-title p {
            margin: 5px 0 0;
            font-size: 11px;
            color: #9299a5;
        }

        .edit-permission-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
        }

        .edit-permission-item {
            display: flex;
            align-items: center;
            gap: 10px;

            padding: 12px 13px;

            border: 1px solid #e2e6ed;
            border-radius: 7px;

            background: #ffffff;

            cursor: pointer;

            transition: all .2s ease;
        }

        .edit-permission-item:hover {
            background: #f8f8ff;
            border-color: #c7c8ff;
            transform: translateY(-2px);
        }

        .edit-permission-item input {
            width: 15px;
            height: 15px;

            accent-color: #5b5ce2;

            cursor: pointer;
        }

        .edit-permission-item span {
            font-size: 12px;
            color: #4b5563;
        }


        /* =====================================================
           FORM FOOTER
        ===================================================== */

        .edit-role-footer {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;

            padding: 16px 22px;

            border-top: 1px solid #edf0f4;
            background: #fafbfc;
        }

        .edit-cancel-btn,
        .edit-save-btn {
            padding: 10px 17px;

            border-radius: 7px;

            font-size: 12px;
            font-weight: 600;

            cursor: pointer;

            transition: all .2s ease;
        }

        .edit-cancel-btn {
            background: #ffffff;
            border: 1px solid #dfe3e9;
            color: #626b78;
        }

        .edit-cancel-btn:hover {
            background: #f4f5f7;
            transform: translateY(-2px);
        }

        .edit-save-btn {
            background: #5b5ce2;
            border: 1px solid #5b5ce2;
            color: #ffffff;
        }

        .edit-save-btn:hover {
            background: #4d4ed0;
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(91,92,226,.20);
        }

        .edit-success {
            display: none;

            margin-top: 15px;

            padding: 10px 12px;

            border-radius: 6px;

            background: #ecfdf5;
            color: #15803d;

            font-size: 12px;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1000px) {

            .role-cards-grid {
                grid-template-columns: 1fr 1fr;
            }

            .edit-permission-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 650px) {

            .roles-page {
                padding: 15px;
            }

            .roles-page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 14px;
            }

            .role-cards-grid {
                grid-template-columns: 1fr;
            }

            .edit-form-row {
                grid-template-columns: 1fr;
            }

            .edit-form-group.full {
                grid-column: auto;
            }

            .edit-permission-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="roles-page">


        <!-- =====================================================
             NORMAL ROLES VIEW
        ===================================================== -->

        <div id="rolesMainView">


            <!-- PAGE HEADER -->

            <div class="roles-page-header">

                <div class="roles-page-title">

                    <h1>
                        Roles & Permissions
                    </h1>

                    <p>
                        Manage roles and control access permissions.
                    </p>

                </div>


                <a href="<%= ResolveUrl("~/Admin/AddRole.aspx") %>"
                   class="add-role-btn">

                    <i class="fas fa-plus"></i>

                    Add Role

                </a>

            </div>


            <!-- =================================================
                 ROLE CARDS
            ================================================== -->

            <div class="role-cards-grid">


                <!-- ADMINISTRATOR -->

                <div class="role-card"
                     data-role="Administrator">

                    <div class="role-card-header">

                        <div class="role-info">

                            <div class="role-icon">
                                <i class="fas fa-user-shield"></i>
                            </div>

                            <div>

                                <div class="role-name">
                                    Administrator
                                </div>

                                <div class="role-subtitle">
                                    Full system access
                                </div>

                            </div>

                        </div>


                        <div class="role-actions">

                            <button type="button"
                                    class="role-action-btn role-edit-btn"
                                    title="Edit Role"
                                    onclick="openEditRole('Administrator');">

                                <i class="fas fa-pen"></i>

                            </button>


                            <button type="button"
                                    class="role-action-btn role-delete-btn"
                                    title="Delete Role"
                                    onclick="deleteRole(this);">

                                <i class="fas fa-trash"></i>

                            </button>

                        </div>

                    </div>


                    <div class="role-description">
                        Complete access to all modules, settings and administrative functions.
                    </div>


                    <div class="role-permissions">

                        <span class="permission-tag">Dashboard</span>
                        <span class="permission-tag">Users</span>
                        <span class="permission-tag">Courses</span>
                        <span class="permission-tag">Applications</span>
                        <span class="permission-tag">Reports</span>
                        <span class="permission-tag">Settings</span>

                    </div>

                </div>


                <!-- MANAGER -->

                <div class="role-card"
                     data-role="Manager">

                    <div class="role-card-header">

                        <div class="role-info">

                            <div class="role-icon">
                                <i class="fas fa-user-tie"></i>
                            </div>

                            <div>

                                <div class="role-name">
                                    Manager
                                </div>

                                <div class="role-subtitle">
                                    Management access
                                </div>

                            </div>

                        </div>


                        <div class="role-actions">

                            <button type="button"
                                    class="role-action-btn role-edit-btn"
                                    title="Edit Role"
                                    onclick="openEditRole('Manager');">

                                <i class="fas fa-pen"></i>

                            </button>


                            <button type="button"
                                    class="role-action-btn role-delete-btn"
                                    title="Delete Role"
                                    onclick="deleteRole(this);">

                                <i class="fas fa-trash"></i>

                            </button>

                        </div>

                    </div>


                    <div class="role-description">
                        Access to student management, applications, counseling and reports.
                    </div>


                    <div class="role-permissions">

                        <span class="permission-tag">Dashboard</span>
                        <span class="permission-tag">Students</span>
                        <span class="permission-tag">Applications</span>
                        <span class="permission-tag">Counseling</span>
                        <span class="permission-tag">Reports</span>

                    </div>

                </div>


                <!-- COUNSELOR -->

                <div class="role-card"
                     data-role="Counselor">

                    <div class="role-card-header">

                        <div class="role-info">

                            <div class="role-icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>

                            <div>

                                <div class="role-name">
                                    Counselor
                                </div>

                                <div class="role-subtitle">
                                    Counseling access
                                </div>

                            </div>

                        </div>


                        <div class="role-actions">

                            <button type="button"
                                    class="role-action-btn role-edit-btn"
                                    title="Edit Role"
                                    onclick="openEditRole('Counselor');">

                                <i class="fas fa-pen"></i>

                            </button>


                            <button type="button"
                                    class="role-action-btn role-delete-btn"
                                    title="Delete Role"
                                    onclick="deleteRole(this);">

                                <i class="fas fa-trash"></i>

                            </button>

                        </div>

                    </div>


                    <div class="role-description">
                        Handles inquiries, counseling sessions and student follow-ups.
                    </div>


                    <div class="role-permissions">

                        <span class="permission-tag">Dashboard</span>
                        <span class="permission-tag">Inquiries</span>
                        <span class="permission-tag">Counseling</span>
                        <span class="permission-tag">Follow-ups</span>

                    </div>

                </div>


                <!-- STAFF -->

                <div class="role-card"
                     data-role="Staff">

                    <div class="role-card-header">

                        <div class="role-info">

                            <div class="role-icon">
                                <i class="fas fa-users"></i>
                            </div>

                            <div>

                                <div class="role-name">
                                    Staff
                                </div>

                                <div class="role-subtitle">
                                    Basic operational access
                                </div>

                            </div>

                        </div>


                        <div class="role-actions">

                            <button type="button"
                                    class="role-action-btn role-edit-btn"
                                    title="Edit Role"
                                    onclick="openEditRole('Staff');">

                                <i class="fas fa-pen"></i>

                            </button>


                            <button type="button"
                                    class="role-action-btn role-delete-btn"
                                    title="Delete Role"
                                    onclick="deleteRole(this);">

                                <i class="fas fa-trash"></i>

                            </button>

                        </div>

                    </div>


                    <div class="role-description">
                        Basic access for managing student information and daily operations.
                    </div>


                    <div class="role-permissions">

                        <span class="permission-tag">Dashboard</span>
                        <span class="permission-tag">Students</span>
                        <span class="permission-tag">Applications</span>

                    </div>

                </div>


                <!-- VIEWER -->

                <div class="role-card"
                     data-role="Viewer">

                    <div class="role-card-header">

                        <div class="role-info">

                            <div class="role-icon">
                                <i class="fas fa-eye"></i>
                            </div>

                            <div>

                                <div class="role-name">
                                    Viewer
                                </div>

                                <div class="role-subtitle">
                                    Read-only access
                                </div>

                            </div>

                        </div>


                        <div class="role-actions">

                            <button type="button"
                                    class="role-action-btn role-edit-btn"
                                    title="Edit Role"
                                    onclick="openEditRole('Viewer');">

                                <i class="fas fa-pen"></i>

                            </button>


                            <button type="button"
                                    class="role-action-btn role-delete-btn"
                                    title="Delete Role"
                                    onclick="deleteRole(this);">

                                <i class="fas fa-trash"></i>

                            </button>

                        </div>

                    </div>


                    <div class="role-description">
                        Read-only access to view dashboards, students and reports.
                    </div>


                    <div class="role-permissions">

                        <span class="permission-tag">Dashboard</span>
                        <span class="permission-tag">Students</span>
                        <span class="permission-tag">Reports</span>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 PERMISSION OVERVIEW
            ================================================== -->

            <div class="permissions-card">

                <div class="permissions-card-header">

                    <h2>
                        Permission Overview
                    </h2>

                    <p>
                        View the permissions assigned to each role.
                    </p>

                </div>


                <div class="permissions-table-wrapper">

                    <table class="permissions-table">

                        <thead>

                            <tr>

                                <th>
                                    Permission
                                </th>

                                <th>
                                    Administrator
                                </th>

                                <th>
                                    Manager
                                </th>

                                <th>
                                    Counselor
                                </th>

                                <th>
                                    Staff
                                </th>

                                <th>
                                    Viewer
                                </th>

                            </tr>

                        </thead>


                        <tbody>


                            <tr class="permission-category">

                                <td colspan="6">
                                    General
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Dashboard
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Users
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                            </tr>


                            <tr class="permission-category">

                                <td colspan="6">
                                    Students & Applications
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Students
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Applications
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Counseling
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                            </tr>


                            <tr class="permission-category">

                                <td colspan="6">
                                    Reports & Settings
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Reports
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                            </tr>


                            <tr>

                                <td>
                                    Settings
                                </td>

                                <td>
                                    <input type="checkbox" checked />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                                <td>
                                    <input type="checkbox" />
                                </td>

                            </tr>


                        </tbody>

                    </table>

                </div>

            </div>

        </div>


        <!-- =====================================================
             SAME-PAGE EDIT FORM
        ===================================================== -->

        <div id="editRoleView">


            <!-- EDIT HEADER -->

            <div class="roles-page-header">

                <div class="roles-page-title">

                    <h1>
                        Edit Role
                    </h1>

                    <p>
                        Update role information and permissions.
                    </p>

                </div>

            </div>


            <!-- EDIT CARD -->

            <div class="edit-role-card">


                <div class="edit-role-header">

                    <h2>
                        Role Information
                    </h2>

                    <p>
                        Update the details of the selected role.
                    </p>

                </div>


                <div class="edit-role-body">


                    <!-- BASIC INFORMATION -->

                    <div class="edit-form-row">


                        <div class="edit-form-group">

                            <label class="edit-form-label">
                                Role Name
                            </label>

                            <input type="text"
                                   id="editRoleName"
                                   class="edit-input" />

                        </div>


                        <div class="edit-form-group">

                            <label class="edit-form-label">
                                Status
                            </label>

                            <select id="editRoleStatus"
                                    class="edit-select">

                                <option value="Active">
                                    Active
                                </option>

                                <option value="Inactive">
                                    Inactive
                                </option>

                            </select>

                        </div>


                    </div>


                    <!-- DESCRIPTION -->

                    <div class="edit-form-row">


                        <div class="edit-form-group full">

                            <label class="edit-form-label">
                                Description
                            </label>

                            <textarea id="editRoleDescription"
                                      class="edit-textarea"></textarea>

                        </div>


                    </div>


                    <!-- PERMISSIONS -->

                    <div class="edit-permissions-section">


                        <div class="edit-permissions-title">

                            <h3>
                                Permissions
                            </h3>

                            <p>
                                Select the permissions that should be available for this role.
                            </p>

                        </div>


                        <div class="edit-permission-grid">


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editDashboard" />

                                <span>
                                    Dashboard
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editUsers" />

                                <span>
                                    Users
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editAddUser" />

                                <span>
                                    Add User
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editEditUser" />

                                <span>
                                    Edit User
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editCourses" />

                                <span>
                                    Courses
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editApplications" />

                                <span>
                                    Applications
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editStudents" />

                                <span>
                                    Students
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editCounseling" />

                                <span>
                                    Counseling
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editReports" />

                                <span>
                                    Reports
                                </span>

                            </label>


                            <label class="edit-permission-item">

                                <input type="checkbox"
                                       id="editSettings" />

                                <span>
                                    Settings
                                </span>

                            </label>


                        </div>


                        <div id="editSuccess"
                             class="edit-success">
                        </div>


                    </div>


                </div>


                <!-- BUTTONS -->

                <div class="edit-role-footer">


                    <button type="button"
                            class="edit-cancel-btn"
                            onclick="cancelEditRole();">

                        Cancel

                    </button>


                    <button type="button"
                            class="edit-save-btn"
                            onclick="saveRoleChanges();">

                        <i class="fas fa-save"></i>

                        &nbsp;

                        Save Changes

                    </button>


                </div>

            </div>

        </div>


    </div>


    <script>

        /* =====================================================
           ROLE DATA
        ===================================================== */

        var roles = {

            Administrator: {
                status: "Active",
                description: "Complete access to all modules, settings and administrative functions.",
                permissions: [
                    "Dashboard",
                    "Users",
                    "AddUser",
                    "EditUser",
                    "Courses",
                    "Applications",
                    "Students",
                    "Counseling",
                    "Reports",
                    "Settings"
                ]
            },

            Manager: {
                status: "Active",
                description: "Access to student management, applications, counseling and reports.",
                permissions: [
                    "Dashboard",
                    "Users",
                    "Students",
                    "Applications",
                    "Counseling",
                    "Reports"
                ]
            },

            Counselor: {
                status: "Active",
                description: "Handles inquiries, counseling sessions and student follow-ups.",
                permissions: [
                    "Dashboard",
                    "Students",
                    "Counseling",
                    "Reports"
                ]
            },

            Staff: {
                status: "Active",
                description: "Basic access for managing student information and daily operations.",
                permissions: [
                    "Dashboard",
                    "Students",
                    "Applications"
                ]
            },

            Viewer: {
                status: "Active",
                description: "Read-only access to view dashboards, students and reports.",
                permissions: [
                    "Dashboard",
                    "Students",
                    "Reports"
                ]
            }

        };


        var currentRole = "";


        /* =====================================================
           OPEN EDIT FORM
        ===================================================== */

        function openEditRole(roleName) {

            currentRole = roleName;

            var role = roles[roleName];

            if (!role) {
                return;
            }


            document.getElementById("editRoleName").value =
                roleName;

            document.getElementById("editRoleStatus").value =
                role.status;

            document.getElementById("editRoleDescription").value =
                role.description;


            /* Reset permissions */

            var permissionIds = [
                "Dashboard",
                "Users",
                "AddUser",
                "EditUser",
                "Courses",
                "Applications",
                "Students",
                "Counseling",
                "Reports",
                "Settings"
            ];


            for (var i = 0; i < permissionIds.length; i++) {

                document.getElementById(
                    "edit" + permissionIds[i]
                ).checked = false;

            }


            /* Load selected permissions */

            for (var j = 0; j < role.permissions.length; j++) {

                document.getElementById(
                    "edit" + role.permissions[j]
                ).checked = true;

            }


            document.getElementById("editSuccess").style.display =
                "none";


            /* Hide normal view */

            document.getElementById("rolesMainView").style.display =
                "none";


            /* Show edit view */

            document.getElementById("editRoleView").style.display =
                "block";


            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });

        }


        /* =====================================================
           CANCEL
        ===================================================== */

        function cancelEditRole() {

            document.getElementById("editRoleView").style.display =
                "none";

            document.getElementById("rolesMainView").style.display =
                "block";

            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });

        }


        /* =====================================================
           SAVE
        ===================================================== */

        function saveRoleChanges() {

            var newName =
                document.getElementById("editRoleName").value.trim();

            var status =
                document.getElementById("editRoleStatus").value;

            var description =
                document.getElementById("editRoleDescription").value.trim();


            if (newName === "") {

                alert("Please enter the role name.");

                return;

            }


            if (description === "") {

                alert("Please enter the role description.");

                return;

            }


            var permissionIds = [
                "Dashboard",
                "Users",
                "AddUser",
                "EditUser",
                "Courses",
                "Applications",
                "Students",
                "Counseling",
                "Reports",
                "Settings"
            ];


            var selectedPermissions = [];


            for (var i = 0; i < permissionIds.length; i++) {

                var checkbox =
                    document.getElementById(
                        "edit" + permissionIds[i]
                    );


                if (checkbox.checked) {

                    selectedPermissions.push(
                        permissionIds[i]
                    );

                }

            }


            /* Update role data */

            roles[currentRole] = {

                status: status,

                description: description,

                permissions: selectedPermissions

            };


            /* Find the original card */

            var cards =
                document.querySelectorAll(".role-card");


            for (var j = 0; j < cards.length; j++) {

                var card = cards[j];

                var role =
                    card.getAttribute("data-role");


                if (role === currentRole) {

                    /* Update name */

                    var nameElement =
                        card.querySelector(".role-name");

                    if (nameElement) {

                        nameElement.textContent =
                            newName;

                    }


                    /* Update description */

                    var descriptionElement =
                        card.querySelector(".role-description");

                    if (descriptionElement) {

                        descriptionElement.textContent =
                            description;

                    }


                    /* Update permission tags */

                    var permissionContainer =
                        card.querySelector(".role-permissions");


                    if (permissionContainer) {

                        permissionContainer.innerHTML = "";


                        for (
                            var k = 0;
                            k < selectedPermissions.length;
                            k++
                        ) {

                            var tag =
                                document.createElement("span");


                            tag.className =
                                "permission-tag";


                            var displayPermission =
                                selectedPermissions[k];


                            if (displayPermission === "AddUser") {
                                displayPermission = "Add User";
                            }

                            if (displayPermission === "EditUser") {
                                displayPermission = "Edit User";
                            }


                            tag.textContent =
                                displayPermission;


                            permissionContainer.appendChild(tag);

                        }

                    }


                    /*
                     * Update the card's data-role
                     * so Edit continues to work.
                     */

                    card.setAttribute(
                        "data-role",
                        newName
                    );


                    /*
                     * Update Edit button
                     */

                    var editButton =
                        card.querySelector(".role-edit-btn");


                    if (editButton) {

                        editButton.setAttribute(
                            "onclick",
                            "openEditRole('" +
                            newName.replace(/'/g, "\\'") +
                            "');"
                        );

                    }

                }

            }


            /*
             * Move the data from the old
             * role name to the new role name.
             */

            if (newName !== currentRole) {

                roles[newName] =
                    roles[currentRole];

                delete roles[currentRole];

                currentRole = newName;

            }


            /* Success message */

            var success =
                document.getElementById("editSuccess");


            success.innerHTML =
                "<strong>" +
                newName +
                "</strong> updated successfully.";

            success.style.display =
                "block";


            /* Return to role cards */

            setTimeout(function () {

                cancelEditRole();

            }, 900);

        }


        /* =====================================================
           DELETE
        ===================================================== */

        function deleteRole(button) {

            var card =
                button.closest(".role-card");


            if (!card) {
                return;
            }


            var roleName =
                card.getAttribute("data-role");


            var confirmDelete =
                confirm(
                    'Are you sure you want to delete "' +
                    roleName +
                    '"?'
                );


            if (!confirmDelete) {
                return;
            }


            card.classList.add("removing");


            setTimeout(function () {

                card.remove();

                delete roles[roleName];

            }, 250);

        }

    </script>

</asp:Content>