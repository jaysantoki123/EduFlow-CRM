<%@ Page Title="New Application"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="NewApplication.aspx.cs"
    Inherits="EduCRM.NewApplication" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .new-application-page {
            padding: 30px;
            background: #F8FAFC;
            min-height: calc(100vh - 72px);
        }

        /* PAGE HEADER */

        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .page-title-section h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
            color: #1E293B;
        }

        .page-title-section p {
            margin: 6px 0 0;
            font-size: 13px;
            color: #64748B;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 16px;
            border-radius: 6px;
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            color: #475569;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .back-button:hover {
            background: #F1F5F9;
        }


        /* FORM CARD */

        .form-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .card-header {
            padding: 18px 22px;
            border-bottom: 1px solid #E2E8F0;
        }

        .card-title {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #1E293B;
        }

        .card-body {
            padding: 22px;
        }


        /* FORM GRID */

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            column-gap: 25px;
            row-gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            font-size: 12px;
            font-weight: 600;
            color: #475569;
        }

        .required {
            color: #EF4444;
        }

        .form-control {
            width: 100%;
            height: 40px;
            padding: 0 12px;
            border: 1px solid #CBD5E1;
            border-radius: 6px;
            background: #FFFFFF;
            color: #1E293B;
            font-size: 13px;
            font-family: 'Inter', Arial, sans-serif;
            box-sizing: border-box;
            outline: none;
        }

        .form-control:focus {
            border-color: #4F46E5;
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.08);
        }

        textarea.form-control {
            height: 90px;
            padding-top: 10px;
            resize: vertical;
        }


        /* BUTTONS */

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding-top: 5px;
        }

        .cancel-button {
            height: 40px;
            padding: 0 18px;
            border: 1px solid #CBD5E1;
            border-radius: 6px;
            background: #FFFFFF;
            color: #475569;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .cancel-button:hover {
            background: #F8FAFC;
        }

        .submit-button {
            height: 40px;
            padding: 0 20px;
            border: none;
            border-radius: 6px;
            background: #4F46E5;
            color: #FFFFFF;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .submit-button:hover {
            background: #4338CA;
        }


        /* MESSAGE */

        .message {
            display: block;
            margin-bottom: 15px;
            font-size: 13px;
            font-weight: 600;
        }


        /* RESPONSIVE */

        @media (max-width: 768px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="new-application-page">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <div class="page-title-section">

                <h1>
                    New Application
                </h1>

                <p>
                    Create a new student application.
                </p>

            </div>


            <a href="<%= ResolveUrl("~/Admin/Applications.aspx") %>"
               class="back-button">

                <i class="fas fa-arrow-left"></i>

                Back to Applications

            </a>

        </div>


        <!-- STUDENT INFORMATION -->

        <div class="form-card">

            <div class="card-header">

                <h2 class="card-title">
                    Student Information
                </h2>

            </div>


            <div class="card-body">

                <div class="form-grid">

                    <!-- STUDENT NAME -->

                    <div class="form-group">

                        <label class="form-label">
                            Student Name
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtStudentName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter student name">
                        </asp:TextBox>

                    </div>


                    <!-- EMAIL -->

                    <div class="form-group">

                        <label class="form-label">
                            Email Address
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter email address">
                        </asp:TextBox>

                    </div>


                    <!-- PHONE -->

                    <div class="form-group">

                        <label class="form-label">
                            Phone Number
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtPhone"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter phone number">
                        </asp:TextBox>

                    </div>


                    <!-- DATE OF BIRTH -->

                    <div class="form-group">

                        <label class="form-label">
                            Date of Birth
                        </label>

                        <asp:TextBox ID="txtDateOfBirth"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Date">
                        </asp:TextBox>

                    </div>

                </div>

            </div>

        </div>


        <!-- ACADEMIC INFORMATION -->

        <div class="form-card">

            <div class="card-header">

                <h2 class="card-title">
                    Academic Information
                </h2>

            </div>


            <div class="card-body">

                <div class="form-grid">

                    <!-- QUALIFICATION -->

                    <div class="form-group">

                        <label class="form-label">
                            Qualification
                            <span class="required">*</span>
                        </label>

                        <asp:DropDownList ID="ddlQualification"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Select Qualification"
                                Value="">
                            </asp:ListItem>

                            <asp:ListItem Text="10th"
                                Value="10th">
                            </asp:ListItem>

                            <asp:ListItem Text="12th"
                                Value="12th">
                            </asp:ListItem>

                            <asp:ListItem Text="Diploma"
                                Value="Diploma">
                            </asp:ListItem>

                            <asp:ListItem Text="Graduate"
                                Value="Graduate">
                            </asp:ListItem>

                            <asp:ListItem Text="Post Graduate"
                                Value="Post Graduate">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <!-- PASSING YEAR -->

                    <div class="form-group">

                        <label class="form-label">
                            Passing Year
                        </label>

                        <asp:TextBox ID="txtPassingYear"
                            runat="server"
                            CssClass="form-control"
                            placeholder="e.g. 2026">
                        </asp:TextBox>

                    </div>


                    <!-- PERCENTAGE -->

                    <div class="form-group">

                        <label class="form-label">
                            Percentage
                        </label>

                        <asp:TextBox ID="txtPercentage"
                            runat="server"
                            CssClass="form-control"
                            placeholder="e.g. 82.50">
                        </asp:TextBox>

                    </div>


                    <!-- PREVIOUS INSTITUTION -->

                    <div class="form-group">

                        <label class="form-label">
                            Previous Institution
                        </label>

                        <asp:TextBox ID="txtInstitution"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter institution name">
                        </asp:TextBox>

                    </div>

                </div>

            </div>

        </div>


        <!-- COURSE INFORMATION -->

        <div class="form-card">

            <div class="card-header">

                <h2 class="card-title">
                    Course Information
                </h2>

            </div>


            <div class="card-body">

                <div class="form-grid">

                    <!-- COURSE -->

                    <div class="form-group">

                        <label class="form-label">
                            Course
                            <span class="required">*</span>
                        </label>

                        <asp:DropDownList ID="ddlCourse"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Select Course"
                                Value="">
                            </asp:ListItem>

                            <asp:ListItem Text="Computer Engineering"
                                Value="Computer Engineering">
                            </asp:ListItem>

                            <asp:ListItem Text="Information Technology"
                                Value="Information Technology">
                            </asp:ListItem>

                            <asp:ListItem Text="Data Science"
                                Value="Data Science">
                            </asp:ListItem>

                            <asp:ListItem Text="Business Management"
                                Value="Business Management">
                            </asp:ListItem>

                        </asp:DropDownList>

                    </div>


                    <!-- APPLICATION DATE -->

                    <div class="form-group">

                        <label class="form-label">
                            Application Date
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox ID="txtApplicationDate"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Date">
                        </asp:TextBox>

                    </div>

                </div>

            </div>

        </div>


        <!-- ADDRESS INFORMATION -->

        <div class="form-card">

            <div class="card-header">

                <h2 class="card-title">
                    Address Information
                </h2>

            </div>


            <div class="card-body">

                <div class="form-grid">

                    <!-- ADDRESS -->

                    <div class="form-group full-width">

                        <label class="form-label">
                            Address
                        </label>

                        <asp:TextBox ID="txtAddress"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            placeholder="Enter complete address">
                        </asp:TextBox>

                    </div>


                    <!-- CITY -->

                    <div class="form-group">

                        <label class="form-label">
                            City
                        </label>

                        <asp:TextBox ID="txtCity"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter city">
                        </asp:TextBox>

                    </div>


                    <!-- STATE -->

                    <div class="form-group">

                        <label class="form-label">
                            State
                        </label>

                        <asp:TextBox ID="txtState"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter state">
                        </asp:TextBox>

                    </div>


                    <!-- PINCODE -->

                    <div class="form-group">

                        <label class="form-label">
                            Pincode
                        </label>

                        <asp:TextBox ID="txtPincode"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter pincode">
                        </asp:TextBox>

                    </div>

                </div>

            </div>

        </div>


        <!-- MESSAGE -->

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <!-- ACTIONS -->

        <div class="form-actions">

            <asp:Button ID="btnCancel"
                runat="server"
                Text="Cancel"
                CssClass="cancel-button"
                OnClick="btnCancel_Click" />

            <asp:Button ID="btnSubmit"
                runat="server"
                Text="Submit Application"
                CssClass="submit-button"
                OnClick="btnSubmit_Click" />

        </div>

    </div>

</asp:Content>