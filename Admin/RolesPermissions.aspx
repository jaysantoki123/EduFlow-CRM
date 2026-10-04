<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="RolesPermissions.aspx.cs" Inherits="EduFlow.Admin.RolesPermissions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">

      /* Role Cards */
        .role-cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-lg);
        }

        .role-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 2px solid var(--border-subtle);
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .role-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .role-card.active {
            border-color: var(--primary);
        }

        .role-card-stripe {
            height: 6px;
        }

        .role-card-stripe.admin { background: linear-gradient(90deg, var(--primary), var(--primary-dark)); }
        .role-card-stripe.manager { background: linear-gradient(90deg, var(--info), #0041a8); }
        .role-card-stripe.counselor { background: linear-gradient(90deg, var(--success), #16a34a); }
        .role-card-stripe.staff { background: linear-gradient(90deg, var(--warning), #d97706); }
        .role-card-stripe.viewer { background: linear-gradient(90deg, var(--outline), #555); }

        .role-card-body {
            padding: var(--spacing-lg);
        }

        .role-card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-md);
        }

        .role-icon-box {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .role-icon-box.admin { background: rgba(79, 70, 229, 0.1); color: var(--primary); }
        .role-icon-box.manager { background: rgba(0, 81, 213, 0.1); color: var(--info); }
        .role-icon-box.counselor { background: rgba(34, 197, 94, 0.1); color: var(--success); }
        .role-icon-box.staff { background: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .role-icon-box.viewer { background: rgba(119, 117, 135, 0.1); color: var(--outline); }

        .role-card-actions {
            display: flex;
            gap: 4px;
        }

        .role-action-btn {
            width: 32px;
            height: 32px;
            border: none;
            background: transparent;
            color: var(--on-surface-variant);
            cursor: pointer;
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .role-action-btn:hover { background: var(--surface-container); color: var(--primary); }
        .role-action-btn.delete:hover { color: var(--danger); }

        .role-card-name {
            font-size: 18px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0 0 4px;
        }

        .role-card-desc {
            font-size: 13px;
            color: var(--on-surface-variant);
            margin: 0 0 var(--spacing-md);
            line-height: 1.5;
        }

        .role-card-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: var(--spacing-md);
            border-top: 1px solid var(--border-subtle);
        }

        .role-user-count {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            font-weight: 600;
            color: var(--on-surface);
        }

        .role-user-avatars {
            display: flex;
        }

        .role-user-mini {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            border: 2px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            font-weight: 600;
            color: white;
            margin-left: -8px;
        }

        .role-user-mini:first-child { margin-left: 0; }
        .role-user-mini.admin { background: var(--primary); }
        .role-user-mini.manager { background: var(--info); }
        .role-user-mini.counselor { background: var(--success); }
        .role-user-mini.staff { background: var(--warning); }
        .role-user-mini.more { background: var(--surface-container-high); color: var(--on-surface-variant); }

        .permission-count-badge {
            padding: 3px 10px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 600;
        }

        .permission-count-badge.full { background: rgba(34, 197, 94, 0.1); color: var(--success); }
        .permission-count-badge.partial { background: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .permission-count-badge.limited { background: rgba(119, 117, 135, 0.1); color: var(--outline); }

        /* Permission Matrix */
        .matrix-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            overflow: hidden;
            margin-bottom: var(--spacing-lg);
        }

        .matrix-header {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-subtle);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .matrix-title {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .matrix-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1), rgba(0, 81, 213, 0.1));
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px;
        }

        .matrix-title h3 { font-size: 18px; font-weight: 600; margin: 0; }
        .matrix-title p { font-size: 12px; color: var(--on-surface-variant); margin: 0; }

        .matrix-table-wrapper { overflow-x: auto; }

        .matrix-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        .matrix-table thead { background: var(--surface-container-low); }

        .matrix-table th {
            padding: 14px 16px;
            text-align: center;
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 2px solid var(--border-subtle);
            white-space: nowrap;
        }

        .matrix-table th:first-child {
            text-align: left;
            min-width: 280px;
            position: sticky;
            left: 0;
            background: var(--surface-container-low);
            z-index: 2;
        }

        .matrix-table td {
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-subtle);
            text-align: center;
            vertical-align: middle;
        }

        .matrix-table td:first-child {
            text-align: left;
            position: sticky;
            left: 0;
            background: white;
            z-index: 1;
        }

        .matrix-table tbody tr:hover td {
            background: var(--surface-container-low);
        }

        .matrix-table tbody tr:hover td:first-child {
            background: var(--surface-container-low);
        }

        .matrix-table tbody tr:last-child td { border-bottom: none; }

        /* Module Group Header */
        .module-group-row td {
            background: var(--surface-container-low) !important;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 700;
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .module-name {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .module-icon {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-md);
            background: rgba(79, 70, 229, 0.08);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            flex-shrink: 0;
        }

        .module-label { font-size: 14px; font-weight: 500; color: var(--on-surface); }
        .module-sub { font-size: 11px; color: var(--on-surface-variant); }

        /* Permission Checkboxes */
        .perm-check {
            width: 22px;
            height: 22px;
            border-radius: var(--radius-sm);
            cursor: pointer;
            accent-color: var(--primary);
        }

        .perm-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 28px;
            height: 28px;
            border-radius: var(--radius-md);
            font-size: 13px;
        }

        .perm-badge.granted { background: rgba(34, 197, 94, 0.15); color: var(--success); }
        .perm-badge.denied { background: rgba(239, 68, 68, 0.1); color: var(--danger); }

        /* Role Header Columns */
        .role-col-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
        }

        .role-col-icon {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: white;
        }

        .role-col-icon.admin { background: var(--primary); }
        .role-col-icon.manager { background: var(--info); }
        .role-col-icon.counselor { background: var(--success); }
        .role-col-icon.staff { background: var(--warning); }
        .role-col-icon.viewer { background: var(--outline); }

        .role-col-name { font-size: 11px; font-weight: 600; }

        /* Create Role Modal */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(15, 23, 42, 0.5);
            z-index: 2000;
            align-items: center;
            justify-content: center;
            padding: 16px;
        }

        .modal-overlay.show { display: flex; }

        .modal-card {
            background: white;
            border-radius: var(--radius-xl);
            max-width: 600px;
            width: 100%;
            box-shadow: var(--shadow-xl);
            animation: slideUp 0.3s ease;
            max-height: 90vh;
            overflow-y: auto;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal-header {
            padding: var(--spacing-xl) var(--spacing-xl) var(--spacing-md);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h2 { font-size: 20px; font-weight: 700; margin: 0; }

        .modal-close {
            width: 36px;
            height: 36px;
            border: none;
            background: var(--surface-container);
            border-radius: var(--radius-full);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .modal-close:hover { background: var(--danger); color: white; }

        .modal-body { padding: 0 var(--spacing-xl) var(--spacing-xl); }

        .form-group { margin-bottom: var(--spacing-lg); }
        .form-label { font-size: 14px; font-weight: 600; color: var(--on-surface); margin-bottom: 8px; display: block; }
        .form-label.required::after { content: '*'; color: var(--danger); margin-left: 4px; }

        .form-control, .form-select {
            height: 48px; border: 1px solid var(--border-subtle); border-radius: var(--radius-md);
            padding: 12px 16px; font-size: 14px; background: white; width: 100%;
        }

        .form-control:focus, .form-select:focus {
            outline: none; border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        textarea.form-control { height: 80px; resize: vertical; }

        /* Color Picker */
        .color-picker-row {
            display: flex;
            gap: var(--spacing-sm);
            flex-wrap: wrap;
        }

        .color-option {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-full);
            cursor: pointer;
            border: 3px solid transparent;
            transition: all 0.2s;
        }

        .color-option:hover { transform: scale(1.1); }
        .color-option.selected { border-color: var(--on-surface); box-shadow: 0 0 0 2px white, 0 0 0 4px var(--on-surface); }

        /* Permission Checklist in Modal */
        .modal-permissions {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm);
            max-height: 300px;
            overflow-y: auto;
            padding-right: var(--spacing-sm);
        }

        .modal-perm-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--spacing-sm) var(--spacing-md);
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
        }

        .modal-perm-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
        }

        .modal-perm-icon {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-md);
            background: rgba(79, 70, 229, 0.08);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        .modal-perm-name { font-size: 14px; font-weight: 500; color: var(--on-surface); margin: 0; }

        .perm-toggle-group {
            display: flex;
            gap: 4px;
        }

        .perm-toggle-btn {
            padding: 4px 10px;
            border: 1px solid var(--border-subtle);
            background: white;
            border-radius: var(--radius-md);
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
        }

        .perm-toggle-btn:hover { border-color: var(--primary); }
        .perm-toggle-btn.active.view { background: rgba(0, 81, 213, 0.1); color: var(--info); border-color: var(--info); }
        .perm-toggle-btn.active.create { background: rgba(34, 197, 94, 0.1); color: var(--success); border-color: var(--success); }
        .perm-toggle-btn.active.edit { background: rgba(245, 158, 11, 0.1); color: var(--warning); border-color: var(--warning); }
        .perm-toggle-btn.active.delete { background: rgba(239, 68, 68, 0.1); color: var(--danger); border-color: var(--danger); }
        .perm-toggle-btn.active.full { background: rgba(79, 70, 229, 0.1); color: var(--primary); border-color: var(--primary); }

        .modal-footer {
            padding: var(--spacing-md) var(--spacing-xl) var(--spacing-xl);
            display: flex;
            justify-content: flex-end;
            gap: var(--spacing-md);
        }

        /* Delete Modal */
        .delete-modal-card {
            background: white;
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            max-width: 480px;
            width: 100%;
            text-align: center;
            animation: slideUp 0.3s;
        }

        .delete-icon {
            width: 80px;
            height: 80px;
            border-radius: var(--radius-full);
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            margin: 0 auto var(--spacing-lg);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .role-cards-grid { grid-template-columns: 1fr; }
            .modal-card { max-height: 95vh; }
        }
    </style>

    <!-- Authentication and Navigation Control -->
    <script src="../js/auth.js"></script>
    <script src="../js/navigation.js"></script>

    <!-- Responsive Enhancements -->
    <style>
        @media (max-width: 768px) {
            .calendar-layout { grid-template-columns: 1fr !important; }
            .search-box { width: 100% !important; }
            .filter-group { min-width: auto !important; width: 100% !important; }
            .table-container, .user-table-card, .inquiry-table-card, .counseling-table-card,
            .followup-table-card, .student-table-card, .application-table-card { overflow-x: auto !important; -webkit-overflow-scrolling: touch; }
            .table, .user-table, .matrix-table { min-width: 550px !important; }
            .matrix-table { min-width: 800px !important; }
            .card-header { flex-wrap: wrap !important; gap: 8px !important; }
            .table-header { flex-direction: column !important; align-items: flex-start !important; }
            .table-actions { width: 100% !important; flex-wrap: wrap !important; }
            .table-footer { flex-direction: column !important; gap: 12px !important; align-items: flex-start !important; }
            .permissions-detail-layout { grid-template-columns: 1fr !important; }
            .role-cards-grid { grid-template-columns: 1fr 1fr !important; }
        }
        @media (max-width: 576px) {
            .filter-row { grid-template-columns: 1fr !important; }
            .role-cards-grid { grid-template-columns: 1fr !important; }
            .quick-action-grid { grid-template-columns: repeat(2, 1fr) !important; }
            .users-grid { grid-template-columns: 1fr !important; }
            .form-actions { flex-direction: column !important; }
            .form-actions .btn { width: 100% !important; justify-content: center !important; }
            .stats-grid-4 { grid-template-columns: 1fr 1fr !important; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <header class="topbar">
                <div class="topbar-left"><button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button><div class="topbar-search"><i class="fas fa-search"></i><input type="text" placeholder="Search roles..."></div></div>
                <div class="topbar-right"><button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button><button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button></div>
            </header>

            <div class="content-area">
                <!-- Page Header -->
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div>
                        <h1 class="headline-lg mb-1">Roles & Permissions</h1>
                        <p class="text-muted">Define access levels and manage role-based permissions</p>
                    </div>
                    <button class="btn btn-primary" onclick="openCreateRoleModal()">
                        <i class="fas fa-plus"></i> Create New Role
                    </button>
                </div>

                <!-- Role Cards -->
                <div class="role-cards-grid">
                    <!-- Super Admin -->
                    <div class="role-card active" onclick="selectRole('admin')">
                        <div class="role-card-stripe admin"></div>
                        <div class="role-card-body">
                            <div class="role-card-header">
                                <div class="role-icon-box admin"><i class="fas fa-shield-alt"></i></div>
                                <div class="role-card-actions">
                                    <button class="role-action-btn" title="Edit" onclick="event.stopPropagation();openCreateRoleModal('edit')"><i class="fas fa-edit"></i></button>
                                </div>
                            </div>
                            <h3 class="role-card-name">Super Admin</h3>
                            <p class="role-card-desc">Full system access with ability to manage all modules, users, roles and settings.</p>
                            <div class="role-card-meta">
                                <div class="role-user-count">
                                    <div class="role-user-avatars">
                                        <div class="role-user-mini admin">AK</div>
                                        <div class="role-user-mini admin">RN</div>
                                        <div class="role-user-mini admin">PD</div>
                                    </div>
                                    <span>3 Users</span>
                                </div>
                                <span class="permission-count-badge full">All Permissions</span>
                            </div>
                        </div>
                    </div>

                    <!-- Admission Manager -->
                    <div class="role-card" onclick="selectRole('manager')">
                        <div class="role-card-stripe manager"></div>
                        <div class="role-card-body">
                            <div class="role-card-header">
                                <div class="role-icon-box manager"><i class="fas fa-user-tie"></i></div>
                                <div class="role-card-actions">
                                    <button class="role-action-btn" title="Edit" onclick="event.stopPropagation();openCreateRoleModal('edit')"><i class="fas fa-edit"></i></button>
                                    <button class="role-action-btn delete" title="Delete" onclick="event.stopPropagation();openDeleteRoleModal('Admission Manager')"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>
                            <h3 class="role-card-name">Admission Manager</h3>
                            <p class="role-card-desc">Manages admission process, applications, approvals and student enrollments.</p>
                            <div class="role-card-meta">
                                <div class="role-user-count">
                                    <div class="role-user-avatars">
                                        <div class="role-user-mini manager">RG</div>
                                        <div class="role-user-mini manager">AS</div>
                                        <div class="role-user-mini manager">KP</div>
                                        <div class="role-user-mini more">+1</div>
                                    </div>
                                    <span>4 Users</span>
                                </div>
                                <span class="permission-count-badge partial">18 Permissions</span>
                            </div>
                        </div>
                    </div>

                    <!-- Counselor -->
                    <div class="role-card" onclick="selectRole('counselor')">
                        <div class="role-card-stripe counselor"></div>
                        <div class="role-card-body">
                            <div class="role-card-header">
                                <div class="role-icon-box counselor"><i class="fas fa-headset"></i></div>
                                <div class="role-card-actions">
                                    <button class="role-action-btn" title="Edit" onclick="event.stopPropagation();openCreateRoleModal('edit')"><i class="fas fa-edit"></i></button>
                                    <button class="role-action-btn delete" title="Delete" onclick="event.stopPropagation();openDeleteRoleModal('Counselor')"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>
                            <h3 class="role-card-name">Counselor</h3>
                            <p class="role-card-desc">Handles student counseling, follow-ups and inquiry management.</p>
                            <div class="role-card-meta">
                                <div class="role-user-count">
                                    <div class="role-user-avatars">
                                        <div class="role-user-mini counselor">SP</div>
                                        <div class="role-user-mini counselor">MP</div>
                                        <div class="role-user-mini counselor">VK</div>
                                        <div class="role-user-mini more">+5</div>
                                    </div>
                                    <span>8 Users</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Staff -->
                    <div class="role-card" onclick="selectRole('staff')">
                        <div class="role-card-stripe staff"></div>
                        <div class="role-card-body">
                            <div class="role-card-header">
                                <div class="role-icon-box staff"><i class="fas fa-user"></i></div>
                                <div class="role-card-actions">
                                    <button class="role-action-btn" title="Edit" onclick="event.stopPropagation();openCreateRoleModal('edit', 'Staff Member', 'Data entry & support staff for inquiry logs.')"><i class="fas fa-edit"></i></button>
                                    <button class="role-action-btn delete" title="Delete" onclick="event.stopPropagation();openDeleteRoleModal('Staff')"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>
                            <h3 class="role-card-name">Staff Member</h3>
                            <p class="role-card-desc">Basic data entry, inquiry logging, and administrative support tasks.</p>
                            <div class="role-card-meta">
                                <div class="role-user-count">
                                    <div class="role-user-avatars">
                                        <div class="role-user-mini staff">DK</div>
                                        <div class="role-user-mini staff">MS</div>
                                        <div class="role-user-mini staff">RK</div>
                                    </div>
                                    <span>3 Users</span>
                                </div>
                                <span class="permission-count-badge limited">6 Permissions</span>
                            </div>
                        </div>
                    </div>

                    <!-- Read-Only Viewer -->
                    <div class="role-card" onclick="selectRole('viewer')">
                        <div class="role-card-stripe viewer"></div>
                        <div class="role-card-body">
                            <div class="role-card-header">
                                <div class="role-icon-box viewer"><i class="fas fa-eye"></i></div>
                                <div class="role-card-actions">
                                    <button class="role-action-btn" title="Edit" onclick="event.stopPropagation();openCreateRoleModal('edit', 'Read-Only Viewer', 'Auditor view with read-only dashboard & report access.')"><i class="fas fa-edit"></i></button>
                                    <button class="role-action-btn delete" title="Delete" onclick="event.stopPropagation();openDeleteRoleModal('Read-Only Viewer')"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>
                            <h3 class="role-card-name">Read-Only Viewer</h3>
                            <p class="role-card-desc">Auditor & executive access to view dashboard metrics and export reports.</p>
                            <div class="role-card-meta">
                                <div class="role-user-count">
                                    <div class="role-user-avatars">
                                        <div class="role-user-mini more">2</div>
                                    </div>
                                    <span>2 Users</span>
                                </div>
                                <span class="permission-count-badge limited">3 Permissions</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Permission Matrix -->
                <div class="matrix-section">
                    <div class="matrix-header">
                        <div class="matrix-title">
                            <div class="matrix-icon"><i class="fas fa-table"></i></div>
                            <div>
                                <h3>Permission Matrix</h3>
                                <p>Overview of all role permissions across modules</p>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <button class="btn btn-sm btn-secondary"><i class="fas fa-download"></i> Export</button>
                            <button class="btn btn-sm btn-primary" id="saveMatrixBtn"><i class="fas fa-save"></i> Save Changes</button>
                        </div>
                    </div>

                    <div class="matrix-table-wrapper">
                        <table class="matrix-table">
                            <thead>
                                <tr>
                                    <th>Module / Permission</th>
                                    <th><div class="role-col-header"><div class="role-col-icon admin"><i class="fas fa-shield-alt"></i></div><span class="role-col-name">Super Admin</span></div></th>
                                    <th><div class="role-col-header"><div class="role-col-icon manager"><i class="fas fa-user-tie"></i></div><span class="role-col-name">Manager</span></div></th>
                                    <th><div class="role-col-header"><div class="role-col-icon counselor"><i class="fas fa-headset"></i></div><span class="role-col-name">Counselor</span></div></th>
                                    <th><div class="role-col-header"><div class="role-col-icon staff"><i class="fas fa-user"></i></div><span class="role-col-name">Staff</span></div></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Dashboard -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-home" style="margin-right:8px"></i> DASHBOARD</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-chart-line"></i></div><div><div class="module-label">View Dashboard</div><div class="module-sub">Access dashboard analytics</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td></tr>

                                <!-- Inquiries -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-clipboard-list" style="margin-right:8px"></i> INQUIRIES</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-eye"></i></div><div><div class="module-label">View Inquiries</div><div class="module-sub">Browse all inquiry records</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-plus"></i></div><div><div class="module-label">Create Inquiries</div><div class="module-sub">Add new inquiries</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-edit"></i></div><div><div class="module-label">Edit Inquiries</div><div class="module-sub">Modify inquiry details</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-trash"></i></div><div><div class="module-label">Delete Inquiries</div><div class="module-sub">Remove inquiry records</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-user-plus"></i></div><div><div class="module-label">Assign Counselor</div><div class="module-sub">Assign leads to counselors</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- Counseling -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-user-tie" style="margin-right:8px"></i> COUNSELING</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-eye"></i></div><div><div class="module-label">View Sessions</div><div class="module-sub">Browse counseling sessions</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-calendar-plus"></i></div><div><div class="module-label">Schedule Sessions</div><div class="module-sub">Create new sessions</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- Applications -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-file-alt" style="margin-right:8px"></i> APPLICATIONS</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-eye"></i></div><div><div class="module-label">View Applications</div><div class="module-sub">Access application records</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-check-circle"></i></div><div><div class="module-label">Approve / Reject</div><div class="module-sub">Admission decisions</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-file-check"></i></div><div><div class="module-label">Verify Documents</div><div class="module-sub">Document verification</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- Students -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-user-graduate" style="margin-right:8px"></i> STUDENTS</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-eye"></i></div><div><div class="module-label">View Students</div><div class="module-sub">Access student records</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check" checked></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-edit"></i></div><div><div class="module-label">Edit Students</div><div class="module-sub">Modify student records</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- Reports -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-chart-bar" style="margin-right:8px"></i> REPORTS & ANALYTICS</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-chart-pie"></i></div><div><div class="module-label">View Reports</div><div class="module-sub">Access analytics</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-download"></i></div><div><div class="module-label">Export Reports</div><div class="module-sub">Download report data</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check" checked></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- User Management -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-users-cog" style="margin-right:8px"></i> USER MANAGEMENT</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-users"></i></div><div><div class="module-label">Manage Users</div><div class="module-sub">Add, edit, delete users</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-shield-alt"></i></div><div><div class="module-label">Manage Roles</div><div class="module-sub">Create and edit roles</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>

                                <!-- Settings -->
                                <tr class="module-group-row"><td colspan="5"><i class="fas fa-cog" style="margin-right:8px"></i> SETTINGS</td></tr>
                                <tr><td><div class="module-name"><div class="module-icon"><i class="fas fa-sliders-h"></i></div><div><div class="module-label">System Settings</div><div class="module-sub">Configuration & preferences</div></div></div></td><td><input type="checkbox" class="perm-check" checked disabled></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td><td><input type="checkbox" class="perm-check"></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>


     <div class="modal-overlay" id="roleModal">
        <div class="modal-card">
            <div class="modal-header">
                <h2 id="roleModalTitle">Create New Role</h2>
                <button class="modal-close" onclick="closeRoleModal()"><i class="fas fa-times"></i></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label required">Role Name</label>
                    <input type="text" class="form-control" id="roleName" placeholder="e.g., Marketing Manager">
                </div>
                <div class="form-group">
                    <label class="form-label">Description</label>
                    <textarea class="form-control" id="roleDesc" placeholder="Describe this role's responsibilities..."></textarea>
                </div>
                <div class="form-group">
                    <label class="form-label">Role Color</label>
                    <div class="color-picker-row">
                        <div class="color-option selected" style="background:var(--primary)" data-color="primary"></div>
                        <div class="color-option" style="background:var(--info)" data-color="info"></div>
                        <div class="color-option" style="background:var(--success)" data-color="success"></div>
                        <div class="color-option" style="background:var(--warning)" data-color="warning"></div>
                        <div class="color-option" style="background:var(--danger)" data-color="danger"></div>
                        <div class="color-option" style="background:var(--tertiary)" data-color="tertiary"></div>
                        <div class="color-option" style="background:#8b5cf6" data-color="purple"></div>
                        <div class="color-option" style="background:#ec4899" data-color="pink"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Permissions</label>
                    <div class="modal-permissions">
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-home"></i></div><p class="modal-perm-name">Dashboard</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn active view" onclick="togglePermBtn(this)">View</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-clipboard-list"></i></div><p class="modal-perm-name">Inquiries</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn active view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn active create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-user-tie"></i></div><p class="modal-perm-name">Counseling</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn active view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn active create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-phone-alt"></i></div><p class="modal-perm-name">Follow-ups</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn active view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn active create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-file-alt"></i></div><p class="modal-perm-name">Applications</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-user-graduate"></i></div><p class="modal-perm-name">Students</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn active view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-chart-bar"></i></div><p class="modal-perm-name">Reports</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn create" onclick="togglePermBtn(this)">Export</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-users-cog"></i></div><p class="modal-perm-name">Users</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn view" onclick="togglePermBtn(this)">View</button><button class="perm-toggle-btn create" onclick="togglePermBtn(this)">Create</button><button class="perm-toggle-btn edit" onclick="togglePermBtn(this)">Edit</button><button class="perm-toggle-btn delete" onclick="togglePermBtn(this)">Delete</button></div></div>
                        <div class="modal-perm-item"><div class="modal-perm-info"><div class="modal-perm-icon"><i class="fas fa-cog"></i></div><p class="modal-perm-name">Settings</p></div><div class="perm-toggle-group"><button class="perm-toggle-btn full" onclick="togglePermBtn(this)">Full</button></div></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeRoleModal()"><i class="fas fa-times"></i> Cancel</button>
                <button class="btn btn-primary" onclick="saveRole()"><i class="fas fa-save"></i> Save Role</button>
            </div>
        </div>
    </div>

    <!-- Delete Role Modal -->
    <div class="modal-overlay" id="deleteRoleModal">
        <div class="delete-modal-card">
            <div class="delete-icon"><i class="fas fa-shield-alt"></i></div>
            <h3 style="font-size:20px;font-weight:700;margin:0 0 8px">Delete Role</h3>
            <p style="font-size:14px;color:var(--on-surface-variant);margin:0 0 var(--spacing-xl);line-height:1.6">Are you sure you want to delete the <strong id="deleteRoleName"></strong> role? All users with this role will be moved to the default "Staff" role.</p>
            <div style="display:flex;gap:var(--spacing-md);justify-content:center">
                <button class="btn btn-secondary" onclick="closeDeleteRoleModal()"><i class="fas fa-times"></i> Cancel</button>
                <button class="btn btn-primary" style="background:linear-gradient(180deg,var(--danger),#dc2626);box-shadow:0 4px 6px rgba(239,68,68,.3)" onclick="confirmDeleteRole()"><i class="fas fa-trash"></i> Delete Role</button>
            </div>
        </div>
    </div>



    <script>
        // Sidebar
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // Select Role Card
        function selectRole(role) {
            document.querySelectorAll('.role-card').forEach(c => c.classList.remove('active'));
            event.currentTarget.classList.add('active');
        }

        // Color Picker
        document.querySelectorAll('.color-option').forEach(opt => {
            opt.addEventListener('click', function() {
                document.querySelectorAll('.color-option').forEach(o => o.classList.remove('selected'));
                this.classList.add('selected');
            });
        });

        // Permission Toggle
        function togglePermBtn(btn) {
            btn.classList.toggle('active');
        }

        // Create/Edit Role Modal
        function openCreateRoleModal(mode, roleName = '', roleDesc = '') {
            document.getElementById('roleModalTitle').textContent = mode === 'edit' ? 'Edit Role: ' + (roleName || 'System Role') : 'Create New Role';
            document.getElementById('roleName').value = roleName;
            document.getElementById('roleDesc').value = roleDesc;
            document.getElementById('roleModal').classList.add('show');
        }

        function closeRoleModal() {
            document.getElementById('roleModal').classList.remove('show');
        }

        function saveRole() {
            const name = document.getElementById('roleName').value.trim();
            if (!name) { alert('Role name is required'); return; }
            alert('Role saved successfully!');
            closeRoleModal();
        }

        // Delete Role Modal
        function openDeleteRoleModal(name) {
            document.getElementById('deleteRoleName').textContent = name;
            document.getElementById('deleteRoleModal').classList.add('show');
        }

        function closeDeleteRoleModal() {
            document.getElementById('deleteRoleModal').classList.remove('show');
        }

        function confirmDeleteRole() {
            alert('Role deleted!');
            closeDeleteRoleModal();
        }

        // Close modals on overlay click
        document.getElementById('roleModal').addEventListener('click', function(e) { if (e.target === this) closeRoleModal(); });
        document.getElementById('deleteRoleModal').addEventListener('click', function(e) { if (e.target === this) closeDeleteRoleModal(); });

        // Save Matrix
        document.getElementById('saveMatrixBtn').addEventListener('click', function() {
            alert('Permission matrix saved successfully!');
        });

        // Mobile);
        
    </script>
</asp:Content>
