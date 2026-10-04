<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EduFlow.Admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
    .role-cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:var(--spacing-md);margin-bottom:var(--spacing-lg)}
    .role-card{background:rgba(255,255,255,.8);backdrop-filter:blur(12px);border-radius:var(--radius-xl);border:2px solid var(--border-subtle);padding:var(--spacing-lg);cursor:pointer;transition:all .3s;text-align:center}
    .role-card:hover{transform:translateY(-4px);box-shadow:var(--shadow-lg)}
    .role-card.active{border-color:var(--primary);background:rgba(79,70,229,.05)}
    .role-icon{width:56px;height:56px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;font-size:24px;margin:0 auto var(--spacing-sm)}
    .role-icon.admin{background:linear-gradient(135deg,rgba(79,70,229,.1),rgba(79,70,229,.2));color:var(--primary)}
    .role-icon.manager{background:linear-gradient(135deg,rgba(0,81,213,.1),rgba(0,81,213,.2));color:var(--info)}
    .role-icon.counselor{background:linear-gradient(135deg,rgba(34,197,94,.1),rgba(34,197,94,.2));color:var(--success)}
    .role-icon.staff{background:linear-gradient(135deg,rgba(245,158,11,.1),rgba(245,158,11,.2));color:var(--warning)}
    .role-icon.viewer{background:linear-gradient(135deg,rgba(119,117,135,.1),rgba(119,117,135,.2));color:var(--outline)}
    .role-count{font-size:28px;font-weight:700;margin:0}
    .role-label{font-size:13px;color:var(--on-surface-variant);font-weight:500;margin:4px 0 0}

    /* View Toggle */
    .view-toggle{display:flex;background:var(--surface-container);border-radius:var(--radius-full);padding:4px;gap:4px}
    .view-toggle-btn{padding:8px 16px;border:none;background:transparent;border-radius:var(--radius-full);font-size:13px;font-weight:500;color:var(--on-surface-variant);cursor:pointer;transition:all .2s;display:flex;align-items:center;gap:6px}
    .view-toggle-btn.active{background:var(--primary);color:white;box-shadow:0 2px 8px rgba(79,70,229,.3)}

    /* Filter */
    .filter-bar{background:rgba(255,255,255,.8);backdrop-filter:blur(12px);border-radius:var(--radius-xl);border:1px solid var(--border-subtle);padding:var(--spacing-md) var(--spacing-lg);margin-bottom:var(--spacing-lg);display:flex;gap:var(--spacing-md);align-items:flex-end;flex-wrap:wrap}
    .filter-group{display:flex;flex-direction:column;gap:4px;min-width:180px}
    .filter-label{font-size:11px;font-weight:600;color:var(--on-surface-variant);text-transform:uppercase;letter-spacing:.05em}
    .filter-select,.filter-input{height:40px;border:1px solid var(--border-subtle);border-radius:var(--radius-md);padding:0 12px;font-size:13px;background:white}
    .filter-select:focus,.filter-input:focus{outline:none;border-color:var(--primary);box-shadow:0 0 0 3px rgba(79,70,229,.1)}

    /* Grid View */
    .users-grid{display:none;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:var(--spacing-lg)}
    .user-card{background:rgba(255,255,255,.8);backdrop-filter:blur(12px);border-radius:var(--radius-xl);border:1px solid var(--border-subtle);overflow:hidden;transition:all .3s;cursor:pointer}
    .user-card:hover{transform:translateY(-4px);box-shadow:var(--shadow-lg)}

    .user-card-top{padding:var(--spacing-lg);display:flex;gap:var(--spacing-md);align-items:flex-start}
    .user-avatar-lg{width:56px;height:56px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;font-size:20px;font-weight:700;color:white;flex-shrink:0;position:relative}
    .user-avatar-lg.admin{background:linear-gradient(135deg,var(--primary),var(--primary-dark))}
    .user-avatar-lg.manager{background:linear-gradient(135deg,var(--info),#0041a8)}
    .user-avatar-lg.counselor{background:linear-gradient(135deg,var(--success),#16a34a)}
    .user-avatar-lg.staff{background:linear-gradient(135deg,var(--warning),#d97706)}
    .user-online-dot{position:absolute;bottom:2px;right:2px;width:14px;height:14px;border-radius:50%;border:3px solid white}
    .user-online-dot.online{background:var(--success)}
    .user-online-dot.offline{background:var(--outline-variant)}

    .user-card-info{flex:1}
    .user-card-name{font-size:16px;font-weight:600;color:var(--on-surface);margin:0 0 2px}
    .user-card-email{font-size:12px;color:var(--on-surface-variant);margin:0 0 8px}
    .user-role-badge{display:inline-flex;align-items:center;gap:4px;padding:3px 12px;border-radius:var(--radius-full);font-size:11px;font-weight:600}
    .user-role-badge.admin{background:rgba(79,70,229,.1);color:var(--primary)}
    .user-role-badge.manager{background:rgba(0,81,213,.1);color:var(--info)}
    .user-role-badge.counselor{background:rgba(34,197,94,.1);color:var(--success)}
    .user-role-badge.staff{background:rgba(245,158,11,.1);color:var(--warning)}

    .user-card-menu{position:relative}
    .menu-btn{width:32px;height:32px;border:none;background:transparent;color:var(--on-surface-variant);cursor:pointer;border-radius:var(--radius-md);display:flex;align-items:center;justify-content:center;transition:all .2s}
    .menu-btn:hover{background:var(--surface-container);color:var(--primary)}

    .dropdown-menu-custom{display:none;position:absolute;right:0;top:100%;background:white;border-radius:var(--radius-lg);box-shadow:var(--shadow-lg);border:1px solid var(--border-subtle);min-width:180px;z-index:10;padding:6px}
    .dropdown-menu-custom.show{display:block}
    .dropdown-item-custom{display:flex;align-items:center;gap:10px;padding:10px 14px;border-radius:var(--radius-md);font-size:14px;color:var(--on-surface);cursor:pointer;transition:all .2s;border:none;background:none;width:100%}
    .dropdown-item-custom:hover{background:var(--surface-container-low)}
    .dropdown-item-custom.danger{color:var(--danger)}
    .dropdown-item-custom.danger:hover{background:rgba(239,68,68,.05)}
    .dropdown-item-custom i{width:18px;text-align:center}

    .user-card-stats{display:grid;grid-template-columns:repeat(3,1fr);border-top:1px solid var(--border-subtle)}
    .card-stat{padding:var(--spacing-md);text-align:center;border-right:1px solid var(--border-subtle)}
    .card-stat:last-child{border-right:none}
    .card-stat-value{font-size:16px;font-weight:700;color:var(--on-surface)}
    .card-stat-label{font-size:10px;color:var(--on-surface-variant);text-transform:uppercase;letter-spacing:.05em}

    .user-card-meta{padding:0 var(--spacing-lg) var(--spacing-md);display:flex;gap:var(--spacing-md);flex-wrap:wrap}
    .user-meta-item{display:flex;align-items:center;gap:6px;font-size:12px;color:var(--on-surface-variant)}
    .user-meta-item i{color:var(--primary);width:14px}

    /* Table View */
    .table-view{display:none}
    .table-view.active{display:block}
    .grid-view.active{display:grid}
    .user-table-card{background:rgba(255,255,255,.8);backdrop-filter:blur(12px);border-radius:var(--radius-xl);border:1px solid var(--border-subtle);overflow:hidden}
    .user-table{width:100%;border-collapse:collapse}
    .user-table thead{background:var(--surface-container-low)}
    .user-table th{padding:14px 16px;text-align:left;font-size:12px;font-weight:600;color:var(--on-surface-variant);text-transform:uppercase;letter-spacing:.05em;border-bottom:1px solid var(--border-subtle);white-space:nowrap}
    .user-table td{padding:14px 16px;border-bottom:1px solid var(--border-subtle);font-size:14px;vertical-align:middle}
    .user-table tbody tr{transition:all .2s}
    .user-table tbody tr:hover{background:var(--surface-container-low)}
    .user-table tbody tr:last-child td{border-bottom:none}

    .table-user{display:flex;align-items:center;gap:12px}
    .table-avatar{width:40px;height:40px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;font-weight:600;font-size:14px;flex-shrink:0;color:white}
    .table-name{font-weight:600;color:var(--on-surface)}
    .table-email{font-size:12px;color:var(--on-surface-variant)}

    .status-dot{display:inline-flex;align-items:center;gap:6px;font-size:13px}
    .status-dot::before{content:'';width:8px;height:8px;border-radius:50%}
    .status-dot.active::before{background:var(--success)}
    .status-dot.inactive::before{background:var(--danger)}
    .status-dot.suspended::before{background:var(--warning)}

    .action-btn-sm{width:32px;height:32px;border:none;background:transparent;color:var(--on-surface-variant);cursor:pointer;border-radius:var(--radius-md);display:inline-flex;align-items:center;justify-content:center;transition:all .2s}
    .action-btn-sm:hover{background:var(--surface-container);color:var(--primary)}
    .action-btn-sm.delete:hover{color:var(--danger)}

    .table-footer{display:flex;justify-content:space-between;align-items:center;padding:var(--spacing-lg);border-top:1px solid var(--border-subtle)}
    .pagination-info{font-size:14px;color:var(--on-surface-variant)}
    .pagination-controls{display:flex;gap:8px}
    .page-btn{width:36px;height:36px;border:1px solid var(--border-subtle);background:white;border-radius:var(--radius-md);cursor:pointer;font-size:14px;font-weight:500;display:flex;align-items:center;justify-content:center;transition:all .2s}
    .page-btn:hover{border-color:var(--primary);color:var(--primary)}
    .page-btn.active{background:var(--primary);color:white;border-color:var(--primary)}

    /* Delete Modal */
    .modal-overlay{display:none;position:fixed;inset:0;background:rgba(15,23,42,.4);z-index:2000;align-items:center;justify-content:center;padding:16px}
    .modal-overlay.show{display:flex}
    .modal-card{background:white;border-radius:var(--radius-xl);padding:var(--spacing-xl);max-width:480px;width:100%;box-shadow:var(--shadow-xl);text-align:center;animation:slideUp .3s}
    @keyframes slideUp{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
    .modal-icon{width:80px;height:80px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;font-size:36px;margin:0 auto var(--spacing-lg)}
    .modal-icon.danger{background:rgba(239,68,68,.1);color:var(--danger)}
    .modal-title{font-size:20px;font-weight:700;margin:0 0 8px}
    .modal-text{font-size:14px;color:var(--on-surface-variant);margin:0 0 var(--spacing-xl);line-height:1.6}
    .modal-actions{display:flex;gap:var(--spacing-md);justify-content:center}

    @media(max-width:768px){.users-grid{grid-template-columns:1fr}.filter-bar{flex-direction:column}.filter-group{min-width:auto;width:100%}.role-cards{grid-template-columns:repeat(2,1fr)}}
     
    @media (max-width: 768px) 
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
                <div class="topbar-left"><button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button><div class="topbar-search"><i class="fas fa-search"></i><input type="text" placeholder="Search users..."></div></div>
                <div class="topbar-right"><button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button><button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button></div>
            </header>

            <div class="content-area">
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                    <div><h1 class="headline-lg mb-1">User Management</h1><p class="text-muted">Manage team members, roles, and permissions</p></div>
                    <div class="d-flex gap-2 align-items-center">
                        <div class="view-toggle"><button type="button" class="view-toggle-btn active" id="gridViewBtn"><i class="fas fa-th-large"></i> Grid</button><button type="button" class="view-toggle-btn" id="tableViewBtn"><i class="fas fa-list"></i> Table</button></div>
                        <a href="add-user.html" class="btn btn-primary"><i class="fas fa-user-plus"></i> Add User</a>
                    </div>
                </div>

                <!-- Role Cards -->
                <div class="role-cards">
                    <div class="role-card active" data-role="all"><div class="role-icon admin"><i class="fas fa-users"></i></div><p class="role-count">18</p><p class="role-label">All Users</p></div>
                    <div class="role-card" data-role="admin"><div class="role-icon admin"><i class="fas fa-shield-alt"></i></div><p class="role-count">3</p><p class="role-label">Administrators</p></div>
                    <div class="role-card" data-role="manager"><div class="role-icon manager"><i class="fas fa-user-tie"></i></div><p class="role-count">4</p><p class="role-label">Managers</p></div>
                    <div class="role-card" data-role="counselor"><div class="role-icon counselor"><i class="fas fa-headset"></i></div><p class="role-count">8</p><p class="role-label">Counselors</p></div>
                    <div class="role-card" data-role="staff"><div class="role-icon staff"><i class="fas fa-user"></i></div><p class="role-count">3</p><p class="role-label">Staff</p></div>
                </div>

                <!-- Filters -->
                <div class="filter-bar">
                    <div class="filter-group"><label class="filter-label">Status</label><select class="filter-select"><option>All Status</option><option>Active</option><option>Inactive</option><option>Suspended</option></select></div>
                    <div class="filter-group"><label class="filter-label">Department</label><select class="filter-select"><option>All Departments</option><option>Admissions</option><option>Counseling</option><option>Academics</option><option>Admin</option></select></div>
                    <div class="filter-group" style="flex:1"><label class="filter-label">Search</label><input type="text" class="filter-input" placeholder="Name, email, phone..."></div>
                    <button class="btn btn-sm btn-secondary" style="height:40px"><i class="fas fa-redo"></i> Reset</button>
                </div>

                <!-- Grid View -->
                <div class="users-grid grid-view active" id="gridView">
                    <!-- Admin User -->
                    <div class="user-card" onclick="window.location.href='user-details.html'">
                        <div class="user-card-top">
                            <div class="user-avatar-lg admin">AK<div class="user-online-dot online" id="statusDot-1"></div></div>
                            <div class="user-card-info">
                                <p class="user-card-name">Anil Kumar</p>
                                <p class="user-card-email">anil.kumar@institution.edu</p>
                                <span class="user-role-badge admin" id="roleBadge-1"><i class="fas fa-shield-alt"></i> Super Admin</span>
                            </div>
                            <div class="user-card-menu">
                                <button class="menu-btn" onclick="event.stopPropagation();toggleMenu(this)"><i class="fas fa-ellipsis-v"></i></button>
                                <div class="dropdown-menu-custom">
                                    <button class="dropdown-item-custom" onclick="event.stopPropagation();window.location.href='user-details.html'"><i class="fas fa-eye"></i> View Details</button>
                                    <button class="dropdown-item-custom" onclick="event.stopPropagation();openEditModal('Anil Kumar', 'anil.kumar@institution.edu', '+91 98765 00001', 'admin', 'Admin')"><i class="fas fa-edit"></i> Edit User</button>
                                    <button class="dropdown-item-custom" onclick="event.stopPropagation();openAssignRoleModal('Anil Kumar', 'admin')"><i class="fas fa-user-tag"></i> Assign Role</button>
                                    <button class="dropdown-item-custom" onclick="event.stopPropagation();toggleUserStatus('1', 'Anil Kumar')"><i class="fas fa-power-off"></i> Activate / Deactivate</button>
                                    <button class="dropdown-item-custom" onclick="event.stopPropagation();openResetPasswordModal('Anil Kumar')"><i class="fas fa-key"></i> Reset Password</button>
                                    <button class="dropdown-item-custom danger" onclick="event.stopPropagation();openDeleteModal('Anil Kumar')"><i class="fas fa-trash"></i> Delete</button>
                                </div>
                            </div>
                        </div>
                        <div class="user-card-meta">
                            <div class="user-meta-item"><i class="fas fa-phone"></i> +91 98765 00001</div>
                            <div class="user-meta-item"><i class="fas fa-calendar"></i> Joined Jan 2020</div>
                        </div>
                        <div class="user-card-stats">
                            <div class="card-stat"><div class="card-stat-value">—</div><div class="card-stat-label">Leads</div></div>
                            <div class="card-stat"><div class="card-stat-value">—</div><div class="card-stat-label">Sessions</div></div>
                            <div class="card-stat"><div class="card-stat-value">Full</div><div class="card-stat-label">Access</div></div>
                        </div>
                    </div>

                    <!-- Manager -->
                    <div class="user-card" onclick="window.location.href='user-details.html'">
                        <div class="user-card-top">
                            <div class="user-avatar-lg manager">RG<div class="user-online-dot online" id="statusDot-2"></div></div>
                            <div class="user-card-info"><p class="user-card-name">Rahul Gupta</p><p class="user-card-email">rahul.gupta@institution.edu</p><span class="user-role-badge manager" id="roleBadge-2"><i class="fas fa-user-tie"></i> Admission Manager</span></div>
                            <div class="user-card-menu"><button class="menu-btn" onclick="event.stopPropagation();toggleMenu(this)"><i class="fas fa-ellipsis-v"></i></button><div class="dropdown-menu-custom"><button class="dropdown-item-custom" onclick="event.stopPropagation();window.location.href='user-details.html'"><i class="fas fa-eye"></i> View Details</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openEditModal('Rahul Gupta', 'rahul.gupta@institution.edu', '+91 98765 00002', 'manager', 'Admissions')"><i class="fas fa-edit"></i> Edit User</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openAssignRoleModal('Rahul Gupta', 'manager')"><i class="fas fa-user-tag"></i> Assign Role</button><button class="dropdown-item-custom" onclick="event.stopPropagation();toggleUserStatus('2', 'Rahul Gupta')"><i class="fas fa-power-off"></i> Activate / Deactivate</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openResetPasswordModal('Rahul Gupta')"><i class="fas fa-key"></i> Reset Password</button><button class="dropdown-item-custom danger" onclick="event.stopPropagation();openDeleteModal('Rahul Gupta')"><i class="fas fa-trash"></i> Delete</button></div></div>
                        </div>
                        <div class="user-card-meta"><div class="user-meta-item"><i class="fas fa-phone"></i> +91 98765 00002</div><div class="user-meta-item"><i class="fas fa-building"></i> Admissions Dept</div></div>
                        <div class="user-card-stats"><div class="card-stat"><div class="card-stat-value">42</div><div class="card-stat-label">Leads</div></div><div class="card-stat"><div class="card-stat-value">28</div><div class="card-stat-label">Approved</div></div><div class="card-stat"><div class="card-stat-value">High</div><div class="card-stat-label">Access</div></div></div>
                    </div>

                    <!-- Counselor 1 -->
                    <div class="user-card" onclick="window.location.href='user-details.html'">
                        <div class="user-card-top">
                            <div class="user-avatar-lg counselor">SP<div class="user-online-dot online" id="statusDot-3"></div></div>
                            <div class="user-card-info"><p class="user-card-name">Sarah Patel</p><p class="user-card-email">sarah.patel@institution.edu</p><span class="user-role-badge counselor" id="roleBadge-3"><i class="fas fa-headset"></i> Senior Counselor</span></div>
                            <div class="user-card-menu"><button class="menu-btn" onclick="event.stopPropagation();toggleMenu(this)"><i class="fas fa-ellipsis-v"></i></button><div class="dropdown-menu-custom"><button class="dropdown-item-custom" onclick="event.stopPropagation();window.location.href='user-details.html'"><i class="fas fa-eye"></i> View</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openEditModal('Sarah Patel', 'sarah.patel@institution.edu', '+91 98765 00003', 'counselor', 'Counseling')"><i class="fas fa-edit"></i> Edit</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openAssignRoleModal('Sarah Patel', 'counselor')"><i class="fas fa-user-tag"></i> Assign Role</button><button class="dropdown-item-custom" onclick="event.stopPropagation();toggleUserStatus('3', 'Sarah Patel')"><i class="fas fa-power-off"></i> Activate / Deactivate</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openResetPasswordModal('Sarah Patel')"><i class="fas fa-key"></i> Reset Password</button><button class="dropdown-item-custom danger" onclick="event.stopPropagation();openDeleteModal('Sarah Patel')"><i class="fas fa-trash"></i> Delete</button></div></div>
                        </div>
                        <div class="user-card-meta"><div class="user-meta-item"><i class="fas fa-phone"></i> +91 98765 00003</div><div class="user-meta-item"><i class="fas fa-star" style="color:var(--warning)"></i> 4.8 Rating</div></div>
                        <div class="user-card-stats"><div class="card-stat"><div class="card-stat-value">45</div><div class="card-stat-label">Leads</div></div><div class="card-stat"><div class="card-stat-value">68</div><div class="card-stat-label">Sessions</div></div><div class="card-stat"><div class="card-stat-value">72%</div><div class="card-stat-label">Convert</div></div></div>
                    </div>

                    <!-- Counselor 2 -->
                    <div class="user-card" onclick="window.location.href='user-details.html'">
                        <div class="user-card-top">
                            <div class="user-avatar-lg counselor">MP<div class="user-online-dot offline" id="statusDot-4"></div></div>
                            <div class="user-card-info"><p class="user-card-name">Meera Patil</p><p class="user-card-email">meera.patil@institution.edu</p><span class="user-role-badge counselor" id="roleBadge-4"><i class="fas fa-headset"></i> Counselor</span></div>
                            <div class="user-card-menu"><button class="menu-btn" onclick="event.stopPropagation();toggleMenu(this)"><i class="fas fa-ellipsis-v"></i></button><div class="dropdown-menu-custom"><button class="dropdown-item-custom" onclick="event.stopPropagation();window.location.href='user-details.html'"><i class="fas fa-eye"></i> View</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openEditModal('Meera Patil', 'meera.patil@institution.edu', '+91 98765 00004', 'counselor', 'Counseling')"><i class="fas fa-edit"></i> Edit</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openAssignRoleModal('Meera Patil', 'counselor')"><i class="fas fa-user-tag"></i> Assign Role</button><button class="dropdown-item-custom" onclick="event.stopPropagation();toggleUserStatus('4', 'Meera Patil')"><i class="fas fa-power-off"></i> Activate / Deactivate</button><button class="dropdown-item-custom" onclick="event.stopPropagation();openResetPasswordModal('Meera Patil')"><i class="fas fa-key"></i> Reset Password</button><button class="dropdown-item-custom danger" onclick="event.stopPropagation();openDeleteModal('Meera Patil')"><i class="fas fa-trash"></i> Delete</button></div></div>
                        </div>
                        <div class="user-card-meta"><div class="user-meta-item"><i class="fas fa-phone"></i> +91 98765 00004</div><div class="user-meta-item"><i class="fas fa-star" style="color:var(--warning)"></i> 4.7 Rating</div></div>
                        <div class="user-card-stats"><div class="card-stat"><div class="card-stat-value">32</div><div class="card-stat-label">Leads</div></div><div class="card-stat"><div class="card-stat-value">48</div><div class="card-stat-label">Sessions</div></div><div class="card-stat"><div class="card-stat-value">70%</div><div class="card-stat-label">Convert</div></div></div>
                    </div>
                </div>

                <!-- Table View -->
                <div class="table-view" id="tableView">
                    <div class="user-table-card"><div style="overflow-x:auto">
                        <table class="user-table">
                            <thead><tr><th>User</th><th>Role</th><th>Department</th><th>Phone</th><th>Status</th><th>Last Login</th><th>Actions</th></tr></thead>
                            <tbody>
                                <tr>
                                    <td><div class="table-user"><div class="table-avatar" style="background:linear-gradient(135deg,var(--primary),var(--primary-dark))">AK</div><div><div class="table-name">Anil Kumar</div><div class="table-email">anil.kumar@institution.edu</div></div></div></td>
                                    <td><span class="user-role-badge admin"><i class="fas fa-shield-alt"></i> Super Admin</span></td>
                                    <td>Admin</td>
                                    <td>+91 98765 00001</td>
                                    <td><span class="status-dot active" id="tableStatus-1">Active</span></td>
                                    <td>2 min ago</td>
                                    <td>
                                        <button class="action-btn-sm" onclick="window.location.href='user-details.html'" title="View Details"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn-sm" onclick="openEditModal('Anil Kumar', 'anil.kumar@institution.edu', '+91 98765 00001', 'admin', 'Admin')" title="Edit User"><i class="fas fa-edit"></i></button>
                                        <button class="action-btn-sm" onclick="openAssignRoleModal('Anil Kumar', 'admin')" title="Assign Role"><i class="fas fa-user-tag"></i></button>
                                        <button class="action-btn-sm" onclick="toggleUserStatus('1', 'Anil Kumar')" title="Activate / Deactivate"><i class="fas fa-power-off"></i></button>
                                        <button class="action-btn-sm" onclick="openResetPasswordModal('Anil Kumar')" title="Reset Password"><i class="fas fa-key"></i></button>
                                        <button class="action-btn-sm delete" onclick="openDeleteModal('Anil Kumar')" title="Delete User"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="table-user"><div class="table-avatar" style="background:linear-gradient(135deg,var(--info),#0041a8)">RG</div><div><div class="table-name">Rahul Gupta</div><div class="table-email">rahul.gupta@institution.edu</div></div></div></td>
                                    <td><span class="user-role-badge manager"><i class="fas fa-user-tie"></i> Manager</span></td>
                                    <td>Admissions</td>
                                    <td>+91 98765 00002</td>
                                    <td><span class="status-dot active" id="tableStatus-2">Active</span></td>
                                    <td>10 min ago</td>
                                    <td>
                                        <button class="action-btn-sm" onclick="window.location.href='user-details.html'" title="View Details"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn-sm" onclick="openEditModal('Rahul Gupta', 'rahul.gupta@institution.edu', '+91 98765 00002', 'manager', 'Admissions')" title="Edit User"><i class="fas fa-edit"></i></button>
                                        <button class="action-btn-sm" onclick="openAssignRoleModal('Rahul Gupta', 'manager')" title="Assign Role"><i class="fas fa-user-tag"></i></button>
                                        <button class="action-btn-sm" onclick="toggleUserStatus('2', 'Rahul Gupta')" title="Activate / Deactivate"><i class="fas fa-power-off"></i></button>
                                        <button class="action-btn-sm" onclick="openResetPasswordModal('Rahul Gupta')" title="Reset Password"><i class="fas fa-key"></i></button>
                                        <button class="action-btn-sm delete" onclick="openDeleteModal('Rahul Gupta')" title="Delete User"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><div class="table-user"><div class="table-avatar" style="background:linear-gradient(135deg,var(--success),#16a34a)">SP</div><div><div class="table-name">Sarah Patel</div><div class="table-email">sarah.patel@institution.edu</div></div></div></td>
                                    <td><span class="user-role-badge counselor"><i class="fas fa-headset"></i> Sr. Counselor</span></td>
                                    <td>Counseling</td>
                                    <td>+91 98765 00003</td>
                                    <td><span class="status-dot active" id="tableStatus-3">Active</span></td>
                                    <td>1 hr ago</td>
                                    <td>
                                        <button class="action-btn-sm" onclick="window.location.href='user-details.html'" title="View Details"><i class="fas fa-eye"></i></button>
                                        <button class="action-btn-sm" onclick="openEditModal('Sarah Patel', 'sarah.patel@institution.edu', '+91 98765 00003', 'counselor', 'Counseling')" title="Edit User"><i class="fas fa-edit"></i></button>
                                        <button class="action-btn-sm" onclick="openAssignRoleModal('Sarah Patel', 'counselor')" title="Assign Role"><i class="fas fa-user-tag"></i></button>
                                        <button class="action-btn-sm" onclick="toggleUserStatus('3', 'Sarah Patel')" title="Activate / Deactivate"><i class="fas fa-power-off"></i></button>
                                        <button class="action-btn-sm" onclick="openResetPasswordModal('Sarah Patel')" title="Reset Password"><i class="fas fa-key"></i></button>
                                        <button class="action-btn-sm delete" onclick="openDeleteModal('Sarah Patel')" title="Delete User"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-footer"><div class="pagination-info">Showing <strong>1-6</strong> of <strong>18</strong></div><div class="pagination-controls"><button class="page-btn" disabled><i class="fas fa-chevron-left"></i></button><button class="page-btn active">1</button><button class="page-btn">2</button><button class="page-btn">3</button><button class="page-btn"><i class="fas fa-chevron-right"></i></button></div></div>
                </div></div>
            </div>
        </main> 


    <div class="modal fade" id="addUserModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-primary text-white rounded-top-4">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-plus me-2"></i>Add New User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form onsubmit="event.preventDefault(); alert('New user created successfully!'); bootstrap.Modal.getInstance(document.getElementById('addUserModal')).hide();">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Full Name *</label>
                            <input type="text" class="form-control" placeholder="e.g. Vikram Sharma" required>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Email Address *</label>
                                <input type="email" class="form-control" placeholder="user@institution.edu" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Phone Number *</label>
                                <input type="tel" class="form-control" placeholder="+91 98765 00000" required>
                            </div>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Role *</label>
                                <select class="form-select" required>
                                    <option value="admin">Administrator</option>
                                    <option value="manager">Admission Manager</option>
                                    <option value="counselor" selected>Counselor</option>
                                    <option value="staff">Staff</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Department *</label>
                                <select class="form-select" required>
                                    <option value="Admissions">Admissions</option>
                                    <option value="Counseling" selected>Counseling</option>
                                    <option value="Academics">Academics</option>
                                    <option value="Admin">Admin</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Initial Password *</label>
                            <input type="password" class="form-control" value="Password@123" required>
                        </div>
                    </div>
                    <div class="modal-footer border-0 bg-light rounded-bottom-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-check-circle me-1"></i> Create User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 2. Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-primary text-white rounded-top-4">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-edit me-2"></i>Edit User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form onsubmit="event.preventDefault(); alert('User details updated successfully!'); bootstrap.Modal.getInstance(document.getElementById('editUserModal')).hide();">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Full Name</label>
                            <input type="text" class="form-control" id="editNameInput" required>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input type="email" class="form-control" id="editEmailInput" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Phone Number</label>
                                <input type="tel" class="form-control" id="editPhoneInput" required>
                            </div>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Role</label>
                                <select class="form-select" id="editRoleSelect">
                                    <option value="admin">Administrator</option>
                                    <option value="manager">Admission Manager</option>
                                    <option value="counselor">Counselor</option>
                                    <option value="staff">Staff</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Department</label>
                                <select class="form-select" id="editDeptSelect">
                                    <option value="Admissions">Admissions</option>
                                    <option value="Counseling">Counseling</option>
                                    <option value="Academics">Academics</option>
                                    <option value="Admin">Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer border-0 bg-light rounded-bottom-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-save me-1"></i> Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 3. Assign Role Modal -->
    <div class="modal fade" id="assignRoleModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-info text-white rounded-top-4">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-tag me-2"></i>Assign Role for <span id="assignRoleUserName"></span></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form onsubmit="event.preventDefault(); alert('User role assigned successfully!'); bootstrap.Modal.getInstance(document.getElementById('assignRoleModal')).hide();">
                    <div class="modal-body p-4">
                        <label class="form-label fw-semibold mb-3">Select System Access Role</label>
                        <div class="d-flex flex-column gap-2 mb-3">
                            <label class="border p-3 rounded-3 d-flex align-items-center gap-3 cursor-pointer">
                                <input type="radio" name="assignedRole" value="admin" class="form-check-input">
                                <div>
                                    <strong class="d-block text-primary"><i class="fas fa-shield-alt me-1"></i> Administrator</strong>
                                    <span class="text-muted small">Full system settings, user management, and global reports</span>
                                </div>
                            </label>
                            <label class="border p-3 rounded-3 d-flex align-items-center gap-3 cursor-pointer">
                                <input type="radio" name="assignedRole" value="manager" class="form-check-input">
                                <div>
                                    <strong class="d-block text-info"><i class="fas fa-user-tie me-1"></i> Admission Manager</strong>
                                    <span class="text-muted small">Approve applications, assign counselors, manage document verification</span>
                                </div>
                            </label>
                            <label class="border p-3 rounded-3 d-flex align-items-center gap-3 cursor-pointer">
                                <input type="radio" name="assignedRole" value="counselor" class="form-check-input">
                                <div>
                                    <strong class="d-block text-success"><i class="fas fa-headset me-1"></i> Counselor</strong>
                                    <span class="text-muted small">View assigned students, log counseling sessions & follow-ups</span>
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer border-0 bg-light rounded-bottom-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-info text-white"><i class="fas fa-check me-1"></i> Update Role</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 4. Reset Password Modal -->
    <div class="modal fade" id="resetPasswordModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-lg">
                <div class="modal-header bg-warning text-dark rounded-top-4">
                    <h5 class="modal-title fw-bold"><i class="fas fa-key me-2"></i>Reset Password for <span id="resetPasswordUserName"></span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form onsubmit="event.preventDefault(); alert('Password reset successfully!'); bootstrap.Modal.getInstance(document.getElementById('resetPasswordModal')).hide();">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">New Password</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="newPassInput" value="EduPass#2024" required>
                                <button class="btn btn-outline-secondary" type="button" onclick="document.getElementById('newPassInput').value='Pass#'+Math.floor(1000+Math.random()*9000);">Generate</button>
                            </div>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="sendEmailNotice" checked>
                            <label class="form-check-label small" for="sendEmailNotice">Send email notification with login instructions</label>
                        </div>
                    </div>
                    <div class="modal-footer border-0 bg-light rounded-bottom-4">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-warning text-dark"><i class="fas fa-lock me-1"></i> Reset Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 5. Delete User Modal -->
    <div class="modal-overlay" id="deleteModal">
        <div class="modal-card">
            <div class="modal-icon danger"><i class="fas fa-user-slash"></i></div>
            <h3 class="modal-title">Delete User</h3>
            <p class="modal-text">Are you sure you want to delete <strong id="deleteUserName"></strong>? This will revoke all access and remove associated data permanently.</p>
            <div class="modal-actions">
                <button class="btn btn-secondary" onclick="closeDeleteModal()"><i class="fas fa-times"></i> Cancel</button>
                <button class="btn btn-danger" style="background:linear-gradient(180deg,var(--danger),#dc2626);box-shadow:0 4px 6px rgba(239,68,68,.3)" onclick="confirmDelete()"><i class="fas fa-trash"></i> Delete User</button>
            </div>
        </div>
    </div>


    <script>
        // Toggle view (Grid / Table)
        document.getElementById('gridViewBtn').addEventListener('click', function () {
            this.classList.add('active');
            document.getElementById('tableViewBtn').classList.remove('active');
            document.getElementById('gridView').classList.add('active');
            document.getElementById('tableView').classList.remove('active');
        });
        document.getElementById('tableViewBtn').addEventListener('click', function () {
            this.classList.add('active');
            document.getElementById('gridViewBtn').classList.remove('active');
            document.getElementById('tableView').classList.add('active');
            document.getElementById('gridView').classList.remove('active');
        });

        // Filter cards
        document.querySelectorAll('.role-card').forEach(card => {
            card.addEventListener('click', function () {
                document.querySelectorAll('.role-card').forEach(c => c.classList.remove('active'));
                this.classList.add('active');
            });
        });

        function toggleMenu(btn) {
            event.stopPropagation();
            document.querySelectorAll('.dropdown-menu-custom').forEach(m => m.classList.remove('show'));
            btn.nextElementSibling.classList.toggle('show');
        }
        document.addEventListener('click', () => {
            document.querySelectorAll('.dropdown-menu-custom').forEach(m => m.classList.remove('show'));
        });

        // Modals opening functions
        function openEditModal(name, email, phone, role, dept) {
            document.getElementById('editNameInput').value = name;
            document.getElementById('editEmailInput').value = email;
            document.getElementById('editPhoneInput').value = phone;
            document.getElementById('editRoleSelect').value = role;
            document.getElementById('editDeptSelect').value = dept;
            new bootstrap.Modal(document.getElementById('editUserModal')).show();
        }

        function openAssignRoleModal(name, currentRole) {
            document.getElementById('assignRoleUserName').textContent = name;
            const radios = document.getElementsByName('assignedRole');
            radios.forEach(r => { if (r.value === currentRole) r.checked = true; });
            new bootstrap.Modal(document.getElementById('assignRoleModal')).show();
        }

        function openResetPasswordModal(name) {
            document.getElementById('resetPasswordUserName').textContent = name;
            new bootstrap.Modal(document.getElementById('resetPasswordModal')).show();
        }

        function toggleUserStatus(id, name) {
            const dot = document.getElementById('statusDot-' + id);
            const tableDot = document.getElementById('tableStatus-' + id);
            if (dot) {
                if (dot.classList.contains('online')) {
                    dot.className = 'user-online-dot offline';
                    if (tableDot) { tableDot.className = 'status-dot inactive'; tableDot.textContent = 'Inactive'; }
                    alert(name + ' has been Deactivated.');
                } else {
                    dot.className = 'user-online-dot online';
                    if (tableDot) { tableDot.className = 'status-dot active'; tableDot.textContent = 'Active'; }
                    alert(name + ' has been Activated.');
                }
            } else {
                alert('User status toggled for ' + name);
            }
        }

        function openDeleteModal(name) {
            document.getElementById('deleteUserName').textContent = name;
            document.getElementById('deleteModal').classList.add('show');
        }
        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('show');
        }
        function confirmDelete() {
            alert('User deleted permanently!');
            closeDeleteModal();
        }
        document.getElementById('deleteModal').addEventListener('click', function (e) {
            if (e.target === this) closeDeleteModal();
        });
    </script>
</asp:Content>
