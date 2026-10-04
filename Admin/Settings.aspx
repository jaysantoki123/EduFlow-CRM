<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="EduFlow.Admin.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .settings-layout {
            display: grid;
            grid-template-columns: 260px 1fr;
            gap: var(--spacing-lg)
        }

        /* Settings Nav */
        .settings-nav {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-md);
            position: sticky;
            top: 96px;
            max-height: calc(100vh - 120px);
            overflow-y: auto
        }

        .settings-nav-title {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: .05em;
            padding: var(--spacing-sm) var(--spacing-md);
            margin-bottom: var(--spacing-sm)
        }

        .settings-nav-item {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
            padding: 10px var(--spacing-md);
            border-radius: var(--radius-lg);
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface-variant);
            cursor: pointer;
            transition: all .2s;
            border: none;
            background: none;
            width: 100%;
            text-align: left
        }

            .settings-nav-item:hover {
                background: var(--surface-container-low);
                color: var(--on-surface)
            }

            .settings-nav-item.active {
                background: rgba(79,70,229,.1);
                color: var(--primary);
                font-weight: 600
            }

            .settings-nav-item i {
                width: 20px;
                text-align: center;
                font-size: 16px
            }

        .nav-divider {
            height: 1px;
            background: var(--border-subtle);
            margin: var(--spacing-sm) var(--spacing-md)
        }

        /* Settings Content */
        .settings-section {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg)
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle)
        }

        .section-title-icon {
            display: flex;
            align-items: center;
            gap: 12px
        }

        .section-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg,rgba(79,70,229,.1),rgba(0,81,213,.1));
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px
        }

        .section-title h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0
        }

        .section-title p {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0
        }

        .form-group {
            margin-bottom: var(--spacing-lg)
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: 8px;
            display: block
        }

            .form-label.required::after {
                content: '*';
                color: var(--danger);
                margin-left: 4px
            }

        .form-hint {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin-top: 4px
        }

        .form-control, .form-select {
            height: 48px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            font-size: 14px;
            background: white;
            width: 100%;
            transition: all .2s
        }

            .form-control:focus, .form-select:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79,70,229,.1)
            }

        textarea.form-control {
            height: 100px;
            resize: vertical
        }

        /* Toggle */
        .setting-toggle {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--spacing-md);
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle);
            margin-bottom: var(--spacing-md)
        }

            .setting-toggle:last-child {
                margin-bottom: 0
            }

        .toggle-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-md)
        }

        .toggle-icon {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0
        }

        .toggle-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0
        }

        .toggle-desc {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0
        }

        .toggle-switch {
            position: relative;
            width: 48px;
            height: 26px;
            flex-shrink: 0
        }

            .toggle-switch input {
                opacity: 0;
                width: 0;
                height: 0
            }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            inset: 0;
            background: var(--border-subtle);
            border-radius: 13px;
            transition: .3s
        }

            .toggle-slider::before {
                content: '';
                position: absolute;
                height: 20px;
                width: 20px;
                left: 3px;
                bottom: 3px;
                background: white;
                border-radius: 50%;
                transition: .3s;
                box-shadow: 0 1px 3px rgba(0,0,0,.1)
            }

        .toggle-switch input:checked + .toggle-slider {
            background: var(--primary)
        }

            .toggle-switch input:checked + .toggle-slider::before {
                transform: translateX(22px)
            }

        /* Theme Options */
        .theme-options {
            display: flex;
            gap: var(--spacing-md)
        }

        .theme-option {
            flex: 1;
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-xl);
            padding: var(--spacing-md);
            text-align: center;
            cursor: pointer;
            transition: all .3s
        }

            .theme-option:hover {
                border-color: var(--primary)
            }

            .theme-option.selected {
                border-color: var(--primary);
                background: rgba(79,70,229,.05)
            }

        .theme-preview {
            height: 60px;
            border-radius: var(--radius-lg);
            margin-bottom: var(--spacing-sm);
            overflow: hidden;
            display: flex
        }

        .theme-preview-sidebar {
            width: 30%;
            background: #0F172A
        }

        .theme-preview-content {
            flex: 1;
            background: #F8FAFC;
            padding: 8px
        }

            .theme-preview-content.dark {
                background: #1a1a2e
            }

        .theme-preview-sidebar.light {
            background: #ffffff;
            border-right: 1px solid #e2e8f0
        }

        .theme-option-label {
            font-size: 13px;
            font-weight: 600;
            margin: 0
        }

        /* Color Swatches */
        .color-swatches {
            display: flex;
            gap: var(--spacing-sm)
        }

        .color-swatch {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-full);
            cursor: pointer;
            border: 3px solid transparent;
            transition: all .2s
        }

            .color-swatch:hover {
                transform: scale(1.1)
            }

            .color-swatch.selected {
                border-color: var(--on-surface);
                box-shadow: 0 0 0 2px white,0 0 0 4px var(--on-surface)
            }

        /* Language Selector */
        .language-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill,minmax(160px,1fr));
            gap: var(--spacing-sm)
        }

        .language-option {
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            text-align: center;
            cursor: pointer;
            transition: all .2s
        }

            .language-option:hover {
                border-color: var(--primary)
            }

            .language-option.selected {
                border-color: var(--primary);
                background: rgba(79,70,229,.05)
            }

        .language-flag {
            font-size: 24px;
            margin-bottom: 4px
        }

        .language-name {
            font-size: 13px;
            font-weight: 600;
            margin: 0
        }

        /* Backup Card */
        .backup-card {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-sm)
        }

        .backup-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm)
        }

        .backup-icon {
            width: 40px;
            height: 40px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0
        }

        .backup-name {
            font-size: 14px;
            font-weight: 600;
            margin: 0
        }

        .backup-meta {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0
        }

        .save-bar {
            position: sticky;
            bottom: 0;
            background: rgba(255,255,255,.95);
            backdrop-filter: blur(12px);
            border-top: 1px solid var(--border-subtle);
            padding: var(--spacing-md) var(--spacing-lg);
            display: flex;
            justify-content: flex-end;
            gap: var(--spacing-md);
            border-radius: 0 0 var(--radius-xl) var(--radius-xl);
            margin-top: calc(var(--spacing-lg) * -1)
        }

        @media(max-width:1024px) {
            .settings-layout {
                grid-template-columns: 1fr
            }

            .settings-nav {
                position: static;
                max-height: none
            }
        }

        @media(max-width:768px) {
            .theme-options {
                flex-direction: column
            }
        }

        @media (max-width: 768px) {
            .calendar-layout {
                grid-template-columns: 1fr !important;
            }

            .search-box {
                width: 100% !important;
            }

            .filter-group {
                min-width: auto !important;
                width: 100% !important;
            }

            .table-container, .user-table-card, .inquiry-table-card, .counseling-table-card,
            .followup-table-card, .student-table-card, .application-table-card {
                overflow-x: auto !important;
                -webkit-overflow-scrolling: touch;
            }

            .table, .user-table, .matrix-table {
                min-width: 550px !important;
            }

            .matrix-table {
                min-width: 800px !important;
            }

            .card-header {
                flex-wrap: wrap !important;
                gap: 8px !important;
            }

            .table-header {
                flex-direction: column !important;
                align-items: flex-start !important;
            }

            .table-actions {
                width: 100% !important;
                flex-wrap: wrap !important;
            }

            .table-footer {
                flex-direction: column !important;
                gap: 12px !important;
                align-items: flex-start !important;
            }

            .permissions-detail-layout {
                grid-template-columns: 1fr !important;
            }

            .role-cards-grid {
                grid-template-columns: 1fr 1fr !important;
            }
        }

        @media (max-width: 576px) {
            .filter-row {
                grid-template-columns: 1fr !important;
            }

            .role-cards-grid {
                grid-template-columns: 1fr !important;
            }

            .quick-action-grid {
                grid-template-columns: repeat(2, 1fr) !important;
            }

            .users-grid {
                grid-template-columns: 1fr !important;
            }

            .form-actions {
                flex-direction: column !important;
            }

                .form-actions .btn {
                    width: 100% !important;
                    justify-content: center !important;
                }

            .stats-grid-4 {
                grid-template-columns: 1fr 1fr !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <main class="main-content" id="mainContent">
        <header class="topbar">
            <div class="topbar-left">
                <button class="sidebar-toggle" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            </div>
            <div class="topbar-right">
                <button class="topbar-icon-btn"><i class="fas fa-bell"></i><span class="badge"></span></button>
                <button class="topbar-icon-btn"><i class="fas fa-user-circle"></i></button>
            </div>
        </header>

        <div class="content-area">
            <div class="mb-4">
                <h1 class="headline-lg mb-1">System Settings</h1>
                <p class="text-muted">Configure system preferences, appearance and security</p>
            </div>

            <div class="settings-layout">
                <!-- Settings Nav -->
                <div class="settings-nav">
                    <p class="settings-nav-title">Settings</p>
                    <button class="settings-nav-item active" onclick="scrollToSection('general')"><i class="fas fa-sliders-h"></i>General</button>
                    <button class="settings-nav-item" onclick="scrollToSection('appearance')"><i class="fas fa-palette"></i>Appearance</button>
                    <button class="settings-nav-item" onclick="scrollToSection('notifications')"><i class="fas fa-bell"></i>Notifications</button>
                    <button class="settings-nav-item" onclick="scrollToSection('security')"><i class="fas fa-lock"></i>Security</button>
                    <button class="settings-nav-item" onclick="scrollToSection('localization')"><i class="fas fa-globe"></i>Localization</button>
                    <div class="nav-divider"></div>
                    <button class="settings-nav-item" onclick="scrollToSection('backup')"><i class="fas fa-database"></i>Backup & Data</button>
                    <button class="settings-nav-item" onclick="scrollToSection('integrations')"><i class="fas fa-plug"></i>Integrations</button>
                    <div class="nav-divider"></div>
                    <a href="college-info.html" class="settings-nav-item"><i class="fas fa-university"></i>College Info</a>
                    <a href="email-config.html" class="settings-nav-item"><i class="fas fa-envelope"></i>Email Config</a>
                </div>

                <!-- Settings Content -->
                <div>
                    <!-- General -->
                    <div class="settings-section" id="general">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-sliders-h"></i></div>
                                <div class="section-title">
                                    <h3>General Settings</h3>
                                    <p>Basic system configuration</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Application Name</label><input type="text" class="form-control" value="Education CRM"><p class="form-hint">Displayed in browser tab and login screen</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Tagline</label><input type="text" class="form-control" value="Smart Admissions Management"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Academic Year</label><select class="form-select"><option selected>2024-2025</option>
                                        <option>2025-2026</option>
                                    </select></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Default Timezone</label><select class="form-select"><option selected>Asia/Kolkata (IST)</option>
                                        <option>Asia/Dubai (GST)</option>
                                        <option>America/New_York (EST)</option>
                                    </select></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Date Format</label><select class="form-select"><option selected>DD/MM/YYYY</option>
                                        <option>MM/DD/YYYY</option>
                                        <option>YYYY-MM-DD</option>
                                    </select></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Time Format</label><select class="form-select"><option selected>12 Hour (AM/PM)</option>
                                        <option>24 Hour</option>
                                    </select></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Currency</label><select class="form-select" style="max-width: 300px"><option selected>₹ Indian Rupee (INR)</option>
                                <option>$ US Dollar (USD)</option>
                                <option>€ Euro (EUR)</option>
                                <option>£ British Pound (GBP)</option>
                            </select></div>
                    </div>

                    <!-- Appearance -->
                    <div class="settings-section" id="appearance">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-palette"></i></div>
                                <div class="section-title">
                                    <h3>Appearance</h3>
                                    <p>Customize the look and feel</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Theme</label>
                            <div class="theme-options">
                                <div class="theme-option selected" onclick="selectTheme(this)">
                                    <div class="theme-preview">
                                        <div class="theme-preview-sidebar"></div>
                                        <div class="theme-preview-content"></div>
                                    </div>
                                    <p class="theme-option-label">Light (Default)</p>
                                </div>
                                <div class="theme-option" onclick="selectTheme(this)">
                                    <div class="theme-preview">
                                        <div class="theme-preview-sidebar"></div>
                                        <div class="theme-preview-content dark"></div>
                                    </div>
                                    <p class="theme-option-label">Dark</p>
                                </div>
                                <div class="theme-option" onclick="selectTheme(this)">
                                    <div class="theme-preview">
                                        <div class="theme-preview-sidebar light"></div>
                                        <div class="theme-preview-content"></div>
                                    </div>
                                    <p class="theme-option-label">Light Sidebar</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Accent Color</label>
                            <div class="color-swatches">
                                <div class="color-swatch selected" style="background: #4f46e5" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #0051d5" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #006d62" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #22C55E" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #F59E0B" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #EF4444" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #8b5cf6" onclick="selectColor(this)"></div>
                                <div class="color-swatch" style="background: #ec4899" onclick="selectColor(this)"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Sidebar Style</label>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <select class="form-select">
                                        <option selected>Expanded</option>
                                        <option>Collapsed</option>
                                        <option>Auto-hide</option>
                                    </select></div>
                            </div>
                        </div>

                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(79,70,229,.1); color: var(--primary)"><i class="fas fa-expand-arrows-alt"></i></div>
                                <div>
                                    <p class="toggle-label">Compact Mode</p>
                                    <p class="toggle-desc">Reduce spacing for more content visibility</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox"><span class="toggle-slider"></span></label>
                        </div>
                    </div>

                    <!-- Notifications -->
                    <div class="settings-section" id="notifications">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-bell"></i></div>
                                <div class="section-title">
                                    <h3>Notification Preferences</h3>
                                    <p>Control how you receive notifications</p>
                                </div>
                            </div>
                        </div>

                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(79,70,229,.1); color: var(--primary)"><i class="fas fa-desktop"></i></div>
                                <div>
                                    <p class="toggle-label">In-App Notifications</p>
                                    <p class="toggle-desc">Show notifications inside the CRM</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(0,81,213,.1); color: var(--info)"><i class="fas fa-envelope"></i></div>
                                <div>
                                    <p class="toggle-label">Email Notifications</p>
                                    <p class="toggle-desc">Send important alerts via email</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fab fa-whatsapp"></i></div>
                                <div>
                                    <p class="toggle-label">WhatsApp Notifications</p>
                                    <p class="toggle-desc">Send alerts via WhatsApp</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(245,158,11,.1); color: var(--warning)"><i class="fas fa-sms"></i></div>
                                <div>
                                    <p class="toggle-label">SMS Notifications</p>
                                    <p class="toggle-desc">Send SMS for critical updates</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox"><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(239,68,68,.1); color: var(--danger)"><i class="fas fa-volume-up"></i></div>
                                <div>
                                    <p class="toggle-label">Sound Alerts</p>
                                    <p class="toggle-desc">Play sound for new notifications</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                    </div>

                    <!-- Security -->
                    <div class="settings-section" id="security">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-lock"></i></div>
                                <div class="section-title">
                                    <h3>Security Settings</h3>
                                    <p>Manage authentication and access policies</p>
                                </div>
                            </div>
                        </div>

                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fas fa-shield-alt"></i></div>
                                <div>
                                    <p class="toggle-label">Two-Factor Authentication (2FA)</p>
                                    <p class="toggle-desc">Require 2FA for all users on login</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(79,70,229,.1); color: var(--primary)"><i class="fas fa-key"></i></div>
                                <div>
                                    <p class="toggle-label">Force Password Change</p>
                                    <p class="toggle-desc">Require password change every 90 days</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(245,158,11,.1); color: var(--warning)"><i class="fas fa-user-lock"></i></div>
                                <div>
                                    <p class="toggle-label">Account Lockout</p>
                                    <p class="toggle-desc">Lock account after 5 failed login attempts</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Session Timeout</label><select class="form-select"><option>15 minutes</option>
                                        <option selected>30 minutes</option>
                                        <option>1 hour</option>
                                        <option>2 hours</option>
                                    </select></div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Minimum Password Length</label><select class="form-select"><option>6 characters</option>
                                        <option selected>8 characters</option>
                                        <option>10 characters</option>
                                        <option>12 characters</option>
                                    </select></div>
                            </div>
                        </div>
                    </div>

                    <!-- Localization -->
                    <div class="settings-section" id="localization">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-globe"></i></div>
                                <div class="section-title">
                                    <h3>Localization</h3>
                                    <p>Language and regional settings</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Language</label>
                            <div class="language-grid">
                                <div class="language-option selected" onclick="selectLanguage(this)">
                                    <div class="language-flag">🇬🇧</div>
                                    <p class="language-name">English</p>
                                </div>
                                <div class="language-option" onclick="selectLanguage(this)">
                                    <div class="language-flag">🇮🇳</div>
                                    <p class="language-name">Hindi</p>
                                </div>
                                <div class="language-option" onclick="selectLanguage(this)">
                                    <div class="language-flag">🇫🇷</div>
                                    <p class="language-name">French</p>
                                </div>
                                <div class="language-option" onclick="selectLanguage(this)">
                                    <div class="language-flag">🇪🇸</div>
                                    <p class="language-name">Spanish</p>
                                </div>
                                <div class="language-option" onclick="selectLanguage(this)">
                                    <div class="language-flag">🇸🇦</div>
                                    <p class="language-name">Arabic</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Backup -->
                    <div class="settings-section" id="backup">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-database"></i></div>
                                <div class="section-title">
                                    <h3>Backup & Data</h3>
                                    <p>Manage database backups</p>
                                </div>
                            </div>
                            <button class="btn btn-primary"><i class="fas fa-download"></i>Create Backup</button></div>

                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fas fa-sync-alt"></i></div>
                                <div>
                                    <p class="toggle-label">Auto Backup</p>
                                    <p class="toggle-desc">Daily automatic database backup at 2:00 AM</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>

                        <h4 style="font-size: 16px; font-weight: 600; margin: var(--spacing-lg) 0 var(--spacing-md)">Recent Backups</h4>
                        <div class="backup-card">
                            <div class="backup-info">
                                <div class="backup-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fas fa-check-circle"></i></div>
                                <div>
                                    <p class="backup-name">backup_2024-12-16_02-00.sql</p>
                                    <p class="backup-meta">245 MB • Dec 16, 2024 at 2:00 AM</p>
                                </div>
                            </div>
                            <button class="btn btn-sm btn-secondary"><i class="fas fa-download"></i>Download</button></div>
                        <div class="backup-card">
                            <div class="backup-info">
                                <div class="backup-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fas fa-check-circle"></i></div>
                                <div>
                                    <p class="backup-name">backup_2024-12-15_02-00.sql</p>
                                    <p class="backup-meta">243 MB • Dec 15, 2024 at 2:00 AM</p>
                                </div>
                            </div>
                            <button class="btn btn-sm btn-secondary"><i class="fas fa-download"></i>Download</button></div>
                        <div class="backup-card">
                            <div class="backup-info">
                                <div class="backup-icon" style="background: rgba(34,197,94,.1); color: var(--success)"><i class="fas fa-check-circle"></i></div>
                                <div>
                                    <p class="backup-name">backup_2024-12-14_02-00.sql</p>
                                    <p class="backup-meta">240 MB • Dec 14, 2024 at 2:00 AM</p>
                                </div>
                            </div>
                            <button class="btn btn-sm btn-secondary"><i class="fas fa-download"></i>Download</button></div>
                    </div>

                    <!-- Integrations -->
                    <div class="settings-section" id="integrations">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon"><i class="fas fa-plug"></i></div>
                                <div class="section-title">
                                    <h3>Integrations</h3>
                                    <p>Third-party service connections</p>
                                </div>
                            </div>
                        </div>

                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(66,133,244,.1); color: #4285f4"><i class="fab fa-google"></i></div>
                                <div>
                                    <p class="toggle-label">Google Workspace</p>
                                    <p class="toggle-desc">Calendar sync, Meet integration</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(37,211,102,.1); color: #25d366"><i class="fab fa-whatsapp"></i></div>
                                <div>
                                    <p class="toggle-label">WhatsApp Business API</p>
                                    <p class="toggle-desc">Automated messaging and follow-ups</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(0,119,181,.1); color: #0077b5"><i class="fas fa-sms"></i></div>
                                <div>
                                    <p class="toggle-label">SMS Gateway</p>
                                    <p class="toggle-desc">Twilio / MSG91 for SMS alerts</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox"><span class="toggle-slider"></span></label></div>
                        <div class="setting-toggle">
                            <div class="toggle-info">
                                <div class="toggle-icon" style="background: rgba(99,102,241,.1); color: #6366f1"><i class="fas fa-credit-card"></i></div>
                                <div>
                                    <p class="toggle-label">Payment Gateway</p>
                                    <p class="toggle-desc">Razorpay for online fee collection</p>
                                </div>
                            </div>
                            <label class="toggle-switch">
                                <input type="checkbox" checked><span class="toggle-slider"></span></label></div>
                    </div>

                    <!-- Save Bar -->
                    <div class="save-bar">
                        <button class="btn btn-secondary"><i class="fas fa-undo"></i>Reset to Default</button>
                        <button class="btn btn-primary" onclick="alert('Settings saved!')"><i class="fas fa-save"></i>Save Changes</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        document.getElementById('sidebarToggle').addEventListener('click', function () { document.getElementById('sidebar').classList.toggle('collapsed'); document.getElementById('mainContent').classList.toggle('sidebar-collapsed') });

        function scrollToSection(id) { document.getElementById(id).scrollIntoView({ behavior: 'smooth', block: 'start' }); document.querySelectorAll('.settings-nav-item').forEach(i => i.classList.remove('active')); event.currentTarget.classList.add('active') }
        function selectTheme(el) { document.querySelectorAll('.theme-option').forEach(o => o.classList.remove('selected')); el.classList.add('selected') }
        function selectColor(el) { document.querySelectorAll('.color-swatch').forEach(o => o.classList.remove('selected')); el.classList.add('selected') }
        function selectLanguage(el) { document.querySelectorAll('.language-option').forEach(o => o.classList.remove('selected')); el.classList.add('selected') }
    </script>
</asp:Content>
