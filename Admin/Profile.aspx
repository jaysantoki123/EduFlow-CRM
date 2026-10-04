<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EduFlow.Admin.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
        /* Admin Profile Hero Banner */
        .admin-banner {
            height: 240px;
            background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 40%, #312e81 70%, #4f46e5 100%);
            border-radius: var(--radius-xl) var(--radius-xl) 0 0;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-md);
        }

        .admin-banner::before {
            content: '';
            position: absolute;
            inset: 0;
            background-image:
                radial-gradient(circle at 20% 30%, rgba(99, 102, 241, 0.25) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(16, 185, 129, 0.2) 0%, transparent 50%),
                url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }

        .banner-badge {
            position: absolute;
            top: var(--spacing-md);
            left: var(--spacing-md);
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: #38bdf8;
            padding: 6px 14px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .banner-badge i {
            color: #f59e0b;
        }

        .banner-actions {
            position: absolute;
            top: var(--spacing-md);
            right: var(--spacing-md);
            display: flex;
            gap: var(--spacing-sm);
            z-index: 2;
        }

        .banner-btn {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .banner-btn:hover {
            background: rgba(255, 255, 255, 0.28);
            transform: translateY(-1px);
            color: white;
        }

        /* Profile Header Card */
        .admin-header-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(16px);
            border: 1px solid var(--border-subtle);
            border-top: none;
            border-radius: 0 0 var(--radius-xl) var(--radius-xl);
            padding: 0 var(--spacing-xl) var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            box-shadow: var(--shadow-md);
        }

        .admin-profile-top {
            display: flex;
            gap: var(--spacing-xl);
            align-items: flex-end;
            margin-top: -64px;
        }

        .admin-avatar-wrapper {
            position: relative;
            flex-shrink: 0;
        }

        .admin-avatar {
            width: 136px;
            height: 136px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, #312e81 0%, #4f46e5 50%, #0284c7 100%);
            border: 6px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            font-weight: 800;
            color: white;
            box-shadow: 0 20px 25px -5px rgba(15, 23, 42, 0.3);
            position: relative;
        }

        .avatar-edit-trigger {
            position: absolute;
            bottom: 6px;
            right: 6px;
            width: 38px;
            height: 38px;
            background: var(--primary);
            color: white;
            border: 3px solid white;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: var(--shadow-md);
        }

        .avatar-edit-trigger:hover {
            background: var(--primary-dark);
            transform: scale(1.1);
        }

        .admin-status-pulse {
            position: absolute;
            top: 10px;
            right: 12px;
            width: 22px;
            height: 22px;
            background: #22c55e;
            border: 4px solid white;
            border-radius: 50%;
            box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.7);
            animation: pulse-green 2s infinite;
        }

        @keyframes pulse-green {
            0% {
                box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.7);
            }

            70% {
                box-shadow: 0 0 0 10px rgba(34, 197, 94, 0);
            }

            100% {
                box-shadow: 0 0 0 0 rgba(34, 197, 94, 0);
            }
        }

        .admin-info-main {
            flex: 1;
            padding-bottom: var(--spacing-xs);
        }

        .admin-title-row {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 6px;
        }

        .admin-name {
            font-size: 30px;
            font-weight: 800;
            color: var(--on-surface);
            margin: 0;
            letter-spacing: -0.5px;
        }

        .super-admin-chip {
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.15) 0%, rgba(2, 132, 199, 0.15) 100%);
            border: 1px solid rgba(79, 70, 229, 0.3);
            color: var(--primary);
            padding: 4px 14px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .admin-meta-row {
            display: flex;
            gap: var(--spacing-lg);
            flex-wrap: wrap;
            margin-top: 8px;
        }

        .admin-meta-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: var(--on-surface-variant);
            font-weight: 500;
        }

        .admin-meta-item i {
            color: var(--primary);
            width: 16px;
            text-align: center;
        }

        .admin-top-actions {
            display: flex;
            gap: var(--spacing-sm);
            padding-bottom: var(--spacing-xs);
        }

        /* KPI Quick Stats Row */
        .admin-stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .admin-stat-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
        }

        .admin-stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-md);
            border-color: rgba(79, 70, 229, 0.3);
        }

        .stat-icon-wrapper {
            width: 52px;
            height: 52px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            flex-shrink: 0;
        }

        .stat-content {
            display: flex;
            flex-direction: column;
        }

        .stat-value {
            font-size: 24px;
            font-weight: 800;
            line-height: 1.1;
            margin: 0;
            color: var(--on-surface);
        }

        .stat-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-top: 4px;
        }

        /* Profile Tabs */
        .nav-tabs-custom {
            display: flex;
            gap: 6px;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: 6px;
            margin-bottom: var(--spacing-lg);
            overflow-x: auto;
            scrollbar-width: none;
        }

        .nav-tabs-custom::-webkit-scrollbar {
            display: none;
        }

        .tab-btn {
            padding: 10px 20px;
            border: none;
            background: transparent;
            border-radius: var(--radius-lg);
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface-variant);
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .tab-btn:hover {
            background: var(--surface-container-low);
            color: var(--primary);
        }

        .tab-btn.active {
            background: var(--primary);
            color: white;
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
        }

        .tab-btn .badge-pill {
            background: rgba(255, 255, 255, 0.25);
            color: white;
            padding: 2px 8px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 700;
        }

        .tab-btn:not(.active) .badge-pill {
            background: var(--surface-container);
            color: var(--on-surface-variant);
        }

        /* Detail Section Card */
        .admin-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            box-shadow: var(--shadow-sm);
        }

        .admin-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle);
        }

        .header-title-box {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .header-icon {
            width: 44px;
            height: 44px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.12), rgba(2, 132, 199, 0.12));
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 20px;
        }

        .header-text h3 {
            font-size: 18px;
            font-weight: 700;
            margin: 0;
            color: var(--on-surface);
        }

        .header-text p {
            font-size: 13px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        /* Information Grid */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: var(--spacing-lg);
        }

        .info-field {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .info-label {
            font-size: 12px;
            font-weight: 700;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.06em;
        }

        .info-value {
            font-size: 15px;
            font-weight: 600;
            color: var(--on-surface);
        }

        /* Privilege Badges */
        .privilege-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: var(--spacing-md);
        }

        .privilege-card {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: all 0.2s ease;
        }

        .privilege-card:hover {
            border-color: rgba(79, 70, 229, 0.4);
            background: white;
        }

        .privilege-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .privilege-icon {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-md);
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .privilege-title {
            font-size: 14px;
            font-weight: 700;
            margin: 0;
        }

        .privilege-desc {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        .status-pill {
            padding: 4px 12px;
            border-radius: var(--radius-full);
            font-size: 12px;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .status-pill.granted {
            background: rgba(34, 197, 94, 0.12);
            color: #16a34a;
        }

        /* Session Item */
        .session-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: var(--spacing-md);
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            margin-bottom: var(--spacing-sm);
        }

        .session-item:last-child {
            margin-bottom: 0;
        }

        .session-left {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .session-device-icon {
            width: 42px;
            height: 42px;
            background: white;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: var(--primary);
        }

        .session-details p {
            margin: 0;
        }

        .session-title {
            font-size: 14px;
            font-weight: 700;
        }

        .session-meta {
            font-size: 12px;
            color: var(--on-surface-variant);
        }

        /* API Key Card */
        .api-key-item {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-sm);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: var(--spacing-md);
        }

        .api-key-code {
            font-family: 'Courier New', Courier, monospace;
            background: white;
            border: 1px dashed var(--border-subtle);
            padding: 6px 12px;
            border-radius: var(--radius-md);
            font-size: 13px;
            color: var(--primary);
            font-weight: 700;
        }

        /* Audit Log Table */
        .audit-table-wrapper {
            overflow-x: auto;
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
        }

        .audit-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .audit-table th {
            background: var(--surface-container-low);
            color: var(--on-surface-variant);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-subtle);
            text-align: left;
        }

        .audit-table td {
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-subtle);
            color: var(--on-surface);
            vertical-align: middle;
        }

        .audit-table tr:hover {
            background: rgba(79, 70, 229, 0.02);
        }

        .log-badge {
            padding: 4px 10px;
            border-radius: var(--radius-full);
            font-size: 11px;
            font-weight: 700;
            display: inline-block;
        }

        .log-badge.auth {
            background: rgba(0, 81, 213, 0.1);
            color: var(--info);
        }

        .log-badge.system {
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
        }

        .log-badge.security {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        .log-badge.user {
            background: rgba(34, 197, 94, 0.1);
            color: var(--success);
        }

        /* Notification Toggles */
        .toggle-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: var(--spacing-md);
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
            margin-bottom: var(--spacing-sm);
        }

        .toggle-label-box {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .toggle-icon {
            width: 38px;
            height: 38px;
            border-radius: var(--radius-md);
            background: white;
            border: 1px solid var(--border-subtle);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 16px;
        }

        .toggle-switch {
            position: relative;
            width: 46px;
            height: 24px;
            flex-shrink: 0;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            inset: 0;
            background: #cbd5e1;
            border-radius: 20px;
            transition: 0.3s;
        }

        .slider::before {
            content: '';
            position: absolute;
            height: 18px;
            width: 18px;
            left: 3px;
            bottom: 3px;
            background: white;
            border-radius: 50%;
            transition: 0.3s;
        }

        .toggle-switch input:checked+.slider {
            background: var(--primary);
        }

        .toggle-switch input:checked+.slider::before {
            transform: translateX(22px);
        }

        /* Live Toast Notification Styling */
        #toastContainer {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 99999;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .custom-toast {
            background: #0f172a;
            color: white;
            padding: 14px 20px;
            border-radius: var(--radius-lg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 14px;
            font-weight: 500;
            animation: slideInRight 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            min-width: 300px;
        }

        .custom-toast.success i {
            color: #22c55e;
        }

        .custom-toast.info i {
            color: #38bdf8;
        }

        .custom-toast.warning i {
            color: #f59e0b;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Responsive Breakpoints */
        @media (max-width: 768px) {
            .admin-profile-top {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .admin-title-row {
                justify-content: center;
            }

            .admin-meta-row {
                justify-content: center;
            }

            .admin-top-actions {
                justify-content: center;
                width: 100%;
                flex-wrap: wrap;
            }

            .banner-actions {
                position: relative;
                top: auto;
                right: auto;
                padding: 12px;
                justify-content: flex-end;
            }

            .admin-stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .privilege-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .admin-stats-grid {
                grid-template-columns: 1fr;
            }

            .session-item,
            .api-key-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .session-item .btn,
            .api-key-item .btn {
                width: 100%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
            <!-- Topbar -->
            <header class="topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle" id="sidebarToggle" aria-label="Toggle Sidebar"><i
                            class="fas fa-bars"></i></button>
                    <div class="topbar-search">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search system settings, logs, or users..."
                            id="globalSearchInput">
                    </div>
                </div>
                <div class="topbar-right">
                    <button class="topbar-icon-btn" title="Notifications"
                        onclick="window.location.href='notification-center.html'">
                        <i class="fas fa-bell"></i>
                        <span class="badge"></span>
                    </button>
                    <button class="topbar-icon-btn active" title="Admin Profile">
                        <i class="fas fa-user-circle"></i>
                    </button>
                </div>
            </header>

            <!-- Content Area -->
            <div class="content-area">
                <!-- Navigation Breadcrumb -->
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <a href="admin-dashboard.html" class="btn btn-secondary btn-sm rounded-pill px-3">
                        <i class="fas fa-arrow-left me-1"></i> Back to Dashboard
                    </a>
                    <span class="badge bg-light text-dark border px-3 py-2 rounded-pill">
                        <i class="fas fa-shield-alt text-primary me-1"></i> Clearance Level 5 (Root)
                    </span>
                </div>

                <!-- Admin Profile Banner -->
                <div class="admin-banner">
                    <div class="banner-badge">
                        <i class="fas fa-crown"></i> Super Administrator
                    </div>
                    <div class="banner-actions">
                        <button class="banner-btn" onclick="openEditProfileModal()">
                            <i class="fas fa-user-edit"></i> Edit Profile
                        </button>
                        <button class="banner-btn" onclick="exportSecurityReport()">
                            <i class="fas fa-download"></i> Security Audit
                        </button>
                    </div>
                </div>

                <!-- Admin Profile Header Card -->
                <div class="admin-header-card">
                    <div class="admin-profile-top">
                        <div class="admin-avatar-wrapper">
                            <div class="admin-avatar" id="avatarDisplay">AD</div>
                            <div class="admin-status-pulse" title="System Status: Online"></div>
                            <button class="avatar-edit-trigger" title="Change Avatar" onclick="triggerAvatarUpload()">
                                <i class="fas fa-camera"></i>
                            </button>
                            <input type="file" id="avatarFileInput" accept="image/*" style="display:none;"
                                onchange="handleAvatarFileSelect(this)">
                        </div>

                        <div class="admin-info-main">
                            <div class="admin-title-row">
                                <h1 class="admin-name" id="displayAdminName">Admin User</h1>
                                <span class="super-admin-chip">
                                    <i class="fas fa-user-shield"></i> System Root Administrator
                                </span>
                            </div>

                            <div class="admin-meta-row">
                                <div class="admin-meta-item">
                                    <i class="fas fa-id-badge"></i> ID: <span id="displayEmpId">ADM-2026-001</span>
                                </div>
                                <div class="admin-meta-item">
                                    <i class="fas fa-building"></i> Department: <span id="displayDept">IT &
                                        Infrastructure Ops</span>
                                </div>
                                <div class="admin-meta-item">
                                    <i class="fas fa-envelope"></i> Email: <span
                                        id="displayEmail">admin@educrm.institution.edu</span>
                                </div>
                                <div class="admin-meta-item">
                                    <i class="fas fa-clock"></i> Timezone: UTC+05:30 (IST)
                                </div>
                            </div>
                        </div>

                        <div class="admin-top-actions">
                            <button class="btn btn-primary btn-sm px-3" onclick="openChangePasswordModal()">
                                <i class="fas fa-key me-1"></i> Password
                            </button>
                            <button class="btn btn-outline-secondary btn-sm px-3" onclick="openApiKeyModal()">
                                <i class="fas fa-code me-1"></i> API Keys
                            </button>
                        </div>
                    </div>
                </div>

                <!-- KPI Quick Stats Grid -->
                <div class="admin-stats-grid">
                    <div class="admin-stat-card">
                        <div class="stat-icon-wrapper"
                            style="background: rgba(79, 70, 229, 0.12); color: var(--primary);">
                            <i class="fas fa-users-cog"></i>
                        </div>
                        <div class="stat-content">
                            <h3 class="stat-value">148</h3>
                            <span class="stat-label">System Users</span>
                        </div>
                    </div>

                    <div class="admin-stat-card">
                        <div class="stat-icon-wrapper" style="background: rgba(34, 197, 94, 0.12); color: #16a34a;">
                            <i class="fas fa-server"></i>
                        </div>
                        <div class="stat-content">
                            <h3 class="stat-value">99.98%</h3>
                            <span class="stat-label">System Uptime</span>
                        </div>
                    </div>

                    <div class="admin-stat-card">
                        <div class="stat-icon-wrapper" style="background: rgba(0, 81, 213, 0.12); color: var(--info);">
                            <i class="fas fa-desktop"></i>
                        </div>
                        <div class="stat-content">
                            <h3 class="stat-value">4</h3>
                            <span class="stat-label">Active Sessions</span>
                        </div>
                    </div>

                    <div class="admin-stat-card">
                        <div class="stat-icon-wrapper"
                            style="background: rgba(245, 158, 11, 0.12); color: var(--warning);">
                            <i class="fas fa-shield-virus"></i>
                        </div>
                        <div class="stat-content">
                            <h3 class="stat-value">98/100</h3>
                            <span class="stat-label">Security Score</span>
                        </div>
                    </div>
                </div>

                <!-- Navigation Tabs -->
                <div class="nav-tabs-custom">
                    <button class="tab-btn active" onclick="switchTab('tab-overview', this)">
                        <i class="fas fa-user-circle"></i> Profile Details
                    </button>
                    <button class="tab-btn" onclick="switchTab('tab-security', this)">
                        <i class="fas fa-shield-alt"></i> Security & Access <span class="badge-pill">2FA On</span>
                    </button>
                    <button class="tab-btn" onclick="switchTab('tab-privileges', this)">
                        <i class="fas fa-lock-open"></i> Permissions Matrix
                    </button>
                    <button class="tab-btn" onclick="switchTab('tab-audit', this)">
                        <i class="fas fa-list-alt"></i> Audit Logs <span class="badge-pill" id="logCountBadge">24</span>
                    </button>
                    <button class="tab-btn" onclick="switchTab('tab-preferences', this)">
                        <i class="fas fa-sliders-h"></i> System Alerts
                    </button>
                </div>

                <!-- TAB 1: Profile Details -->
                <div id="tab-overview" class="tab-content-panel">
                    <div class="row g-4">
                        <div class="col-lg-8">
                            <div class="admin-card">
                                <div class="admin-card-header">
                                    <div class="header-title-box">
                                        <div class="header-icon"><i class="fas fa-id-card"></i></div>
                                        <div class="header-text">
                                            <h3>Personal & Operational Details</h3>
                                            <p>Administrator credentials and contact information</p>
                                        </div>
                                    </div>
                                    <button class="btn btn-outline-primary btn-sm" onclick="openEditProfileModal()">
                                        <i class="fas fa-edit me-1"></i> Edit Info
                                    </button>
                                </div>

                                <div class="info-grid">
                                    <div class="info-field">
                                        <span class="info-label">Full Name</span>
                                        <span class="info-value" id="infoFullName">System Admin User</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Administrator ID</span>
                                        <span class="info-value text-primary" id="infoEmpId">ADM-2026-001</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Primary Email</span>
                                        <span class="info-value" id="infoEmail">admin@educrm.institution.edu</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Contact Phone</span>
                                        <span class="info-value" id="infoPhone">+91 98765 00000</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Administrative Role</span>
                                        <span class="info-value">Super Administrator / IT Head</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Department</span>
                                        <span class="info-value" id="infoDept">IT Operations & Infrastructure</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Account Created</span>
                                        <span class="info-value">Jan 10, 2024</span>
                                    </div>

                                    <div class="info-field">
                                        <span class="info-label">Last Login Timestamp</span>
                                        <span class="info-value text-success"><i
                                                class="fas fa-circle me-1 style-dot"></i> Today at 15:42 IST</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="admin-card">
                                <div class="admin-card-header">
                                    <div class="header-title-box">
                                        <div class="header-icon"
                                            style="background: rgba(34, 197, 94, 0.12); color: #16a34a;">
                                            <i class="fas fa-server"></i>
                                        </div>
                                        <div class="header-text">
                                            <h3>System Scope</h3>
                                            <p>System environments owned</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex flex-column gap-3">
                                    <div
                                        class="p-3 rounded-3 bg-light border d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-0 fw-bold">Production CRM Cluster</h6>
                                            <small class="text-muted">Primary AWS US-East-1</small>
                                        </div>
                                        <span class="badge bg-success">Online</span>
                                    </div>

                                    <div
                                        class="p-3 rounded-3 bg-light border d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-0 fw-bold">PostgreSQL Database Engine</h6>
                                            <small class="text-muted">Multi-AZ Standby Active</small>
                                        </div>
                                        <span class="badge bg-success">Healthy</span>
                                    </div>

                                    <div
                                        class="p-3 rounded-3 bg-light border d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-0 fw-bold">Redis Cache Cluster</h6>
                                            <small class="text-muted">Session & Notification Queue</small>
                                        </div>
                                        <span class="badge bg-primary">0ms Latency</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TAB 2: Security & Credentials -->
                <div id="tab-security" class="tab-content-panel" style="display:none;">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <!-- Password & Authentication -->
                            <div class="admin-card">
                                <div class="admin-card-header">
                                    <div class="header-title-box">
                                        <div class="header-icon"><i class="fas fa-key"></i></div>
                                        <div class="header-text">
                                            <h3>Authentication Security</h3>
                                            <p>Password policy and multi-factor setup</p>
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="mb-4 p-3 rounded-3 border bg-light d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="fs-3 text-success"><i class="fas fa-mobile-alt"></i></div>
                                        <div>
                                            <h6 class="mb-0 fw-bold">Two-Factor Authentication (2FA)</h6>
                                            <small class="text-muted">Authenticator App (TOTP) is currently
                                                active</small>
                                        </div>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input fs-4" type="checkbox" id="toggle2FA" checked
                                            onchange="toggle2FASetting(this)">
                                    </div>
                                </div>

                                <div
                                    class="d-flex justify-content-between align-items-center p-3 rounded-3 border mb-3">
                                    <div>
                                        <h6 class="mb-0 fw-bold">Account Password</h6>
                                        <small class="text-muted">Last modified 14 days ago</small>
                                    </div>
                                    <button class="btn btn-outline-primary btn-sm" onclick="openChangePasswordModal()">
                                        <i class="fas fa-sync-alt me-1"></i> Update Password
                                    </button>
                                </div>

                                <div class="d-flex justify-content-between align-items-center p-3 rounded-3 border">
                                    <div>
                                        <h6 class="mb-0 fw-bold">Hardware Security Key (WebAuthn)</h6>
                                        <small class="text-muted">YubiKey 5 Series registered</small>
                                    </div>
                                    <span class="badge bg-success">Configured</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <!-- API Key Management -->
                            <div class="admin-card">
                                <div class="admin-card-header">
                                    <div class="header-title-box">
                                        <div class="header-icon"
                                            style="background: rgba(0, 81, 213, 0.12); color: var(--info);">
                                            <i class="fas fa-code-branch"></i>
                                        </div>
                                        <div class="header-text">
                                            <h3>API Credentials</h3>
                                            <p>Access tokens for CRM API integration</p>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary btn-sm" onclick="openApiKeyModal()">
                                        <i class="fas fa-plus me-1"></i> New Key
                                    </button>
                                </div>

                                <div id="apiKeyList">
                                    <div class="api-key-item" id="apiKey-1">
                                        <div>
                                            <div class="d-flex align-items-center gap-2 mb-1">
                                                <strong class="fs-6">System Analytics Pipeline</strong>
                                                <span class="badge bg-light text-dark border">Full Access</span>
                                            </div>
                                            <div class="api-key-code">ak_live_89f7a...3901b</div>
                                            <small class="text-muted d-block mt-1">Created: Aug 01, 2026 | Last used: 10
                                                mins ago</small>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-sm btn-outline-secondary"
                                                onclick="copyApiKey('ak_live_89f7a93821049382903901b')">
                                                <i class="fas fa-copy"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger"
                                                onclick="revokeApiKey('apiKey-1')">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="api-key-item" id="apiKey-2">
                                        <div>
                                            <div class="d-flex align-items-center gap-2 mb-1">
                                                <strong class="fs-6">Zapier Integration Service</strong>
                                                <span class="badge bg-light text-dark border">Inquiries Scope</span>
                                            </div>
                                            <div class="api-key-code">ak_live_44e21...881c2</div>
                                            <small class="text-muted d-block mt-1">Created: Jun 15, 2026 | Last used:
                                                Yesterday</small>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-sm btn-outline-secondary"
                                                onclick="copyApiKey('ak_live_44e219382104938290881c2')">
                                                <i class="fas fa-copy"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger"
                                                onclick="revokeApiKey('apiKey-2')">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Active Sessions -->
                        <div class="col-12">
                            <div class="admin-card">
                                <div class="admin-card-header">
                                    <div class="header-title-box">
                                        <div class="header-icon"
                                            style="background: rgba(245, 158, 11, 0.12); color: var(--warning);">
                                            <i class="fas fa-desktop"></i>
                                        </div>
                                        <div class="header-text">
                                            <h3>Active Authenticated Sessions</h3>
                                            <p>Browsers and devices currently logged into this admin account</p>
                                        </div>
                                    </div>
                                    <button class="btn btn-outline-danger btn-sm" onclick="revokeAllOtherSessions()">
                                        <i class="fas fa-power-off me-1"></i> Log Out All Other Sessions
                                    </button>
                                </div>

                                <div id="sessionList">
                                    <div class="session-item">
                                        <div class="session-left">
                                            <div class="session-device-icon"><i class="fas fa-laptop"></i></div>
                                            <div class="session-details">
                                                <p class="session-title">Chrome 128.0 (Windows 11) <span
                                                        class="badge bg-success ms-2">Current Session</span></p>
                                                <p class="session-meta">IP Address: 192.168.1.104 | Location: Mumbai,
                                                    India | Active now</p>
                                            </div>
                                        </div>
                                        <span class="text-success fw-bold fs-7"><i class="fas fa-check-circle me-1"></i>
                                            Active</span>
                                    </div>

                                    <div class="session-item" id="session-2">
                                        <div class="session-left">
                                            <div class="session-device-icon"><i class="fas fa-mobile-alt"></i></div>
                                            <div class="session-details">
                                                <p class="session-title">Safari Mobile (iOS 17.5)</p>
                                                <p class="session-meta">IP Address: 103.22.10.45 | Location: Mumbai,
                                                    India | 2 hours ago</p>
                                            </div>
                                        </div>
                                        <button class="btn btn-sm btn-outline-danger"
                                            onclick="revokeSession('session-2')">
                                            <i class="fas fa-times me-1"></i> Revoke
                                        </button>
                                    </div>

                                    <div class="session-item" id="session-3">
                                        <div class="session-left">
                                            <div class="session-device-icon"><i class="fas fa-laptop-code"></i></div>
                                            <div class="session-details">
                                                <p class="session-title">Firefox 126.0 (macOS Sonoma)</p>
                                                <p class="session-meta">IP Address: 49.37.11.89 | Location: Pune, India
                                                    | Yesterday</p>
                                            </div>
                                        </div>
                                        <button class="btn btn-sm btn-outline-danger"
                                            onclick="revokeSession('session-3')">
                                            <i class="fas fa-times me-1"></i> Revoke
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TAB 3: Permissions Matrix -->
                <div id="tab-privileges" class="tab-content-panel" style="display:none;">
                    <div class="admin-card">
                        <div class="admin-card-header">
                            <div class="header-title-box">
                                <div class="header-icon"><i class="fas fa-user-shield"></i></div>
                                <div class="header-text">
                                    <h3>System Privilege & Scope Matrix</h3>
                                    <p>Granular authority assignment for root super administrator</p>
                                </div>
                            </div>
                            <a href="role-permissions.html" class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-cog me-1"></i> Manage Role Engine
                            </a>
                        </div>

                        <div class="privilege-grid mb-4">
                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon"><i class="fas fa-users-cog"></i></div>
                                    <div>
                                        <h4 class="privilege-title">User & Role Control</h4>
                                        <p class="privilege-desc">Create, edit, suspend & assign permissions</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>

                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon" style="background: rgba(34,197,94,0.1); color:#16a34a;">
                                        <i class="fas fa-database"></i></div>
                                    <div>
                                        <h4 class="privilege-title">Database & Backups</h4>
                                        <p class="privilege-desc">Execute snapshot dumps & restore backups</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>

                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon"
                                        style="background: rgba(0,81,213,0.1); color:var(--info);"><i
                                            class="fas fa-sliders-h"></i></div>
                                    <div>
                                        <h4 class="privilege-title">System Settings</h4>
                                        <p class="privilege-desc">Global CRM configuration & mail gateways</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>

                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon"
                                        style="background: rgba(245,158,11,0.1); color:var(--warning);"><i
                                            class="fas fa-file-invoice-dollar"></i></div>
                                    <div>
                                        <h4 class="privilege-title">Financial & Analytics</h4>
                                        <p class="privilege-desc">Fee structures, admission reports & revenue</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>

                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon"
                                        style="background: rgba(239,68,68,0.1); color:var(--danger);"><i
                                            class="fas fa-bug"></i></div>
                                    <div>
                                        <h4 class="privilege-title">Security & Audit Logs</h4>
                                        <p class="privilege-desc">Inspect all activity trails & IP overrides</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>

                            <div class="privilege-card">
                                <div class="privilege-info">
                                    <div class="privilege-icon"
                                        style="background: rgba(168,85,247,0.1); color:#a855f7;"><i
                                            class="fas fa-network-wired"></i></div>
                                    <div>
                                        <h4 class="privilege-title">API Gateway & Hooks</h4>
                                        <p class="privilege-desc">Configure Webhooks & third-party connectors</p>
                                    </div>
                                </div>
                                <span class="status-pill granted"><i class="fas fa-check"></i> Full Access</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- TAB 4: Audit Logs -->
                <div id="tab-audit" class="tab-content-panel" style="display:none;">
                    <div class="admin-card">
                        <div class="admin-card-header">
                            <div class="header-title-box">
                                <div class="header-icon"><i class="fas fa-history"></i></div>
                                <div class="header-text">
                                    <h3>Administrative Audit History</h3>
                                    <p>Real-time log of security events and administrative modifications</p>
                                </div>
                            </div>
                            <div class="d-flex gap-2">
                                <input type="text" id="logSearchInput" class="form-control form-control-sm"
                                    placeholder="Filter logs..." onkeyup="filterAuditLogs()" style="width: 200px;">
                                <button class="btn btn-outline-secondary btn-sm" onclick="exportAuditLogCSV()">
                                    <i class="fas fa-file-export me-1"></i> Export CSV
                                </button>
                            </div>
                        </div>

                        <div class="audit-table-wrapper">
                            <table class="audit-table" id="auditLogTable">
                                <thead>
                                    <tr>
                                        <th>Timestamp</th>
                                        <th>Category</th>
                                        <th>Event / Action</th>
                                        <th>Target Resource</th>
                                        <th>IP Address</th>
                                        <th>Result</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="fw-bold">Today, 15:40 IST</td>
                                        <td><span class="log-badge auth">AUTHENTICATION</span></td>
                                        <td>Admin Account Login</td>
                                        <td>/pages/admin-profile.html</td>
                                        <td>192.168.1.104</td>
                                        <td><span class="text-success fw-bold"><i class="fas fa-check-circle"></i>
                                                Success</span></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Today, 14:15 IST</td>
                                        <td><span class="log-badge system">SYSTEM</span></td>
                                        <td>Global Mail Gateway Sync</td>
                                        <td>SMTP Config</td>
                                        <td>192.168.1.104</td>
                                        <td><span class="text-success fw-bold"><i class="fas fa-check-circle"></i>
                                                Success</span></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Today, 11:30 IST</td>
                                        <td><span class="log-badge user">USER_MGMT</span></td>
                                        <td>Updated Role Permissions</td>
                                        <td>Counselor Group</td>
                                        <td>192.168.1.104</td>
                                        <td><span class="text-success fw-bold"><i class="fas fa-check-circle"></i>
                                                Success</span></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Yesterday, 18:22 IST</td>
                                        <td><span class="log-badge security">SECURITY</span></td>
                                        <td>API Key Generated</td>
                                        <td>Analytics Integration</td>
                                        <td>192.168.1.104</td>
                                        <td><span class="text-success fw-bold"><i class="fas fa-check-circle"></i>
                                                Success</span></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Yesterday, 09:10 IST</td>
                                        <td><span class="log-badge system">SYSTEM</span></td>
                                        <td>Automated Nightly Database Snapshot</td>
                                        <td>PostgreSQL Dump</td>
                                        <td>System Daemon</td>
                                        <td><span class="text-success fw-bold"><i class="fas fa-check-circle"></i>
                                                Success</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- TAB 5: System Alerts Preferences -->
                <div id="tab-preferences" class="tab-content-panel" style="display:none;">
                    <div class="admin-card">
                        <div class="admin-card-header">
                            <div class="header-title-box">
                                <div class="header-icon"><i class="fas fa-bell"></i></div>
                                <div class="header-text">
                                    <h3>Critical Notification Routing</h3>
                                    <p>Configure automated system notifications dispatched to your email</p>
                                </div>
                            </div>
                        </div>

                        <div class="toggle-item">
                            <div class="toggle-label-box">
                                <div class="toggle-icon"><i class="fas fa-shield-alt text-danger"></i></div>
                                <div>
                                    <h6 class="mb-0 fw-bold">Critical Security Alerts</h6>
                                    <small class="text-muted">Instant alert on failed admin logins, IP bans, or
                                        permission escalation attempts</small>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked
                                    onchange="showToast('Security notification policy updated', 'success')">
                                <span class="slider"></span>
                            </label>
                        </div>

                        <div class="toggle-item">
                            <div class="toggle-label-box">
                                <div class="toggle-icon"><i class="fas fa-server text-warning"></i></div>
                                <div>
                                    <h6 class="mb-0 fw-bold">System Health & Outages</h6>
                                    <small class="text-muted">Notifications when server CPU spikes above 85% or database
                                        latency exceeds threshold</small>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked
                                    onchange="showToast('Health alert preferences saved', 'info')">
                                <span class="slider"></span>
                            </label>
                        </div>

                        <div class="toggle-item">
                            <div class="toggle-label-box">
                                <div class="toggle-icon"><i class="fas fa-database text-primary"></i></div>
                                <div>
                                    <h6 class="mb-0 fw-bold">Database Backup Reports</h6>
                                    <small class="text-muted">Daily summary reports of automated snapshot integrity
                                        checks</small>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked
                                    onchange="showToast('Backup summary preference updated', 'info')">
                                <span class="slider"></span>
                            </label>
                        </div>

                        <div class="toggle-item">
                            <div class="toggle-label-box">
                                <div class="toggle-icon"><i class="fas fa-user-plus text-success"></i></div>
                                <div>
                                    <h6 class="mb-0 fw-bold">New User Registrations</h6>
                                    <small class="text-muted">Receive alerts whenever a new staff account or counselor
                                        is onboarded</small>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox"
                                    onchange="showToast('User registration alert preference updated', 'info')">
                                <span class="slider"></span>
                            </label>
                        </div>
                    </div>
                </div>

            </div>
        </main>

    <div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-edit me-2"></i> Edit Admin Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form id="editProfileForm" onsubmit="saveProfileChanges(event)">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Full Name</label>
                            <input type="text" class="form-control" id="editNameInput" required value="Admin User">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email Address</label>
                            <input type="email" class="form-control" id="editEmailInput" required
                                value="admin@educrm.institution.edu">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Phone Number</label>
                            <input type="text" class="form-control" id="editPhoneInput" required
                                value="+91 98765 00000">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Department</label>
                            <input type="text" class="form-control" id="editDeptInput" required
                                value="IT Operations & Infrastructure">
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-save me-1"></i> Save
                                Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL 2: Change Password Modal -->
    <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-key me-2"></i> Update Password</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form id="changePasswordForm" onsubmit="savePasswordChanges(event)">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Current Password</label>
                            <input type="password" class="form-control" id="currentPassInput" required
                                placeholder="Enter current password">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">New Password</label>
                            <input type="password" class="form-control" id="newPassInput" required
                                placeholder="At least 8 characters" onkeyup="checkPasswordStrength(this.value)">
                            <div class="progress mt-2" style="height: 6px;">
                                <div class="progress-bar" id="passStrengthBar" role="progressbar" style="width: 0%">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Confirm New Password</label>
                            <input type="password" class="form-control" id="confirmPassInput" required
                                placeholder="Re-enter new password">
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary"><i class="fas fa-lock me-1"></i> Update
                                Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL 3: Generate API Key Modal -->
    <div class="modal fade" id="apiKeyModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-code-branch me-2"></i> Generate New API Key</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <form id="apiKeyForm" onsubmit="generateNewApiKey(event)">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Key Identifier / Name</label>
                            <input type="text" class="form-control" id="keyNameInput" required
                                placeholder="e.g. Mobile App Gateway">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Access Scope</label>
                            <select class="form-select" id="keyScopeInput">
                                <option value="Full Access">Full Access (Read/Write)</option>
                                <option value="Read Only">Read Only Access</option>
                                <option value="Inquiries Scope">Inquiries & Leads Scope</option>
                            </select>
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-info text-white"><i class="fas fa-key me-1"></i>
                                Generate Secret Key</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Live Toast Container -->
    <div id="toastContainer"></div>

      <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Load user data from localStorage if available
            const userStr = localStorage.getItem('crmUser');
            if (userStr) {
                try {
                    const user = JSON.parse(userStr);
                    if (user.name) {
                        document.getElementById('displayAdminName').textContent = user.name;
                        document.getElementById('infoFullName').textContent = user.name;
                        document.getElementById('editNameInput').value = user.name;

                        // Set avatar initials
                        const initials = user.name.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2);
                        document.getElementById('avatarDisplay').textContent = initials || 'AD';
                    }
                    if (user.email) {
                        document.getElementById('displayEmail').textContent = user.email;
                        document.getElementById('infoEmail').textContent = user.email;
                        document.getElementById('editEmailInput').value = user.email;
                    }
                } catch (e) {
                    console.error("Error parsing crmUser:", e);
                }
            }
        });

        // Tab Switching
        function switchTab(tabId, el) {
            document.querySelectorAll('.tab-content-panel').forEach(panel => panel.style.display = 'none');
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));

            document.getElementById(tabId).style.display = 'block';
            el.classList.add('active');
        }

        // Toast Feedback Function
        function showToast(message, type = 'success') {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = `custom-toast ${type}`;

            let icon = 'fa-check-circle';
            if (type === 'info') icon = 'fa-info-circle';
            if (type === 'warning') icon = 'fa-exclamation-triangle';
            if (type === 'danger') icon = 'fa-times-circle';

            toast.innerHTML = `<i class="fas ${icon} fs-5"></i> <span>${message}</span>`;
            container.appendChild(toast);

            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translateX(100%)';
                toast.style.transition = 'all 0.3s ease';
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }

        // Profile Modal
        function openEditProfileModal() {
            const modal = new bootstrap.Modal(document.getElementById('editProfileModal'));
            modal.show();
        }

        function saveProfileChanges(e) {
            e.preventDefault();
            const newName = document.getElementById('editNameInput').value;
            const newEmail = document.getElementById('editEmailInput').value;
            const newPhone = document.getElementById('editPhoneInput').value;
            const newDept = document.getElementById('editDeptInput').value;

            document.getElementById('displayAdminName').textContent = newName;
            document.getElementById('infoFullName').textContent = newName;
            document.getElementById('displayEmail').textContent = newEmail;
            document.getElementById('infoEmail').textContent = newEmail;
            document.getElementById('infoPhone').textContent = newPhone;
            document.getElementById('displayDept').textContent = newDept;
            document.getElementById('infoDept').textContent = newDept;

            const initials = newName.split(' ').map(n => n[0]).join('').toUpperCase().substring(0, 2);
            document.getElementById('avatarDisplay').textContent = initials || 'AD';

            // Update localStorage
            const userStr = localStorage.getItem('crmUser');
            if (userStr) {
                const user = JSON.parse(userStr);
                user.name = newName;
                user.email = newEmail;
                localStorage.setItem('crmUser', JSON.stringify(user));
            }

            bootstrap.Modal.getInstance(document.getElementById('editProfileModal')).hide();
            showToast('Admin Profile updated successfully!', 'success');
        }

        // Change Password Modal
        function openChangePasswordModal() {
            const modal = new bootstrap.Modal(document.getElementById('changePasswordModal'));
            modal.show();
        }

        function checkPasswordStrength(val) {
            const bar = document.getElementById('passStrengthBar');
            let score = 0;
            if (val.length >= 6) score += 30;
            if (val.length >= 10) score += 30;
            if (/[A-Z]/.test(val)) score += 20;
            if (/[0-9]/.test(val)) score += 20;

            bar.style.width = score + '%';
            if (score <= 40) bar.className = 'progress-bar bg-danger';
            else if (score <= 70) bar.className = 'progress-bar bg-warning';
            else bar.className = 'progress-bar bg-success';
        }

        function savePasswordChanges(e) {
            e.preventDefault();
            const current = document.getElementById('currentPassInput').value;
            const newP = document.getElementById('newPassInput').value;
            const confP = document.getElementById('confirmPassInput').value;

            if (newP !== confP) {
                showToast('New passwords do not match!', 'warning');
                return;
            }

            bootstrap.Modal.getInstance(document.getElementById('changePasswordModal')).hide();
            document.getElementById('changePasswordForm').reset();
            showToast('Password changed successfully!', 'success');
        }

        // API Key Generator
        function openApiKeyModal() {
            const modal = new bootstrap.Modal(document.getElementById('apiKeyModal'));
            modal.show();
        }

        function generateNewApiKey(e) {
            e.preventDefault();
            const name = document.getElementById('keyNameInput').value;
            const scope = document.getElementById('keyScopeInput').value;

            const randomPart = Math.random().toString(36).substring(2, 10) + Math.random().toString(36).substring(2, 6);
            const fullKey = `ak_live_${randomPart}`;
            const maskedKey = `ak_live_${randomPart.substring(0, 5)}...${randomPart.substring(randomPart.length - 4)}`;

            const id = 'key-' + Date.now();
            const keyHtml = `
                <div class="api-key-item" id="${id}">
                    <div>
                        <div class="d-flex align-items-center gap-2 mb-1">
                            <strong class="fs-6">${name}</strong>
                            <span class="badge bg-light text-dark border">${scope}</span>
                        </div>
                        <div class="api-key-code">${maskedKey}</div>
                        <small class="text-muted d-block mt-1">Created: Just now | Active</small>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-sm btn-outline-secondary" onclick="copyApiKey('${fullKey}')">
                            <i class="fas fa-copy"></i>
                        </button>
                        <button class="btn btn-sm btn-outline-danger" onclick="revokeApiKey('${id}')">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            `;

            document.getElementById('apiKeyList').insertAdjacentHTML('afterbegin', keyHtml);
            bootstrap.Modal.getInstance(document.getElementById('apiKeyModal')).hide();
            document.getElementById('apiKeyForm').reset();
            showToast(`Generated API Key for ${name}`, 'success');
        }

        function copyApiKey(keyStr) {
            navigator.clipboard.writeText(keyStr);
            showToast('API Key copied to clipboard!', 'info');
        }

        function revokeApiKey(id) {
            if (confirm('Are you sure you want to revoke this API key? Systems relying on it will lose access immediately.')) {
                const el = document.getElementById(id);
                if (el) el.remove();
                showToast('API Key revoked', 'warning');
            }
        }

        // Sessions Management
        function revokeSession(id) {
            const el = document.getElementById(id);
            if (el) el.remove();
            showToast('Session logged out successfully', 'info');
        }

        function revokeAllOtherSessions() {
            if (confirm('Revoke all authenticated sessions on other devices?')) {
                document.querySelectorAll('#sessionList .session-item:not(:first-child)').forEach(item => item.remove());
                showToast('All other active sessions have been terminated', 'success');
            }
        }

        function toggle2FASetting(cb) {
            if (cb.checked) {
                showToast('Two-Factor Authentication remains active', 'info');
            } else {
                if (confirm('Disabling 2FA reduces account security. Are you sure?')) {
                    showToast('Two-Factor Authentication disabled', 'warning');
                } else {
                    cb.checked = true;
                }
            }
        }

        // Filter Audit Logs
        function filterAuditLogs() {
            const query = document.getElementById('logSearchInput').value.toLowerCase();
            const rows = document.querySelectorAll('#auditLogTable tbody tr');
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(query) ? '' : 'none';
            });
        }

        function exportAuditLogCSV() {
            showToast('Exporting Audit Logs as CSV...', 'info');
        }

        function exportSecurityReport() {
            showToast('Generating Security Audit Report PDF...', 'info');
        }

        function triggerAvatarUpload() {
            document.getElementById('avatarFileInput').click();
        }

        function handleAvatarFileSelect(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const avatarEl = document.getElementById('avatarDisplay');
                    avatarEl.style.backgroundImage = `url('${e.target.result}')`;
                    avatarEl.style.backgroundSize = 'cover';
                    avatarEl.style.backgroundPosition = 'center';
                    avatarEl.textContent = '';
                    showToast('Profile picture updated!', 'success');
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
      </script>
</asp:Content>
