<%@ Page Title="Inquiry Details"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="InquiryDetails.aspx.cs"
    Inherits="EduCRM.InquiryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .details-page {
            padding: 25px;
        }

        /* Main Details Card */
        .details-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(15, 23, 42, 0.05);
        }

        /* Header */
        .details-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e5e7eb;
            padding-bottom: 18px;
            margin-bottom: 25px;
        }

        .details-title {
            font-size: 22px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .details-id {
            font-size: 13px;
            color: #6b7280;
            margin-top: 5px;
        }

        /* Status */
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-new {
            background: #dbeafe;
            color: #2563eb;
        }

        .status-contacted {
            background: #fef3c7;
            color: #92400e;
        }

        .status-qualified {
            background: #ede9fe;
            color: #7c3aed;
        }

        .status-converted {
            background: #dcfce7;
            color: #16a34a;
        }

        /* Section Title */
        .section-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 25px 0 15px;
        }

        /* Details Grid */
        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        /* Detail Item */
        .detail-item {
            background: #f9fafb;
            border-radius: 8px;
            padding: 15px;
        }

        .detail-label {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 6px;
        }

        .detail-value {
            font-size: 14px;
            font-weight: 600;
            color: #111827;
        }

        /* Bottom Button */
        .bottom-button {
            margin-top: 25px;
        }

        .back-main-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 10px 18px;
            border-radius: 7px;
            background: #5746e8;
            color: white;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .back-main-button:hover {
            background: #4635d0;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(87, 70, 232, 0.25);
        }

        /* Responsive */
        @media (max-width: 700px) {

            .details-grid {
                grid-template-columns: 1fr;
            }

            .details-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="details-page">

        <div class="details-card">

            <!-- Header -->

            <div class="details-header">

                <div>

                    <h2 class="details-title">
                        Inquiry Details
                    </h2>

                    <div class="details-id">
                        Inquiry ID:
                        <strong><%= InquiryId %></strong>
                    </div>

                </div>

                <span class="status-badge <%= StatusClass %>">
                    <%= Status %>
                </span>

            </div>


            <!-- Student Information -->

            <div class="section-title">
                Student Information
            </div>

            <div class="details-grid">

                <div class="detail-item">

                    <div class="detail-label">
                        Student Name
                    </div>

                    <div class="detail-value">
                        <%= StudentName %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Phone Number
                    </div>

                    <div class="detail-value">
                        <%= Phone %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Course Interest
                    </div>

                    <div class="detail-value">
                        <%= Course %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Inquiry Source
                    </div>

                    <div class="detail-value">
                        <%= Source %>
                    </div>

                </div>

            </div>


            <!-- Inquiry Information -->

            <div class="section-title">
                Inquiry Information
            </div>

            <div class="details-grid">

                <div class="detail-item">

                    <div class="detail-label">
                        Inquiry Date
                    </div>

                    <div class="detail-value">
                        <%= InquiryDate %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Priority
                    </div>

                    <div class="detail-value">
                        <%= Priority %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Assigned Counselor
                    </div>

                    <div class="detail-value">
                        <%= Counselor %>
                    </div>

                </div>


                <div class="detail-item">

                    <div class="detail-label">
                        Current Status
                    </div>

                    <div class="detail-value">
                        <%= Status %>
                    </div>

                </div>

            </div>


            <!-- Bottom Back Button -->

            <div class="bottom-button">

                <a href="<%= ResolveUrl("~/Admin/Inquiries.aspx") %>"
                   class="back-main-button">

                    <i class="fas fa-arrow-left"></i>

                    Back to Inquiries

                </a>

            </div>

        </div>

    </div>

</asp:Content>