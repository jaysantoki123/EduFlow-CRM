<%@ Page Title="User Management"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Users.aspx.cs"
    Inherits="EduCRM.Users" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

<style>

.users-page {
    width: 100%;
    min-height: calc(100vh - 60px);
    padding: 18px 10px;
    background: #f8fafc;
    font-family: 'Inter', Arial, sans-serif;
    color: #1e293b;
}

.users-page * {
    box-sizing: border-box;
}

/* HEADER */

.um-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
}

.um-title h1 {
    margin: 0 0 3px;
    font-family: 'Montserrat', Arial, sans-serif;
    font-size: 21px;
    font-weight: 600;
    color: #172033;
}

.um-title p {
    margin: 0;
    color: #64748b;
    font-size: 8px;
}

.um-add-btn {
    height: 28px;
    padding: 0 11px;
    border: none;
    border-radius: 6px;
    background: #4f46e5;
    color: white;
    font-size: 7px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.um-add-btn:hover {
    background: #4338ca;
    transform: translateY(-2px);
    box-shadow: 0 5px 12px rgba(79, 70, 229, 0.25);
    color: white;
}

/* STATISTICS */

.um-stats {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 8px;
    margin-bottom: 10px;
}

.um-stat {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px;
    display: flex;
    align-items: center;
    gap: 8px;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease,
        border-color 0.2s ease;
}

.um-stat:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
    border-color: #c7d2fe;
}

.um-stat-icon {
    width: 28px;
    height: 28px;
    border-radius: 7px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 9px;

    transition: transform 0.2s ease;
}

.um-stat:hover .um-stat-icon {
    transform: scale(1.08);
}

.um-stat-icon.purple {
    background: #ede9fe;
    color: #6366f1;
}

.um-stat-icon.blue {
    background: #dbeafe;
    color: #2563eb;
}

.um-stat-icon.green {
    background: #dcfce7;
    color: #16a34a;
}

.um-stat-icon.orange {
    background: #fef3c7;
    color: #d97706;
}

.um-stat-icon.red {
    background: #fee2e2;
    color: #dc2626;
}

.um-stat-label {
    font-size: 5.5px;
    color: #94a3b8;
    text-transform: uppercase;
    margin-bottom: 2px;
}

.um-stat-value {
    font-size: 14px;
    color: #334155;
    font-weight: 600;
}

/* FILTER */

.um-filter {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 10px;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease,
        border-color 0.2s ease;
}

.um-filter:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(15, 23, 42, 0.07);
    border-color: #c7d2fe;
}

.um-filter-title {
    font-size: 7px;
    font-weight: 600;
    color: #475569;
    margin-bottom: 7px;
}

.um-filter-row {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    gap: 7px;
}

.um-input,
.um-select {
    width: 100%;
    height: 27px;
    border: 1px solid #dfe5ef;
    border-radius: 5px;
    background: white;
    padding: 0 7px;
    color: #475569;
    font-size: 6.5px;
    outline: none;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease;
}

.um-input:hover,
.um-select:hover {
    border-color: #a5b4fc;
}

.um-input:focus,
.um-select:focus {
    border-color: #818cf8;
    box-shadow: 0 0 0 2px rgba(129, 140, 248, 0.10);
}

/* USERS GRID */

.um-users {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 8px;
}

/* USER CARD */

.um-card {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 10px;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease,
        border-color 0.2s ease;
}

.um-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 9px 22px rgba(15, 23, 42, 0.09);
    border-color: #c7d2fe;
}

.um-user-top {
    display: flex;
    align-items: center;
    gap: 7px;
    padding-bottom: 8px;
    border-bottom: 1px solid #eef2f7;
}

.um-avatar {
    width: 29px;
    height: 29px;
    border-radius: 50%;
    background: #4f46e5;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 8px;
    font-weight: 600;
    flex-shrink: 0;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}

.um-card:hover .um-avatar {
    transform: scale(1.08);
    box-shadow: 0 4px 10px rgba(79, 70, 229, 0.20);
}

