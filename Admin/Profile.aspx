<%@ Page Title="User Profile"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="EduCRM.Profile" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

<style>

.profile-page {
    padding: 25px 30px;
    background: #f7f9fc;
    min-height: calc(100vh - 70px);
}

.profile-banner {
    height: 135px;
    border-radius: 10px;
    background: linear-gradient(110deg, #202e73, #3948c8);
    position: relative;
    margin-bottom: 85px;
}

/* RIGHT SIDE BUTTONS */
.profile-action-buttons {
    position: absolute;
    right: 18px;
    top: 16px;

    display: flex;
    align-items: center;
    gap: 8px;
}

/* LOGOUT + EDIT PROFILE */
.logout-profile,
.edit-profile {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;

    background: white;
    color: #4f57d5;

    border: none;
    padding: 8px 13px;
    border-radius: 6px;

    font-size: 10px;
    font-weight: 500;

    text-decoration: none;
    cursor: pointer;

    box-sizing: border-box;
}

.logout-profile:hover,
.edit-profile:hover {
    background: #f1f2ff;
    color: #3039a5;
}

.profile-main {
    background: white;
    border: 1px solid #e4e8ef;
    border-radius: 9px;
    padding: 20px;
    position: absolute;
    left: 25px;
    right: 25px;
    top: 75px;
}

.profile-top {
    display: flex;
    align-items: center;
    gap: 14px;
}

.profile-avatar {
    width: 68px;
    height: 68px;
    border-radius: 50%;
    background: #eeeeff;
    color: #5b5ce2;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 25px;
    font-weight: bold;

    border: 4px solid white;
}

.profile-name h1 {
    margin: 0;
    font-size: 18px;
    color: #303745;
}

.profile-name p {
    margin: 5px 0;
    font-size: 11px;
    color: #9299a5;
}

.profile-grid {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 18px;
}

.profile-card {
    background: white;
    border: 1px solid #e4e8ef;
    border-radius: 9px;

    padding: 20px;
    margin-bottom: 18px;
}

.profile-card h2 {
    margin: 0 0 18px;

    font-size: 15px;
    color: #303745;
}

.info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
}

.info-item span {
    display: block;

    font-size: 10px;
    color: #9299a5;

    margin-bottom: 5px;
}

.info-item strong {
    font-size: 12px;
    color: #4b5563;
}

.activity {
    display: flex;
    gap: 10px;

    padding: 11px 0;

    border-bottom: 1px solid #edf0f4;
}

.activity:last-child {
    border-bottom: none;
}

.activity-icon {
    width: 29px;
    height: 29px;

    border-radius: 7px;

    background: #eeeeff;
    color: #5b5ce2;

    display: flex;
    justify-content: center;
    align-items: center;
}

.activity-text {
    font-size: 11px;
    color: #626b79;
}

.activity-text small {
    display: block;

    color: #9aa1ad;

    margin-top: 3px;
}

@media(max-width:800px) {

    .profile-grid {
        grid-template-columns: 1fr;
    }

    .info-grid {
        grid-template-columns: 1fr;
    }

    .profile-action-buttons {
        right: 12px;
        top: 12px;
    }

    .logout-profile,
    .edit-profile {
        padding: 7px 10px;
        font-size: 9px;
    }
}

</style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

<div class="profile-page">

    <!-- PROFILE BLUE BANNER -->
    <div class="profile-banner">

        <!-- LOGOUT + EDIT PROFILE -->
        <div class="profile-action-buttons">

            <a href="#"
               class="logout-profile">

                <i class="fas fa-right-from-bracket"></i>
                Logout

            </a>

            <button class="edit-profile"
                    type="button"
                    onclick="window.location.href='<%= ResolveUrl("~/Admin/EditProfile.aspx") %>';">

                <i class="fas fa-pen"></i>
                Edit Profile

            </button>

        </div>


        <!-- PROFILE INFORMATION CARD -->
        <div class="profile-main">

            <div class="profile-top">

                <div class="profile-avatar">
                    AD
                </div>

                <div class="profile-name">

                    <h1>
                        Admin User
                    </h1>

                    <p>
                        <i class="fas fa-user-shield"></i>
                        Administrator
                    </p>

                    <p>
                        <i class="fas fa-envelope"></i>
                        admin@educrm.com
                    </p>

                </div>

            </div>

        </div>

    </div>


    <!-- PROFILE CONTENT -->
    <div class="profile-grid">

        <!-- LEFT COLUMN -->
        <div>

            <!-- PERSONAL & CONTACT DETAILS -->
            <div class="profile-card">

                <h2>
                    Personal &amp; Contact Details
                </h2>

                <div class="info-grid">

                    <div class="info-item">
                        <span>FULL NAME</span>
                        <strong>Admin User</strong>
                    </div>

                    <div class="info-item">
                        <span>USERNAME</span>
                        <strong>admin</strong>
                    </div>

                    <div class="info-item">
                        <span>EMAIL ADDRESS</span>
                        <strong>admin@educrm.com</strong>
                    </div>

                    <div class="info-item">
                        <span>PHONE NUMBER</span>
                        <strong>+91 98765 43210</strong>
                    </div>

                    <div class="info-item">
                        <span>ROLE</span>
                        <strong>Administrator</strong>
                    </div>

                    <div class="info-item">
                        <span>JOINED DATE</span>
                        <strong>12 June 2025</strong>
                    </div>

                </div>

            </div>


            <!-- ACCOUNT INFORMATION -->
            <div class="profile-card">

                <h2>
                    Account Information
                </h2>

                <div class="info-grid">

                    <div class="info-item">
                        <span>ACCOUNT STATUS</span>
                        <strong>Active</strong>
                    </div>

                    <div class="info-item">
                        <span>LAST LOGIN</span>
                        <strong>30 Sep 2026, 09:42 AM</strong>
                    </div>

                    <div class="info-item">
                        <span>LOGIN COUNT</span>
                        <strong>842</strong>
                    </div>

                    <div class="info-item">
                        <span>SECURITY</span>
                        <strong>Protected</strong>
                    </div>

                </div>

            </div>

        </div>


        <!-- RIGHT COLUMN -->
        <div>

            <!-- RECENT ACTIVITY -->
            <div class="profile-card">

                <h2>
                    Recent Activity
                </h2>

                <div class="activity">

                    <div class="activity-icon">
                        <i class="fas fa-sign-in-alt"></i>
                    </div>

                    <div class="activity-text">

                        Logged into the system

                        <small>
                            Today, 09:42 AM
                        </small>

                    </div>

                </div>


                <div class="activity">

                    <div class="activity-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>

                    <div class="activity-text">

                        Added a new user

                        <small>
                            Yesterday, 04:20 PM
                        </small>

                    </div>

                </div>


                <div class="activity">

                    <div class="activity-icon">
                        <i class="fas fa-edit"></i>
                    </div>

                    <div class="activity-text">

                        Updated course details

                        <small>
                            28 Sep 2026
                        </small>

                    </div>

                </div>


                <div class="activity">

                    <div class="activity-icon">
                        <i class="fas fa-file-alt"></i>
                    </div>

                    <div class="activity-text">

                        Viewed application report

                        <small>
                            27 Sep 2026
                        </small>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>