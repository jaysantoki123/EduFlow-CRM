<%@ Page Title="Application Details"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="ApplicationDetails.aspx.cs"
    Inherits="EduCRM.ApplicationDetails" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .application-details-page {
            padding: 30px;
            background: #F8FAFC;
            min-height: calc(100vh - 72px);
        }

        /* HEADER */

        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .page-title {
            margin: 0;
            font-size: 26px;
            font-weight: 700;
            color: #1E293B;
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

        /* MAIN CARD */

        .details-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .card-header {
            padding: 18px 22px;
            border-bottom: 1px solid #E2E8F0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-title {
            margin: 0;
            font-size: 16px;
            font-weight: 700;
            color: #1E293B;
        }

        .card-body {
            padding: 22px;
        }

        /* DETAILS GRID */

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            column-gap: 50px;
            row-gap: 22px;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .detail-label {
            font-size: 12px;
            font-weight: 600;
            color: #64748B;
        }

        .detail-value {
            font-size: 14px;
            font-weight: 500;
            color: #1E293B;
        }

        /* STATUS */

        .status-badge {
            display: inline-flex;
            width: fit-content;
            align-items: center;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            background: #FEF3C7;
            color: #92400E;
        }

        /* APPLICATION ID */

        .application-id {
            font-size: 13px;
            font-weight: 600;
            color: #4F46E5;
        }

        /* ACTIONS */

        .action-section {
            display: flex;
            gap: 10px;
        }

        .action-button {
            border: none;
            border-radius: 6px;
            padding: 9px 16px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .approve-button {
            background: #16A34A;
            color: #FFFFFF;
        }

        .reject-button {
            background: #DC2626;
            color: #FFFFFF;
        }

        .edit-button {
            background: #4F46E5;
            color: #FFFFFF;
        }

        @media (max-width: 768px) {

            .details-grid {
                grid-template-columns: 1fr;
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

    <div class="application-details-page">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <h1 class="page-title">
                Application Details
            </h1>

            <a href="<%= ResolveUrl("~/Admin/Applications.aspx") %>"
               class="back-button">

                <i class="fas fa-arrow-left"></i>

                Back to Applications

            </a>

        </div>


        <!-- APPLICATION INFORMATION -->

        <div class="details-card">

            <div class="card-header">

                <h2 class="card-title">
                    Application Information
                </h2>

                <span class="application-id">
                    <%= ApplicationId %>
                </span>

            </div>


            <div class="card-body">

                <div class="details-grid">

                    <div class="detail-item">

                        <span class="detail-label">
                            Application ID
                        </span>

                        <span class="detail-value">
                            <%= ApplicationId %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Application Date
                        </span>

                        <span class="detail-value">
                            <%= ApplicationDate %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Applied Course
                        </span>

                        <span class="detail-value">
                            <%= Course %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Application Status
                        </span>

                        <span class="status-badge">
                            <%= Status %>
                        </span>

                    </div>

                </div>

            </div>

        </div>


        <!-- STUDENT INFORMATION -->

        <div class="details-card">

            <div class="card-header">

                <h2 class="card-title">
                    Student Information
                </h2>

            </div>


            <div class="card-body">

                <div class="details-grid">

                    <div class="detail-item">

                        <span class="detail-label">
                            Student Name
                        </span>

                        <span class="detail-value">
                            <%= StudentName %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Email Address
                        </span>

                        <span class="detail-value">
                            <%= Email %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Phone Number
                        </span>

                        <span class="detail-value">
                            <%= Phone %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Date of Birth
                        </span>

                        <span class="detail-value">
                            <%= DateOfBirth %>
                        </span>

                    </div>

                </div>

            </div>

        </div>


        <!-- ACADEMIC INFORMATION -->

        <div class="details-card">

            <div class="card-header">

                <h2 class="card-title">
                    Academic Information
                </h2>

            </div>


            <div class="card-body">

                <div class="details-grid">

                    <div class="detail-item">

                        <span class="detail-label">
                            Qualification
                        </span>

                        <span class="detail-value">
                            <%= Qualification %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Passing Year
                        </span>

                        <span class="detail-value">
                            <%= PassingYear %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Percentage
                        </span>

                        <span class="detail-value">
                            <%= Percentage %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Previous Institution
                        </span>

                        <span class="detail-value">
                            <%= Institution %>
                        </span>

                    </div>

                </div>

            </div>

        </div>


        <!-- CONTACT INFORMATION -->

        <div class="details-card">

            <div class="card-header">

                <h2 class="card-title">
                    Contact Information
                </h2>

            </div>


            <div class="card-body">

                <div class="details-grid">

                    <div class="detail-item">

                        <span class="detail-label">
                            Address
                        </span>

                        <span class="detail-value">
                            <%= Address %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            City
                        </span>

                        <span class="detail-value">
                            <%= City %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            State
                        </span>

                        <span class="detail-value">
                            <%= State %>
                        </span>

                    </div>


                    <div class="detail-item">

                        <span class="detail-label">
                            Pincode
                        </span>

                        <span class="detail-value">
                            <%= Pincode %>
                        </span>

                    </div>

                </div>

            </div>

        </div>


        <!-- ACTIONS -->

        <div class="details-card">

            <div class="card-header">

                <h2 class="card-title">
                    Application Actions
                </h2>

            </div>


            <div class="card-body">

                <div class="action-section">

                    <button type="button"
                            class="action-button approve-button">

                        <i class="fas fa-check"></i>
                        Approve

                    </button>


                    <button type="button"
                            class="action-button reject-button">

                        <i class="fas fa-times"></i>
                        Reject

                    </button>


                    <button type="button"
                            class="action-button edit-button">

                        <i class="fas fa-edit"></i>
                        Edit

                    </button>

                </div>

            </div>

        </div>

    </div>

</asp:Content>