.um-user-name {
    font-size: 8px;
    font-weight: 600;
    color: #334155;
}

.um-user-email {
    font-size: 5.5px;
    color: #94a3b8;
    margin-top: 2px;
}

.um-status {
    margin-left: auto;
    padding: 3px 6px;
    border-radius: 8px;
    font-size: 5px;
    background: #dcfce7;
    color: #16a34a;
}

.um-status.inactive {
    background: #f1f5f9;
    color: #64748b;
}

/* USER INFO */

.um-info {
    padding: 8px 0;
}

.um-info-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 4px 0;
    font-size: 6px;
}

.um-info-label {
    color: #94a3b8;
}

.um-info-value {
    color: #475569;
    font-weight: 500;
}

/* ROLE */

.um-role {
    display: inline-block;
    padding: 3px 6px;
    border-radius: 8px;
    background: #eef2ff;
    color: #4f46e5;
    font-size: 5.5px;
}

/* ACTIONS */

.um-actions {
    display: flex;
    gap: 5px;
    border-top: 1px solid #eef2f7;
    padding-top: 7px;
}

.um-action {
    flex: 1;
    height: 24px;
    border: 1px solid #e2e8f0;
    background: white;
    border-radius: 5px;
    color: #64748b;
    font-size: 6px;
    cursor: pointer;

    transition:
        all 0.2s ease;
}

.um-action:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 9px rgba(15, 23, 42, 0.08);
    border-color: #c7d2fe;
    background: #f8fafc;
}

.um-action.edit {
    color: #4f46e5;
}

.um-action.edit:hover {
    background: #eef2ff;
    border-color: #a5b4fc;
    color: #4338ca;
}

.um-action.delete {
    color: #dc2626;
}

.um-action.delete:hover {
    background: #fef2f2;
    border-color: #fecaca;
    color: #b91c1c;
}

.um-action i {
    margin-right: 2px;
}

/* DELETE ANIMATION */

.um-card.removing {
    opacity: 0;
    transform: scale(0.94);
    transition: all 0.25s ease;
}

/* PAGINATION */

.um-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
    padding: 9px 10px;
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 8px;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease,
        border-color 0.2s ease;
}

.um-bottom:hover {
    transform: translateY(-2px);
    box-shadow: 0 7px 18px rgba(15, 23, 42, 0.07);
    border-color: #c7d2fe;
}

.um-showing {
    font-size: 6px;
    color: #64748b;
}

.um-pagination {
    display: flex;
    gap: 4px;
}

.um-page {
    width: 23px;
    height: 22px;
    border: 1px solid #e2e8f0;
    border-radius: 4px;
    background: white;
    color: #64748b;
    font-size: 6px;
    cursor: pointer;

    transition: all 0.2s ease;
}

.um-page:hover {
    background: #eef2ff;
    color: #4f46e5;
    border-color: #a5b4fc;
    transform: translateY(-1px);
}

.um-page.active {
    background: #4f46e5;
    color: white;
    border-color: #4f46e5;
}

/* RESPONSIVE */

