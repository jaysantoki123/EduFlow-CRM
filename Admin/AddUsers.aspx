<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AddUsers.aspx.cs" Inherits="EduFlow.Admin.AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .form-layout {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: var(--spacing-lg)
        }

        .form-card {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg)
        }

        .form-section {
            margin-bottom: var(--spacing-xl);
            padding-bottom: var(--spacing-xl);
            border-bottom: 1px solid var(--border-subtle)
        }

            .form-section:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0
            }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: 12px
        }

        .section-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg,rgba(79,70,229,.1),rgba(0,81,213,.1));
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary)
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

        .form-control, .form-select {
            height: 48px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            font-size: 14px;
            background: white;
            width: 100%
        }

            .form-control:focus, .form-select:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79,70,229,.1)
            }

            .form-control.is-invalid {
                border-color: var(--error)
            }

        textarea.form-control {
            height: 100px;
            resize: vertical
        }

        .invalid-feedback {
            font-size: 12px;
            color: var(--error);
            margin-top: 4px;
            display: none
        }

        .form-control.is-invalid ~ .invalid-feedback {
            display: block
        }

        /* Role Selection */
        .role-select-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill,minmax(140px,1fr));
            gap: var(--spacing-sm)
        }

        .role-option {
            border: 2px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            text-align: center;
            cursor: pointer;
            transition: all .3s
        }

            .role-option:hover {
                border-color: var(--primary)
            }

            .role-option.selected {
                border-color: var(--primary);
                background: rgba(79,70,229,.05)
            }

        .role-option-icon {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin: 0 auto var(--spacing-sm);
            transition: all .3s
        }

        .role-option.selected .role-option-icon {
            color: white
        }

        .role-option[data-role="admin"] .role-option-icon {
            background: rgba(79,70,229,.1);
            color: var(--primary)
        }

        .role-option[data-role="admin"].selected .role-option-icon {
            background: var(--primary)
        }

        .role-option[data-role="manager"] .role-option-icon {
            background: rgba(0,81,213,.1);
            color: var(--info)
        }

        .role-option[data-role="manager"].selected .role-option-icon {
            background: var(--info)
        }

        .role-option[data-role="counselor"] .role-option-icon {
            background: rgba(34,197,94,.1);
            color: var(--success)
        }

        .role-option[data-role="counselor"].selected .role-option-icon {
            background: var(--success)
        }

        .role-option[data-role="staff"] .role-option-icon {
            background: rgba(245,158,11,.1);
            color: var(--warning)
        }

        .role-option[data-role="staff"].selected .role-option-icon {
            background: var(--warning)
        }

        .role-option-label {
            font-size: 13px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0
        }

        /* Permissions Grid */
        .permissions-grid {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-sm)
        }

        .permission-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: var(--spacing-md);
            background: var(--surface-container-low);
            border-radius: var(--radius-lg);
            border: 1px solid var(--border-subtle)
        }

        .permission-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm)
        }

        .permission-icon {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-md);
            background: rgba(79,70,229,.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px
        }

        .permission-name {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0
        }

        .permission-desc {
            font-size: 11px;
            color: var(--on-surface-variant);
            margin: 0
        }

        .toggle-switch {
            position: relative;
            width: 44px;
            height: 24px;
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
            border-radius: 12px;
            transition: .3s
        }

            .toggle-slider::before {
                content: '';
                position: absolute;
                height: 18px;
                width: 18px;
                left: 3px;
                bottom: 3px;
                background: white;
                border-radius: 50%;
                transition: .3s
            }

        .toggle-switch input:checked + .toggle-slider {
            background: var(--primary)
        }

            .toggle-switch input:checked + .toggle-slider::before {
                transform: translateX(20px)
            }

        /* Preview */
        .preview-card {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            position: sticky;
            top: 96px
        }

        .preview-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: 8px
        }

        .preview-avatar {
            width: 80px;
            height: 80px;
            border-radius: var(--radius-full);
            background: linear-gradient(135deg,var(--primary),var(--secondary));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 700;
            margin: 0 auto var(--spacing-md)
        }

        .preview-item {
            display: flex;
            align-items: flex-start;
            gap: var(--spacing-sm);
            padding: var(--spacing-sm) 0;
            border-bottom: 1px solid var(--border-subtle)
        }

            .preview-item:last-child {
                border-bottom: none
            }

        .preview-icon {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-md);
            background: var(--surface-container);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            flex-shrink: 0;
            margin-top: 2px
        }

        .preview-label {
            font-size: 11px;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: .05em
        }

        .preview-value {
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface)
        }

        .form-actions {
            display: flex;
            gap: var(--spacing-md);
            justify-content: flex-end;
            padding-top: var(--spacing-lg);
            border-top: 1px solid var(--border-subtle);
            margin-top: var(--spacing-xl)
        }

        @media(max-width:1024px) {
            .form-layout {
                grid-template-columns: 1fr
            }

            .preview-card {
                position: static
            }
        }

        @media(max-width:768px) {
            .form-card {
                padding: var(--spacing-lg)
            }

            .role-select-grid {
                grid-template-columns: repeat(2,1fr)
            }

            .form-actions {
                flex-direction: column
            }

            .form-actions button, .form-actions a {
                width: 100%
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="headline-lg mb-1" id="pageTitle">Add New User</h1>
                    <p class="text-muted">Create a new team member account</p>
                </div>
                <a href="manage-users.html" class="btn btn-secondary"><i class="fas fa-arrow-left"></i>Back</a>
            </div>

            <form id="userForm" novalidate>
                <div class="form-layout">
                    <div>
                        <div class="form-card">
                            <!-- Personal Info -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-user"></i></div>
                                    <span>Personal Information</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">First Name</label><input type="text" class="form-control" id="firstName" required><div class="invalid-feedback">Required</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">Last Name</label><input type="text" class="form-control" id="lastName" required><div class="invalid-feedback">Required</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">Email Address</label><input type="email" class="form-control" id="email" required><div class="invalid-feedback">Valid email required</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">Phone Number</label><input type="tel" class="form-control" id="phone" required><div class="invalid-feedback">Required</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Department</label><select class="form-select" id="department"><option>Admissions</option>
                                                <option>Counseling</option>
                                                <option>Academics</option>
                                                <option>Administration</option>
                                                <option>Finance</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Designation</label><input type="text" class="form-control" id="designation" placeholder="e.g., Senior Counselor">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Role -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-shield-alt"></i></div>
                                    <span>Role Assignment</span>
                                </div>
                                <div class="form-group">
                                    <label class="form-label required">Select Role</label>
                                    <div class="role-select-grid" id="roleGrid">
                                        <div class="role-option" data-role="admin">
                                            <div class="role-option-icon"><i class="fas fa-shield-alt"></i></div>
                                            <p class="role-option-label">Admin</p>
                                        </div>
                                        <div class="role-option" data-role="manager">
                                            <div class="role-option-icon"><i class="fas fa-user-tie"></i></div>
                                            <p class="role-option-label">Manager</p>
                                        </div>
                                        <div class="role-option selected" data-role="counselor">
                                            <div class="role-option-icon"><i class="fas fa-headset"></i></div>
                                            <p class="role-option-label">Counselor</p>
                                        </div>
                                        <div class="role-option" data-role="staff">
                                            <div class="role-option-icon"><i class="fas fa-user"></i></div>
                                            <p class="role-option-label">Staff</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Account Settings -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-lock"></i></div>
                                    <span>Account Settings</span>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">Password</label><input type="password" class="form-control" id="password" placeholder="Min 8 characters" required><div class="invalid-feedback">Min 8 characters</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label required">Confirm Password</label><input type="password" class="form-control" id="confirmPassword" required><div class="invalid-feedback">Passwords don't match</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Account Status</label>
                                    <select class="form-select" id="status">
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="d-flex align-items-center gap-2">
                                        <input type="checkbox" id="sendCredentials" checked style="accent-color: var(--primary); width: 18px; height: 18px"><label for="sendCredentials" style="font-size: 14px; cursor: pointer">Send login credentials via email</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="d-flex align-items-center gap-2">
                                        <input type="checkbox" id="forceReset" checked style="accent-color: var(--primary); width: 18px; height: 18px"><label for="forceReset" style="font-size: 14px; cursor: pointer">Force password change on first login</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Permissions -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-key"></i></div>
                                    <span>Permissions</span>
                                </div>
                                <div class="permissions-grid">
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-clipboard-list"></i></div>
                                            <div>
                                                <p class="permission-name">Inquiries</p>
                                                <p class="permission-desc">View, add, edit inquiries</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox" checked><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-user-tie"></i></div>
                                            <div>
                                                <p class="permission-name">Counseling</p>
                                                <p class="permission-desc">Manage counseling sessions</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox" checked><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-phone-alt"></i></div>
                                            <div>
                                                <p class="permission-name">Follow-ups</p>
                                                <p class="permission-desc">Create and manage follow-ups</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox" checked><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-file-alt"></i></div>
                                            <div>
                                                <p class="permission-name">Applications</p>
                                                <p class="permission-desc">Review and approve applications</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox"><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-user-graduate"></i></div>
                                            <div>
                                                <p class="permission-name">Students</p>
                                                <p class="permission-desc">View student records</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox" checked><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-chart-bar"></i></div>
                                            <div>
                                                <p class="permission-name">Reports</p>
                                                <p class="permission-desc">Access analytics and reports</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox"><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-users-cog"></i></div>
                                            <div>
                                                <p class="permission-name">User Management</p>
                                                <p class="permission-desc">Add, edit, delete users</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox"><span class="toggle-slider"></span></label>
                                    </div>
                                    <div class="permission-item">
                                        <div class="permission-info">
                                            <div class="permission-icon"><i class="fas fa-cog"></i></div>
                                            <div>
                                                <p class="permission-name">Settings</p>
                                                <p class="permission-desc">System configuration</p>
                                            </div>
                                        </div>
                                        <label class="toggle-switch">
                                            <input type="checkbox"><span class="toggle-slider"></span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions">
                                <a href="manage-users.html" class="btn btn-secondary"><i class="fas fa-times"></i>Cancel</a>
                                <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus"></i>Create User</button>
                            </div>
                        </div>
                    </div>

                    <!-- Preview -->
                    <div>
                        <div class="preview-card">
                            <h3 class="preview-title"><i class="fas fa-eye" style="color: var(--primary)"></i>User Preview</h3>
                            <div class="preview-avatar" id="prevAvatar">?</div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-user"></i></div>
                                <div>
                                    <p class="preview-label">Name</p>
                                    <p class="preview-value" id="prevName">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-envelope"></i></div>
                                <div>
                                    <p class="preview-label">Email</p>
                                    <p class="preview-value" id="prevEmail">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-phone"></i></div>
                                <div>
                                    <p class="preview-label">Phone</p>
                                    <p class="preview-value" id="prevPhone">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-shield-alt"></i></div>
                                <div>
                                    <p class="preview-label">Role</p>
                                    <p class="preview-value" id="prevRole">Counselor</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-building"></i></div>
                                <div>
                                    <p class="preview-label">Department</p>
                                    <p class="preview-value" id="prevDept">Admissions</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-toggle-on"></i></div>
                                <div>
                                    <p class="preview-label">Status</p>
                                    <p class="preview-value" id="prevStatus">Active</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>


    <script>
        document.getElementById('sidebarToggle').addEventListener('click', function () { document.getElementById('sidebar').classList.toggle('collapsed'); document.getElementById('mainContent').classList.toggle('sidebar-collapsed') });

        if (window.location.search.includes('edit=1')) { document.getElementById('pageTitle').textContent = 'Edit User'; document.getElementById('firstName').value = 'Sarah'; document.getElementById('lastName').value = 'Patel'; document.getElementById('email').value = 'sarah.patel@institution.edu'; document.getElementById('phone').value = '+91 98765 00003' }

        // Role Selection
        document.querySelectorAll('.role-option').forEach(opt => { opt.addEventListener('click', function () { document.querySelectorAll('.role-option').forEach(o => o.classList.remove('selected')); this.classList.add('selected'); document.getElementById('prevRole').textContent = this.querySelector('.role-option-label').textContent }) });

        // Live Preview
        function updatePreview() { const f = document.getElementById('firstName').value, l = document.getElementById('lastName').value; document.getElementById('prevName').textContent = (f || l) ? `${f} ${l}`.trim() : '—'; document.getElementById('prevAvatar').textContent = (f && l) ? f[0] + l[0] : '?' }
        document.getElementById('firstName').addEventListener('input', updatePreview);
        document.getElementById('lastName').addEventListener('input', updatePreview);
        document.getElementById('email').addEventListener('input', function () { document.getElementById('prevEmail').textContent = this.value || '—' });
        document.getElementById('phone').addEventListener('input', function () { document.getElementById('prevPhone').textContent = this.value || '—' });
        document.getElementById('department').addEventListener('change', function () { document.getElementById('prevDept').textContent = this.options[this.selectedIndex].text });
        document.getElementById('status').addEventListener('change', function () { document.getElementById('prevStatus').textContent = this.options[this.selectedIndex].text });

        // Form Submit
        document.getElementById('userForm').addEventListener('submit', function (e) { e.preventDefault(); let valid = true;['firstName', 'lastName', 'email', 'phone', 'password', 'confirmPassword'].forEach(id => { const el = document.getElementById(id); if (!el.value.trim()) { el.classList.add('is-invalid'); valid = false } else { el.classList.remove('is-invalid') } }); const pw = document.getElementById('password'), cpw = document.getElementById('confirmPassword'); if (pw.value.length < 8) { pw.classList.add('is-invalid'); valid = false } if (pw.value !== cpw.value) { cpw.classList.add('is-invalid'); valid = false } if (valid) { alert('User created successfully!'); window.location.href = 'manage-users.html' } });
        document.querySelectorAll('.form-control,.form-select').forEach(el => { el.addEventListener('input', function () { this.classList.remove('is-invalid') }) });
    </script>
</asp:Content>
