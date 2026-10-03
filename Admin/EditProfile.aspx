<%@ Page Title="Edit Profile"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs"
    Inherits="EduCRM.EditProfile" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .edit-profile-page {
            padding: 30px;
            background: #F8FAFC;
            min-height: calc(100vh - 70px);
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .page-title {
            margin: 0;
            font-size: 25px;
            font-weight: 700;
            color: #252C3A;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 15px;
            border-radius: 6px;
            background: #FFFFFF;
            border: 1px solid #E2E8EF;
            color: #555E70;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
        }

        .edit-card {
            background: #FFFFFF;
            border: 1px solid #E4E8EF;
            border-radius: 10px;
            padding: 25px;
            max-width: 850px;
        }

        .card-title {
            margin: 0 0 20px;
            font-size: 16px;
            color: #303745;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .form-label {
            font-size: 11px;
            font-weight: 600;
            color: #626B79;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 12px;
            border: 1px solid #DDE2EA;
            border-radius: 6px;
            font-size: 12px;
            color: #343B49;
            outline: none;
        }

        .form-control:focus {
            border-color: #5B5CE2;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .save-button {
            border: none;
            background: #5B5CE2;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: white;
            color: #626B79;
            border: 1px solid #DDE2EA;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        @media(max-width:700px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .edit-profile-page {
                padding: 20px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="edit-profile-page">

        <div class="page-header">

            <h1 class="page-title">
                Edit Profile
            </h1>

            <a href="<%= ResolveUrl("~/Admin/Profile.aspx") %>"
               class="back-button">

                <i class="fas fa-arrow-left"></i>
                Back to Profile

            </a>

        </div>


        <div class="edit-card">

            <h2 class="card-title">
                Personal &amp; Contact Details
            </h2>


            <div class="form-grid">

                <div class="form-group">

                    <label class="form-label">
                        Full Name
                    </label>

                    <asp:TextBox ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        Text="Admin User">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Username
                    </label>

                    <asp:TextBox ID="txtUsername"
                        runat="server"
                        CssClass="form-control"
                        Text="admin">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Email Address
                    </label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        Text="admin@educrm.com">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Phone Number
                    </label>

                    <asp:TextBox ID="txtPhone"
                        runat="server"
                        CssClass="form-control"
                        Text="+91 98765 43210">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Role
                    </label>

                    <asp:TextBox ID="txtRole"
                        runat="server"
                        CssClass="form-control"
                        Text="Administrator"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Joined Date
                    </label>

                    <asp:TextBox ID="txtJoinedDate"
                        runat="server"
                        CssClass="form-control"
                        Text="12 June 2025"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>

            </div>


            <div class="form-actions">

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save Changes"
                    CssClass="save-button"
                    OnClick="btnSave_Click" />

                <a href="<%= ResolveUrl("~/Admin/Profile.aspx") %>"
                   class="cancel-button">
                    Cancel
                </a>

            </div>


            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>