@media(max-width:900px) {

    .um-stats {
        grid-template-columns: repeat(3, 1fr);
    }

    .um-users {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media(max-width:600px) {

    .um-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .um-stats {
        grid-template-columns: 1fr 1fr;
    }

    .um-filter-row {
        grid-template-columns: 1fr;
    }

    .um-users {
        grid-template-columns: 1fr;
    }

}

</style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="users-page">


    <!-- HEADER -->

    <div class="um-header">

        <div class="um-title">

            <h1>User Management</h1>

            <p>
                Manage system users, roles and permissions
            </p>

        </div>

        <a href="<%= ResolveUrl("~/Admin/AddUser.aspx") %>"
           class="um-add-btn"
           style="display:flex; align-items:center; justify-content:center; text-decoration:none;">

            <i class="fas fa-plus"></i>&nbsp;
            Add New User

        </a>

    </div>


    <!-- STATISTICS -->

    <div class="um-stats">


        <div class="um-stat">

            <div class="um-stat-icon purple">
                <i class="fas fa-users"></i>
            </div>

            <div>

                <div class="um-stat-label">
                    Total Users
                </div>

                <div class="um-stat-value">
                    18
                </div>

            </div>

        </div>


        <div class="um-stat">

            <div class="um-stat-icon blue">
                <i class="fas fa-shield-halved"></i>
            </div>

            <div>

                <div class="um-stat-label">
                    Administrators
                </div>

                <div class="um-stat-value">
                    2
                </div>

            </div>

        </div>


        <div class="um-stat">

            <div class="um-stat-icon green">
                <i class="fas fa-user-tie"></i>
            </div>

            <div>

                <div class="um-stat-label">
                    Managers
                </div>

                <div class="um-stat-value">
                    4
                </div>

            </div>

        </div>


        <div class="um-stat">

            <div class="um-stat-icon green">
                <i class="fas fa-user-group"></i>
            </div>

            <div>

                <div class="um-stat-label">
                    Counselors
                </div>

                <div class="um-stat-value">
                    8
                </div>

            </div>

        </div>


        <div class="um-stat">

            <div class="um-stat-icon orange">
                <i class="fas fa-user"></i>
            </div>

            <div>

                <div class="um-stat-label">
                    Staff
                </div>

                <div class="um-stat-value">
                    3
                </div>

            </div>

        </div>

    </div>


    <!-- FILTER -->

    <div class="um-filter">

        <div class="um-filter-title">

            <i class="fas fa-filter"></i>
            Search & Filter Users

        </div>


        <div class="um-filter-row">

            <input class="um-input"
                   type="text"
                   id="userSearch"
                   placeholder="Search name, email or phone..." />


            <select class="um-select"
                    id="roleFilter">

                <option>All Roles</option>
                <option>Administrator</option>
                <option>Manager</option>
                <option>Counselor</option>
                <option>Staff</option>

            </select>


            <select class="um-select"
                    id="statusFilter">

                <option>All Status</option>
                <option>Active</option>
                <option>Inactive</option>

            </select>


            <select class="um-select"
                    id="departmentFilter">

                <option>All Departments</option>
                <option>Administration</option>
                <option>Admissions</option>
                <option>Counseling</option>

            </select>

        </div>

    </div>


    <!-- USERS -->

    <div class="um-users" id="usersGrid">


        <!-- USER 1 -->

        <div class="um-card"
             data-name="Anil Kumar"
             data-email="anil.kumar@educrm.com"
             data-phone=""
             data-role="Administrator"
             data-status="Active"
             data-department="Administration">

            <div class="um-user-top">

                <div class="um-avatar">
                    AK
                </div>

                <div>

                    <div class="um-user-name">
                        Anil Kumar
                    </div>

                    <div class="um-user-email">
                        anil.kumar@educrm.com
                    </div>

                </div>

                <span class="um-status">
                    Active
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Administrator
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Administration
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Today, 09:15 AM
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


        <!-- USER 2 -->

        <div class="um-card"
             data-name="Rahul Mehta"
             data-email="rahul.mehta@educrm.com"
             data-phone=""
             data-role="Manager"
             data-status="Active"
             data-department="Admissions">

            <div class="um-user-top">

                <div class="um-avatar">
                    RM
                </div>

                <div>

                    <div class="um-user-name">
                        Rahul Mehta
                    </div>

                    <div class="um-user-email">
                        rahul.mehta@educrm.com
                    </div>

                </div>

                <span class="um-status">
                    Active
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Manager
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Admissions
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Today, 10:30 AM
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


        <!-- USER 3 -->

        <div class="um-card"
             data-name="Sarah Patel"
             data-email="sarah.patel@educrm.com"
             data-phone=""
             data-role="Counselor"
             data-status="Active"
             data-department="Counseling">

            <div class="um-user-top">

                <div class="um-avatar">
                    SP
                </div>

                <div>

                    <div class="um-user-name">
                        Sarah Patel
                    </div>

                    <div class="um-user-email">
                        sarah.patel@educrm.com
                    </div>

                </div>

                <span class="um-status">
                    Active
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Counselor
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Counseling
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Today, 11:20 AM
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


        <!-- USER 4 -->

        <div class="um-card"
             data-name="Meera Patel"
             data-email="meera.patel@educrm.com"
             data-phone=""
             data-role="Counselor"
             data-status="Active"
             data-department="Counseling">

            <div class="um-user-top">

                <div class="um-avatar">
                    MP
                </div>

                <div>

                    <div class="um-user-name">
                        Meera Patel
                    </div>

                    <div class="um-user-email">
                        meera.patel@educrm.com
                    </div>

                </div>

                <span class="um-status">
                    Active
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Counselor
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Counseling
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Yesterday, 04:40 PM
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


        <!-- USER 5 -->

        <div class="um-card"
             data-name="Rajesh Kumar"
             data-email="rajesh.kumar@educrm.com"
             data-phone=""
             data-role="Staff"
             data-status="Active"
             data-department="Admissions">

            <div class="um-user-top">

                <div class="um-avatar">
                    RK
                </div>

                <div>

                    <div class="um-user-name">
                        Rajesh Kumar
                    </div>

                    <div class="um-user-email">
                        rajesh.kumar@educrm.com
                    </div>

                </div>

                <span class="um-status">
                    Active
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Staff
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Admissions
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Yesterday, 02:15 PM
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


        <!-- USER 6 -->

        <div class="um-card"
             data-name="Neha Patel"
             data-email="neha.patel@educrm.com"
             data-phone=""
             data-role="Staff"
             data-status="Inactive"
             data-department="Administration">

            <div class="um-user-top">

                <div class="um-avatar">
                    NP
                </div>

                <div>

                    <div class="um-user-name">
                        Neha Patel
                    </div>

                    <div class="um-user-email">
                        neha.patel@educrm.com
                    </div>

                </div>

                <span class="um-status inactive">
                    Inactive
                </span>

            </div>


            <div class="um-info">

                <div class="um-info-row">

                    <span class="um-info-label">
                        Role
                    </span>

                    <span class="um-role">
                        Staff
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Department
                    </span>

                    <span class="um-info-value">
                        Administration
                    </span>

                </div>

                <div class="um-info-row">

                    <span class="um-info-label">
                        Last Login
                    </span>

                    <span class="um-info-value">
                        Sep 28, 2026
                    </span>

                </div>

            </div>


            <div class="um-actions">

                <button type="button"
                        class="um-action"
                        onclick="viewUser(this);">

                    <i class="fas fa-eye"></i>
                    View

                </button>

                <button type="button"
                        class="um-action edit"
                        onclick="editUser(this);">

                    <i class="fas fa-pen"></i>
                    Edit

                </button>

                <button type="button"
                        class="um-action delete"
                        onclick="deleteUser(this);">

                    <i class="fas fa-trash"></i>
                    Delete

                </button>

            </div>

        </div>


    </div>


    <!-- BOTTOM -->

    <div class="um-bottom">

        <div class="um-showing" id="showingText">
            Showing 1-6 of 18 users
        </div>

        <div class="um-pagination">

            <button type="button"
                    class="um-page active">
                1
            </button>

            <button type="button"
                    class="um-page">
                2
            </button>

            <button type="button"
                    class="um-page">
                3
            </button>

            <button type="button"
                    class="um-page">

                <i class="fas fa-chevron-right"></i>

            </button>

        </div>

    </div>


</div>


<script>

/* =========================
   VIEW USER
   ========================= */

function viewUser(button) {

    var card = button.closest(".um-card");

    if (!card) {
        return;
    }

    var name = card.getAttribute("data-name");
    var email = card.getAttribute("data-email");
    var role = card.getAttribute("data-role");
    var status = card.getAttribute("data-status");
    var department = card.getAttribute("data-department");

    alert(
        "User Details\n\n" +
        "Name: " + name + "\n" +
        "Email: " + email + "\n" +
        "Role: " + role + "\n" +
        "Department: " + department + "\n" +
        "Status: " + status
    );
}


/* =========================
   EDIT USER
   ========================= */

function editUser(button) {

    var card = button.closest(".um-card");

    if (!card) {
        return;
    }

    var nameElement = card.querySelector(".um-user-name");

    if (!nameElement) {
        return;
    }

    var oldName = nameElement.textContent.trim();

    var newName = prompt(
        "Enter new user name:",
        oldName
    );

    if (newName === null) {
        return;
    }

    newName = newName.trim();

    if (newName === "") {

        alert("User name cannot be empty.");

        return;
    }

    nameElement.textContent = newName;

    card.setAttribute(
        "data-name",
        newName
    );

    alert(
        "User updated successfully."
    );
}


/* =========================
   DELETE USER
   ========================= */

function deleteUser(button) {

    var card = button.closest(".um-card");

    if (!card) {
        return;
    }

    var nameElement = card.querySelector(".um-user-name");

    var userName = "this user";

    if (nameElement) {

        userName =
            nameElement.textContent.trim();

    }

    var confirmDelete = confirm(
        "Are you sure you want to delete \"" +
        userName +
        "\"?"
    );

    if (!confirmDelete) {
        return;
    }

    card.classList.add("removing");

    setTimeout(function () {

        card.remove();

        updateUserCount();

    }, 250);
}


/* =========================
   UPDATE COUNT
   ========================= */

function updateUserCount() {

    var cards =
        document.querySelectorAll(
            "#usersGrid .um-card"
        );

    var visibleCount = 0;

    for (var i = 0; i < cards.length; i++) {

        if (
            cards[i].style.display !== "none"
        ) {
            visibleCount++;
        }
    }

    document.getElementById(
        "showingText"
    ).textContent =
        "Showing " +
        visibleCount +
        " users";
}


/* =========================
   SEARCH + FILTER
   ========================= */

function filterUsers() {

    var search =
        document.getElementById(
            "userSearch"
        ).value.toLowerCase();

    var role =
        document.getElementById(
            "roleFilter"
        ).value;

    var status =
        document.getElementById(
            "statusFilter"
        ).value;

    var department =
        document.getElementById(
            "departmentFilter"
        ).value;

    var cards =
        document.querySelectorAll(
            "#usersGrid .um-card"
        );

    var visibleCount = 0;

    for (
        var i = 0;
        i < cards.length;
        i++
    ) {

        var card = cards[i];

        var name =
            card.getAttribute(
                "data-name"
            ).toLowerCase();

        var email =
            card.getAttribute(
                "data-email"
            ).toLowerCase();

        var phone =
            card.getAttribute(
                "data-phone"
            ).toLowerCase();

        var cardRole =
            card.getAttribute(
                "data-role"
            );

        var cardStatus =
            card.getAttribute(
                "data-status"
            );

        var cardDepartment =
            card.getAttribute(
                "data-department"
            );


        var searchMatch =
            name.indexOf(search) !== -1 ||
            email.indexOf(search) !== -1 ||
            phone.indexOf(search) !== -1;


        var roleMatch =
            role === "All Roles" ||
            cardRole === role;


        var statusMatch =
            status === "All Status" ||
            cardStatus === status;


        var departmentMatch =
            department === "All Departments" ||
            cardDepartment === department;


        if (
            searchMatch &&
            roleMatch &&
            statusMatch &&
            departmentMatch
        ) {

            card.style.display = "";

            visibleCount++;

        }
        else {

            card.style.display = "none";

        }
    }


    document.getElementById(
        "showingText"
    ).textContent =
        "Showing " +
        visibleCount +
        " users";
}


/* =========================
   FILTER EVENTS
   ========================= */

document
    .getElementById("userSearch")
    .addEventListener(
        "keyup",
        filterUsers
    );


document
    .getElementById("roleFilter")
    .addEventListener(
        "change",
        filterUsers
    );


document
    .getElementById("statusFilter")
    .addEventListener(
        "change",
        filterUsers
    );


document
    .getElementById("departmentFilter")
    .addEventListener(
        "change",
        filterUsers
    );

</script>

</asp:Content>