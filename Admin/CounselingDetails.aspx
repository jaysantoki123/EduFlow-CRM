<%@ Page Title="Counseling Session Details"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="CounselingDetails.aspx.cs"
    Inherits="EduCRM.CounselingDetails" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .counseling-details-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            padding: 24px;
            background: #F8FAFC;
            font-family: 'Inter', Arial, sans-serif;
            color: #111C2D;
            box-sizing: border-box;
        }

        .details-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            gap: 20px;
        }

        .details-title h1 {
            margin: 0 0 5px 0;
            font-family: 'Montserrat', Arial, sans-serif;
            font-size: 28px;
            font-weight: 600;
            color: #111C2D;
        }

        .details-title p {
            margin: 0;
            font-size: 13px;
            color: #64748B;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 9px 14px;
            border: 1px solid #DDE3FF;
            border-radius: 8px;
            background: #FFFFFF;
            color: #4F46E5;
            text-decoration: none;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
        }

        .back-button:hover {
            background: #EEF2FF;
        }

        .details-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 14px;
            padding: 22px;
            box-shadow: 0 2px 8px rgba(15, 23, 42, .04);
        }

        .details-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 18px;
            border-bottom: 1px solid #E2E8F0;
            margin-bottom: 22px;
        }

        .session-id {
            font-size: 13px;
            font-weight: 600;
            color: #4F46E5;
        }

        .session-status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 5px 11px;
            border-radius: 999px;
            font-size: 10px;
            font-weight: 600;
        }

        .status-scheduled {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .status-ongoing {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .status-completed {
            background: #ECFDF3;
            color: #22C55E;
        }

        .student-section {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 25px;
        }

        .student-avatar {
            width: 58px;
            height: 58px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            background: linear-gradient(135deg, #4F46E5, #0051D5);
            font-size: 16px;
            font-weight: 600;
            flex-shrink: 0;
        }

        .student-info h2 {
            margin: 0 0 5px 0;
            font-size: 19px;
            font-weight: 600;
            color: #111C2D;
        }

        .student-info p {
            margin: 0;
            font-size: 11px;
            color: #64748B;
        }

        .section-title {
            margin: 0 0 14px 0;
            font-size: 14px;
            font-weight: 600;
            color: #111C2D;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-bottom: 25px;
        }

        .detail-box {
            background: #F8FAFC;
            border: 1px solid #E2E8F0;
            border-radius: 9px;
            padding: 15px;
        }

        .detail-box label {
            display: block;
            margin-bottom: 6px;
            font-size: 9px;
            color: #64748B;
            text-transform: uppercase;
            letter-spacing: .5px;
        }

        .detail-box strong {
            font-size: 12px;
            font-weight: 600;
            color: #334155;
        }

        .counselor-box {
            display: flex;
            align-items: center;
            gap: 12px;
            background: #F0F3FF;
            border-radius: 10px;
            padding: 15px;
        }

        .counselor-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #FFFFFF;
            color: #4F46E5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            font-weight: 700;
        }

        .counselor-info strong {
            display: block;
            margin-bottom: 3px;
            font-size: 12px;
            color: #334155;
        }

        .counselor-info span {
            font-size: 10px;
            color: #64748B;
        }

        @media (max-width: 700px) {

            .counseling-details-page {
                padding: 16px;
            }

            .details-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="counseling-details-page">

        <!-- HEADER -->

        <div class="details-header">

            <div class="details-title">

                <h1>
                    Counseling Session Details
                </h1>

                <p>
                    Complete information about the selected counseling session
                </p>

            </div>

            <a href="<%= ResolveUrl("~/Admin/Counseling.aspx") %>"
               class="back-button">

                <i class="fas fa-arrow-left"></i>

                Back to Counseling

            </a>

        </div>


        <!-- DETAILS CARD -->

        <div class="details-card">

            <div class="details-card-header">

                <span class="session-id">
                    <%= SessionId %>
                </span>

                <span class="session-status <%= StatusClass %>">

                    <i class="fas fa-circle"></i>

                    <%= Status %>

                </span>

            </div>


            <!-- STUDENT -->

            <div class="student-section">

                <div class="student-avatar">
                    <%= StudentInitials %>
                </div>

                <div class="student-info">

                    <h2>
                        <%= StudentName %>
                    </h2>

                    <p>
                        <%= Course %>
                    </p>

                </div>

            </div>


            <!-- SESSION INFORMATION -->

            <h3 class="section-title">
                Session Information
            </h3>

            <div class="details-grid">

                <div class="detail-box">

                    <label>
                        Date
                    </label>

                    <strong>
                        <%= SessionDate %>
                    </strong>

                </div>


                <div class="detail-box">

                    <label>
                        Time
                    </label>

                    <strong>
                        <%= SessionTime %>
                    </strong>

                </div>


                <div class="detail-box">

                    <label>
                        Mode / Location
                    </label>

                    <strong>
                        <%= Mode %>
                    </strong>

                </div>


                <div class="detail-box">

                    <label>
                        Session Type
                    </label>

                    <strong>
                        <%= SessionType %>
                    </strong>

                </div>

            </div>


            <!-- COUNSELOR -->

            <h3 class="section-title">
                Counselor Information
            </h3>

            <div class="counselor-box">

                <div class="counselor-avatar">
                    <%= CounselorInitials %>
                </div>

                <div class="counselor-info">

                    <strong>
                        <%= CounselorName %>
                    </strong>

                    <span>
                        <%= CounselorRole %>
                    </span>

                </div>

            </div>

        </div>

    </div>

</asp:Content>