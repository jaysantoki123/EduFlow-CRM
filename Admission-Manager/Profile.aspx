    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EduFlow.Admission_Manager.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    My Profile - Education CRM
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Profile Banner */
        .profile-banner {
            height: 220px;
            background: linear-gradient(135deg, #4f46e5 0%, #0051d5 50%, #006d62 100%);
            border-radius: var(--radius-xl) var(--radius-xl) 0 0;
            position: relative;
            overflow: hidden;
        }

        .profile-banner::before {
            content: '';
            position: absolute;
            inset: 0;
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100'%3E%3Ccircle cx='50' cy='50' r='30' fill='none' stroke='rgba(255,255,255,0.04)' stroke-width='2'/%3E%3C/svg%3E");
        }

        .banner-actions {
            position: absolute;
            top: var(--spacing-md);
            right: var(--spacing-md);
            display: flex;
            gap: var(--spacing-sm);
        }

        .banner-btn {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .banner-btn:hover { background: rgba(255, 255, 255, 0.3); }

        /* Profile Header Card */
        .profile-header-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            border: 1px solid var(--border-subtle);
            border-top: none;
            border-radius: 0 0 var(--radius-xl) var(--radius-xl);
            padding: 0 var(--spacing-xl) var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
        }

        .profile-top {
            display: flex;
            gap: var(--spacing-xl);
            align-items: flex-end;
            margin-top: -56px;
        }

        .profile-avatar-wrapper { flex-shrink: 0; position: relative; }

        .profile-avatar {
            width: 128px;
            height: 128px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border: 6px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 52px;
            font-weight: 700;
            color: white;
            box-shadow: var(--shadow-lg);
        }

        .avatar-edit-btn {
            position: absolute;
            bottom: 8px;
            right: 8px;
            width: 36px;
            height: 36px;
            background: var(--primary);
            color: white;
            border: 3px solid white;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .avatar-edit-btn:hover { background: var(--primary-dark); transform: scale(1.1); }

        .online-indicator {
            position: absolute;
            top: 8px;
            right: 12px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--success);
            border: 4px solid white;
        }

        .profile-info {
            flex: 1;
            padding-bottom: var(--spacing-md);
        }

        .profile-name {
            font-size: 32px;
            font-weight: 700;
            color: var(--on-surface);
            margin: 0 0 4px;
        }

        .profile-role-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 16px;
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
            border-radius: var(--radius-full);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: var(--spacing-sm);
        }

        .profile-meta {
            display: flex;
            gap: var(--spacing-lg);
            flex-wrap: wrap;
        }

        .profile-meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            color: var(--on-surface-variant);
        }

        .profile-meta-item i { color: var(--primary); width: 16px; }

        .profile-actions-row {
            display: flex;
            gap: var(--spacing-sm);
            flex-shrink: 0;
            padding-bottom: var(--spacing-md);
        }

        /* Quick Stats */
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-lg);
        }

        .quick-stat-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-lg);
            text-align: center;
            transition: all 0.3s;
        }

        .quick-stat-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-md); }

        .qs-icon {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin: 0 auto var(--spacing-sm);
        }

        .qs-value { font-size: 24px; font-weight: 700; margin: 0; }
        .qs-label { font-size: 12px; color: var(--on-surface-variant); text-transform: uppercase; letter-spacing: 0.05em; margin-top: 4px; }

        /* Tabs */
        .profile-tabs {
            display: flex;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: 8px;
            gap: 4px;
            margin-bottom: var(--spacing-lg);
            overflow-x: auto;
        }

        .profile-tab {
            padding: 10px 20px;
            border: none;
            background: transparent;
            border-radius: var(--radius-lg);
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface-variant);
            cursor: pointer;
            white-space: nowrap;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .profile-tab:hover { background: var(--surface-container); }
        .profile-tab.active { background: var(--primary); color: white; }

        /* Section */
        .detail-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle);
        }

        .section-title-icon { display: flex; align-items: center; gap: 12px; }

        .section-icon {
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

        .section-title h3 { font-size: 18px; font-weight: 600; margin: 0; }
        .section-title p { font-size: 12px; color: var(--on-surface-variant); margin: 0; }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--spacing-lg);
        }

        .info-item { display: flex; flex-direction: column; gap: 6px; }
        .info-label { font-size: 12px; font-weight: 600; color: var(--on-surface-variant); text-transform: uppercase; letter-spacing: 0.05em; }
        .info-value { font-size: 15px; font-weight: 500; color: var(--on-surface); }
        .info-value.highlighted { color: var(--primary); font-weight: 600; }

        /* Edit Form */
        .edit-form { display: none; }
        .edit-form.show { display: block; }
        .view-mode.hide { display: none; }

        .form-group { margin-bottom: var(--spacing-lg); }
        .form-label { font-size: 14px; font-weight: 600; color: var(--on-surface); margin-bottom: 8px; display: block; }
        .form-control, .form-select { height: 48px; border: 1px solid var(--border-subtle); border-radius: var(--radius-md); padding: 12px 16px; font-size: 14px; background: white; width: 100%; }
        .form-control:focus, .form-select:focus { outline: none; border-color: var(--primary); box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1); }
        textarea.form-control { height: 100px; resize: vertical; }

        .form-actions { display: flex; gap: var(--spacing-md); justify-content: flex-end; padding-top: var(--spacing-lg); border-top: 1px solid var(--border-subtle); }

        /* Activity Item */
        .activity-item { display: flex; gap: 12px; padding: 12px 0; border-bottom: 1px solid var(--border-subtle); }
        .activity-item:last-child { border-bottom: none; }
        .activity-icon { width: 36px; height: 36px; border-radius: var(--radius-full); display: flex; align-items: center; justify-content: center; font-size: 14px; flex-shrink: 0; }
        .activity-content { flex: 1; }
        .activity-title { font-size: 14px; font-weight: 500; margin: 0; }
        .activity-time { font-size: 12px; color: var(--on-surface-variant); }

        /* Session Item */
        .session-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--spacing-md);
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            margin-bottom: var(--spacing-sm);
        }

        .session-device { display: flex; align-items: center; gap: var(--spacing-sm); }
        .session-icon { width: 36px; height: 36px; border-radius: var(--radius-lg); background: rgba(79, 70, 229, 0.1); color: var(--primary); display: flex; align-items: center; justify-content: center; }
        .session-name { font-size: 14px; font-weight: 600; margin: 0; }
        .session-meta { font-size: 12px; color: var(--on-surface-variant); margin: 0; }
        .session-current { font-size: 11px; font-weight: 600; color: var(--success); background: rgba(34, 197, 94, 0.1); padding: 3px 10px; border-radius: var(--radius-full); }

        @media (max-width: 768px) {
            .profile-top { flex-direction: column; align-items: center; text-align: center; }
            .profile-info { text-align: center; }
            .profile-meta { justify-content: center; }
            .profile-actions-row { justify-content: center; }
            .profile-avatar { width: 100px; height: 100px; font-size: 40px; }
            .form-actions { flex-direction: column; }
            .form-actions button { width: 100%; }
        }


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
            <header class="topbar"><div class="topbar-left"><button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button></div><div class="topbar-right"><button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button><button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button></div></header>

            <div class="content-area">
                <!-- Banner -->
                <div class="profile-banner">
                    <div class="banner-actions">
                        <button class="banner-btn" id="editProfileBtn"><i class="fas fa-edit"></i> Edit Profile</button>
                        <a href="change-password.html" class="banner-btn"><i class="fas fa-lock"></i> Change Password</a>
                    </div>
                </div>

                <!-- Profile Header -->
                <div class="profile-header-card">
                    <div class="profile-top">
                        <div class="profile-avatar-wrapper">
                            <div class="profile-avatar">AK</div>
                            <button class="avatar-edit-btn" title="Change Photo"><i class="fas fa-camera"></i></button>
                            <div class="online-indicator"></div>
                        </div>
                        <div class="profile-info">
                            <h1 class="profile-name">Anil Kumar</h1>
                            <span class="profile-role-badge"><i class="fas fa-shield-alt"></i> System Administrator</span>
                            <div class="profile-meta">
                                <div class="profile-meta-item"><i class="fas fa-id-badge"></i> EMP-2020-001</div>
                                <div class="profile-meta-item"><i class="fas fa-envelope"></i> anil.kumar@institution.edu</div>
                                <div class="profile-meta-item"><i class="fas fa-phone"></i> +91 98765 00001</div>
                                <div class="profile-meta-item"><i class="fas fa-calendar"></i> Joined Jan 2020</div>
                            </div>
                        </div>
                        <div class="profile-actions-row">
                            <button class="btn btn-secondary"><i class="fas fa-download"></i> Export</button>
                        </div>
                    </div>
                </div>

                <!-- Quick Stats -->
                <div class="quick-stats">
                    <div class="quick-stat-card"><div class="qs-icon" style="background:rgba(79,70,229,.1);color:var(--primary)"><i class="fas fa-sign-in-alt"></i></div><p class="qs-value" style="color:var(--primary)">248</p><p class="qs-label">Total Logins</p></div>
                    <div class="quick-stat-card"><div class="qs-icon" style="background:rgba(34,197,94,.1);color:var(--success)"><i class="fas fa-clock"></i></div><p class="qs-value" style="color:var(--success)">1,842h</p><p class="qs-label">Active Hours</p></div>
                    <div class="quick-stat-card"><div class="qs-icon" style="background:rgba(0,81,213,.1);color:var(--info)"><i class="fas fa-tasks"></i></div><p class="qs-value" style="color:var(--info)">156</p><p class="qs-label">Tasks Done</p></div>
                    <div class="quick-stat-card"><div class="qs-icon" style="background:rgba(245,158,11,.1);color:var(--warning)"><i class="fas fa-star"></i></div><p class="qs-value" style="color:var(--warning)">4.9</p><p class="qs-label">Rating</p></div>
                </div>

                <!-- Tabs -->
                <div class="profile-tabs">
                    <button class="profile-tab active"><i class="fas fa-user"></i> Personal Info</button>
                    <button class="profile-tab"><i class="fas fa-shield-alt"></i> Security</button>
                    <button class="profile-tab"><i class="fas fa-history"></i> Activity</button>
                    <button class="profile-tab"><i class="fas fa-bell"></i> Preferences</button>
                </div>

                <div class="row g-3">
                    <div class="col-lg-8">
                        <!-- Personal Information (View Mode) -->
                        <div class="detail-section view-mode" id="viewMode">
                            <div class="section-header">
                                <div class="section-title-icon"><div class="section-icon"><i class="fas fa-user"></i></div><div class="section-title"><h3>Personal Information</h3><p>Your personal and contact details</p></div></div>
                                <button class="btn btn-sm btn-primary" onclick="toggleEdit()"><i class="fas fa-edit"></i> Edit</button>
                            </div>
                            <div class="info-grid">
                                <div class="info-item"><span class="info-label">Full Name</span><span class="info-value">Anil Kumar</span></div>
                                <div class="info-item"><span class="info-label">Email</span><span class="info-value highlighted">anil.kumar@institution.edu</span></div>
                                <div class="info-item"><span class="info-label">Phone</span><span class="info-value highlighted">+91 98765 00001</span></div>
                                <div class="info-item"><span class="info-label">Department</span><span class="info-value">Administration</span></div>
                                <div class="info-item"><span class="info-label">Designation</span><span class="info-value">System Administrator</span></div>
                                <div class="info-item"><span class="info-label">Employee ID</span><span class="info-value highlighted">EMP-2020-001</span></div>
                                <div class="info-item"><span class="info-label">Date of Birth</span><span class="info-value">March 15, 1985</span></div>
                                <div class="info-item"><span class="info-label">Gender</span><span class="info-value">Male</span></div>
                                <div class="info-item" style="grid-column:1/-1"><span class="info-label">Address</span><span class="info-value">42 Park Street, Andheri West, Mumbai, Maharashtra — 400058</span></div>
                                <div class="info-item" style="grid-column:1/-1"><span class="info-label">Bio</span><span class="info-value">Experienced system administrator with 10+ years in educational technology. Passionate about streamlining admission processes and improving institutional efficiency through CRM solutions.</span></div>
                            </div>
                        </div>

                        <!-- Personal Information (Edit Mode) -->
                        <div class="detail-section edit-form" id="editMode">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon"><i class="fas fa-edit"></i></div><div class="section-title"><h3>Edit Profile</h3><p>Update your personal details</p></div></div></div>
                            <div class="row">
                                <div class="col-md-6"><div class="form-group"><label class="form-label">First Name</label><input type="text" class="form-control" value="Anil"></div></div>
                                <div class="col-md-6"><div class="form-group"><label class="form-label">Last Name</label><input type="text" class="form-control" value="Kumar"></div></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6"><div class="form-group"><label class="form-label">Email</label><input type="email" class="form-control" value="anil.kumar@institution.edu"></div></div>
                                <div class="col-md-6"><div class="form-group"><label class="form-label">Phone</label><input type="tel" class="form-control" value="+91 98765 00001"></div></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6"><div class="form-group"><label class="form-label">Date of Birth</label><input type="date" class="form-control" value="1985-03-15"></div></div>
                                <div class="col-md-6"><div class="form-group"><label class="form-label">Gender</label><select class="form-select"><option selected>Male</option><option>Female</option><option>Other</option></select></div></div>
                            </div>
                            <div class="form-group"><label class="form-label">Address</label><textarea class="form-control" style="height:80px">42 Park Street, Andheri West, Mumbai, Maharashtra — 400058</textarea></div>
                            <div class="form-group"><label class="form-label">Bio</label><textarea class="form-control">Experienced system administrator with 10+ years in educational technology. Passionate about streamlining admission processes and improving institutional efficiency through CRM solutions.</textarea></div>
                            <div class="form-actions">
                                <button class="btn btn-secondary" onclick="toggleEdit()"><i class="fas fa-times"></i> Cancel</button>
                                <button class="btn btn-primary" onclick="saveProfile()"><i class="fas fa-save"></i> Save Changes</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Account Security -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon"><i class="fas fa-shield-alt"></i></div><div class="section-title"><h3>Security</h3></div></div></div>
                            <div class="d-flex flex-column gap-3">
                                <div class="info-item"><span class="info-label">Role</span><span class="info-value"><span class="profile-role-badge" style="font-size:12px"><i class="fas fa-shield-alt"></i> Super Admin</span></span></div>
                                <div class="info-item"><span class="info-label">Last Login</span><span class="info-value">Today, 9:15 AM</span></div>
                                <div class="info-item"><span class="info-label">Login IP</span><span class="info-value">192.168.1.45</span></div>
                                <div class="info-item"><span class="info-label">Password Changed</span><span class="info-value">Nov 28, 2024</span></div>
                                <div class="info-item"><span class="info-label">2FA Status</span><span class="info-value" style="color:var(--success)"><i class="fas fa-check-circle"></i> Enabled</span></div>
                            </div>
                            <a href="change-password.html" class="btn btn-secondary btn-sm w-100 mt-3"><i class="fas fa-lock"></i> Change Password</a>
                        </div>

                        <!-- Active Sessions -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon"><i class="fas fa-laptop"></i></div><div class="section-title"><h3>Active Sessions</h3></div></div></div>
                            <div class="session-item"><div class="session-device"><div class="session-icon"><i class="fas fa-desktop"></i></div><div><p class="session-name">Chrome — Windows</p><p class="session-meta">192.168.1.45 • Mumbai</p></div></div><span class="session-current">Current</span></div>
                            <div class="session-item"><div class="session-device"><div class="session-icon"><i class="fas fa-mobile-alt"></i></div><div><p class="session-name">Safari — iPhone</p><p class="session-meta">192.168.1.80 • Mumbai</p></div></div><button class="btn btn-sm btn-secondary" style="font-size:11px">Revoke</button></div>
                        </div>

                        <!-- Recent Activity -->
                        <div class="detail-section">
                            <div class="section-header"><div class="section-title-icon"><div class="section-icon"><i class="fas fa-history"></i></div><div class="section-title"><h3>Activity</h3></div></div></div>
                            <div class="activity-item"><div class="activity-icon" style="background:rgba(34,197,94,.1);color:var(--success)"><i class="fas fa-check"></i></div><div class="activity-content"><p class="activity-title">Approved application #APP-0090</p><p class="activity-time">Today, 11:30 AM</p></div></div>
                            <div class="activity-item"><div class="activity-icon" style="background:rgba(79,70,229,.1);color:var(--primary)"><i class="fas fa-user-plus"></i></div><div class="activity-content"><p class="activity-title">Created new user account</p><p class="activity-time">Today, 10:00 AM</p></div></div>
                            <div class="activity-item"><div class="activity-icon" style="background:rgba(0,81,213,.1);color:var(--info)"><i class="fas fa-sign-in-alt"></i></div><div class="activity-content"><p class="activity-title">Logged in</p><p class="activity-time">Today, 9:15 AM</p></div></div>
                            <div class="activity-item"><div class="activity-icon" style="background:rgba(245,158,11,.1);color:var(--warning)"><i class="fas fa-cog"></i></div><div class="activity-content"><p class="activity-title">Updated system settings</p><p class="activity-time">Yesterday, 4:30 PM</p></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
</asp:Content>
