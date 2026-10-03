<%@ Page Title="System Settings"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Settings.aspx.cs"
    Inherits="EduCRM.Settings" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .settings-page {
            padding: 28px 32px;
            background: #f7f9fc;
            min-height: calc(100vh - 70px);
        }

        .settings-header {
            margin-bottom: 25px;
        }

        .settings-header h1 {
            margin: 0;
            font-size: 27px;
            color: #1f2937;
            font-weight: 700;
        }

        .settings-header p {
            margin: 7px 0 0;
            color: #7b8494;
            font-size: 14px;
        }

        .settings-layout {
            display: grid;
            grid-template-columns: 230px 1fr;
            gap: 22px;
        }

        .settings-menu {
            background: white;
            border: 1px solid #e6e9ef;
            border-radius: 12px;
            padding: 12px;
            height: fit-content;
        }

        .menu-title {
            font-size: 12px;
            font-weight: 700;
            color: #9aa1ad;
            padding: 10px 12px;
            text-transform: uppercase;
        }

        .menu-item {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 12px;
            border-radius: 7px;
            color: #5c6573;
            font-size: 13px;
            margin-bottom: 3px;
            cursor: pointer;
}

        .settings-menu .menu-item i {
            width: 18px;
            text-align: center;
}

        .settings-menu .menu-item.active {
            background: #eeeeff;
            color: #5b5ce2;
            font-weight: 600;
}

        .settings-content {
            min-width: 0;
        }

        .settings-card {
            background: white;
            border: 1px solid #e6e9ef;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
        }

        .card-heading {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 22px;
            padding-bottom: 17px;
            border-bottom: 1px solid #eef0f4;
        }

        .heading-icon {
            width: 38px;
            height: 38px;
            background: #eeeeff;
            color: #5b5ce2;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .heading-text h2 {
            margin: 0;
            font-size: 17px;
            color: #252d3a;
        }

        .heading-text p {
            margin: 4px 0 0;
            font-size: 12px;
            color: #9299a5;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            margin-bottom: 18px;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            color: #454d5b;
            margin-bottom: 7px;
        }

        .input-box,
        .select-box {
            height: 42px;
            border: 1px solid #dfe3e9;
            border-radius: 7px;
            padding: 0 12px;
            font-size: 13px;
            color: #374151;
            background: white;
            outline: none;
            box-sizing: border-box;
        }

        .input-box:focus,
        .select-box:focus {
            border-color: #5b5ce2;
        }

        textarea.input-box {
            height: 85px;
            padding-top: 12px;
            resize: vertical;
        }

        .setting-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eef0f4;
        }

        .setting-row:last-child {
            border-bottom: none;
        }

        .setting-info strong {
            display: block;
            font-size: 13px;
            color: #424a58;
            margin-bottom: 4px;
        }

        .setting-info span {
            font-size: 11px;
            color: #9299a5;
        }

        .switch {
            position: relative;
            width: 42px;
            height: 22px;
            flex-shrink: 0;
        }

        .switch input {
            display: none;
        }

        .slider {
            position: absolute;
            inset: 0;
            background: #d5d9e0;
            border-radius: 20px;
            cursor: pointer;
        }

        .slider:before {
            content: "";
            position: absolute;
            width: 16px;
            height: 16px;
            left: 3px;
            top: 3px;
            background: white;
            border-radius: 50%;
            transition: .2s;
        }

        .switch input:checked + .slider {
            background: #5b5ce2;
        }

        .switch input:checked + .slider:before {
            transform: translateX(20px);
        }

        .save-area {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 22px;
        }

        .btn {
            padding: 10px 19px;
            border-radius: 7px;
            font-size: 13px;
            cursor: pointer;
            border: none;
        }

        .reset-btn {
            background: white;
            border: 1px solid #dfe3e9;
            color: #596270;
        }

        .save-btn {
            background: #5b5ce2;
            color: white;
        }

        .save-btn i {
            margin-right: 6px;
        }

        .danger-card {
            border-left: 4px solid #e05252;
        }

        .danger-heading {
            color: #d84848 !important;
        }

        .danger-text {
            font-size: 12px;
            color: #8d949f;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .danger-btn {
            background: #fff2f2;
            color: #d84848;
            border: 1px solid #f2cccc;
        }

        @media (max-width: 850px) {
            .settings-layout {
                grid-template-columns: 1fr;
            }

            .settings-menu {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }

            .menu-title {
                grid-column: 1 / -1;
            }
        }

        @media (max-width: 600px) {
            .settings-page {
                padding: 20px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .settings-menu {
                display: block;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="settings-page">

        <!-- HEADER -->
        <div class="settings-header">
            <h1>System Settings</h1>
            <p>Manage your EduCRM system preferences and configuration.</p>
        </div>


        <div class="settings-layout">

            <!-- LEFT MENU -->
            <div class="settings-menu">

                <div class="menu-title">Settings</div>

                <div class="menu-item active">
                    <i class="fas fa-sliders-h"></i>
                    General
                </div>

                <div class="menu-item">
                    <i class="fas fa-bell"></i>
                    Notifications
                </div>

                <div class="menu-item">
                    <i class="fas fa-shield-alt"></i>
                    Security
                </div>

                <div class="menu-item">
                    <i class="fas fa-database"></i>
                    Backup
                </div>

            </div>


            <!-- RIGHT CONTENT -->
            <div class="settings-content">

                <!-- GENERAL SETTINGS -->
                <div class="settings-card">

                    <div class="card-heading">

                        <div class="heading-icon">
                            <i class="fas fa-cog"></i>
                        </div>

                        <div class="heading-text">
                            <h2>General Settings</h2>
                            <p>Basic information about your CRM system.</p>
                        </div>

                    </div>


                    <div class="form-row">

                        <div class="form-group">
                            <label>System Name</label>

                            <input type="text"
                                   class="input-box"
                                   value="EduCRM" />
                        </div>

                        <div class="form-group">
                            <label>Administrator Email</label>

                            <input type="email"
                                   class="input-box"
                                   value="admin@educrm.com" />
                        </div>

                    </div>


                    <div class="form-row">

                        <div class="form-group">
                            <label>Language</label>

                            <select class="select-box">
                                <option selected="selected">English</option>
                                <option>Hindi</option>
                                <option>Gujarati</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Time Zone</label>

                            <select class="select-box">
                                <option selected="selected">
                                    (GMT+05:30) India
                                </option>
                                <option>(GMT+00:00) UTC</option>
                                <option>(GMT+05:00) Pakistan</option>
                            </select>
                        </div>

                    </div>


                    <div class="form-group full">
                        <label>System Description</label>

                        <textarea class="input-box">EduCRM - Education Customer Relationship Management System</textarea>
                    </div>

                </div>


                <!-- NOTIFICATION SETTINGS -->
                <div class="settings-card">

                    <div class="card-heading">

                        <div class="heading-icon">
                            <i class="fas fa-bell"></i>
                        </div>

                        <div class="heading-text">
                            <h2>Notification Settings</h2>
                            <p>Control system notifications and alerts.</p>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Email Notifications</strong>
                            <span>Receive important updates through email.</span>
                        </div>

                        <label class="switch">
                            <input type="checkbox" checked="checked" />
                            <span class="slider"></span>
                        </label>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>New Inquiry Alerts</strong>
                            <span>Get notified when a new inquiry is received.</span>
                        </div>

                        <label class="switch">
                            <input type="checkbox" checked="checked" />
                            <span class="slider"></span>
                        </label>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Course Updates</strong>
                            <span>Receive notifications about course changes.</span>
                        </div>

                        <label class="switch">
                            <input type="checkbox" />
                            <span class="slider"></span>
                        </label>

                    </div>

                </div>


                <!-- SECURITY -->
                <div class="settings-card">

                    <div class="card-heading">

                        <div class="heading-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>

                        <div class="heading-text">
                            <h2>Security Settings</h2>
                            <p>Manage account and system security options.</p>
                        </div>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Two-Factor Authentication</strong>
                            <span>Add an extra layer of account security.</span>
                        </div>

                        <label class="switch">
                            <input type="checkbox" />
                            <span class="slider"></span>
                        </label>

                    </div>


                    <div class="setting-row">

                        <div class="setting-info">
                            <strong>Automatic Logout</strong>
                            <span>Automatically log out inactive users.</span>
                        </div>

                        <label class="switch">
                            <input type="checkbox" checked="checked" />
                            <span class="slider"></span>
                        </label>

                    </div>

                </div>


                <!-- SAVE BUTTONS -->
                <div class="save-area">

                    <button type="button" class="btn reset-btn">
                        Reset
                    </button>

                    <button type="button" class="btn save-btn">
                        <i class="fas fa-save"></i>
                        Save Changes
                    </button>

                </div>


                <!-- DANGER ZONE -->
                <div class="settings-card danger-card"
                     style="margin-top:20px;">

                    <div class="card-heading">

                        <div class="heading-icon"
                             style="background:#fff1f1;color:#d84848;">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>

                        <div class="heading-text">
                            <h2 class="danger-heading">
                                Danger Zone
                            </h2>

                            <p>
                                Actions in this section should be used carefully.
                            </p>
                        </div>

                    </div>


                    <div class="danger-text">
                        Resetting system settings may remove your current
                        configuration and restore the default settings.
                    </div>

                    <button type="button"
                            class="btn danger-btn">
                        <i class="fas fa-undo"></i>
                        Reset System Settings
                    </button>

                </div>

            </div>

        </div>

    </div>

</asp:Content>