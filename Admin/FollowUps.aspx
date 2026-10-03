<%@ Page Title="Follow-up Monitoring & Oversight"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="FollowUps.aspx.cs"
    Inherits="EduCRM.FollowUps" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           FOLLOW-UP MONITORING PAGE
           ===================================================== */

        .followup-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            padding: 22px;
            background: #F8FAFC;
            font-family: 'Inter', Arial, sans-serif;
            color: #111C2D;
            box-sizing: border-box;
        }

        .followup-page *,
        .followup-page *::before,
        .followup-page *::after {
            box-sizing: border-box;
        }


        /* ================= HEADER ================= */

        .followup-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 17px;
        }

        .followup-title h1 {
            margin: 0 0 5px 0;
            font-family: 'Montserrat', Arial, sans-serif;
            font-size: 29px;
            font-weight: 600;
            line-height: 36px;
            color: #111C2D;
        }

        .followup-title p {
            margin: 0;
            color: #64748B;
            font-size: 12px;
            line-height: 19px;
        }


        /* ================= TOP VIEW BUTTONS ================= */

        .followup-view-tabs {
            display: flex;
            align-items: center;
            gap: 4px;
            margin-bottom: 18px;
        }

        .followup-view-tab {
            border: none;
            background: transparent;
            color: #64748B;
            padding: 8px 12px;
            border-radius: 8px;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 10px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .followup-view-tab:hover {
            background: #EEF2FF;
            color: #4F46E5;
            transform: translateY(-1px);
        }

        .followup-view-tab i {
            margin-right: 5px;
        }

        .followup-view-tab.active {
            color: #FFFFFF;
            background: #4F46E5;
            box-shadow: 0 2px 6px rgba(79, 70, 229, .20);
        }


        /* ================= STATISTICS ================= */

        .followup-stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 9px;
            margin-bottom: 17px;
        }

        .followup-stat-card {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            padding: 14px;
            min-height: 86px;
            box-shadow: 0 2px 7px rgba(15, 23, 42, .025);

            /* HOVER EFFECT */
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .followup-stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(15, 23, 42, 0.10);
            border-color: #C7D2FE;
        }

        .followup-stat-content {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .followup-stat-icon {
            width: 36px;
            height: 36px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 14px;
        }

        .followup-icon-purple {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .followup-icon-orange {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .followup-icon-red {
            background: #FEF2F2;
            color: #EF4444;
        }

        .followup-icon-green {
            background: #ECFDF3;
            color: #22C55E;
        }

        .followup-stat-label {
            font-size: 8px;
            font-weight: 600;
            color: #64748B;
            text-transform: uppercase;
            letter-spacing: .45px;
            margin-bottom: 3px;
        }

        .followup-stat-number {
            font-size: 19px;
            font-weight: 600;
            line-height: 22px;
            color: #111C2D;
        }


        /* ================= FILTER TABS ================= */

        .followup-filter-bar {
            display: flex;
            align-items: center;
            gap: 5px;
            background: transparent;
            border-bottom: 1px solid #E2E8F0;
            padding-bottom: 8px;
            margin-bottom: 12px;
            overflow-x: auto;
        }

        .followup-filter {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: none;
            background: transparent;
            color: #64748B;
            padding: 6px 10px;
            border-radius: 7px;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 9px;
            white-space: nowrap;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .followup-filter:hover {
            background: #F1F5F9;
            color: #4F46E5;
        }

        .followup-filter i {
            font-size: 8px;
        }

        .followup-filter-count {
            min-width: 18px;
            height: 17px;
            padding: 0 5px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #E2E8F0;
            color: #64748B;
            font-size: 8px;
            font-weight: 600;
        }

        .followup-filter.active {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .followup-filter.active .followup-filter-count {
            background: #E0E7FF;
            color: #4F46E5;
        }

        .filter-dot-orange {
            color: #F59E0B;
        }

        .filter-dot-red {
            color: #EF4444;
        }

        .filter-dot-green {
            color: #22C55E;
        }


        /* ================= BOARD ================= */

        .followup-board {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 9px;
            width: 100%;
        }

        .followup-column {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 9px;
            min-height: 390px;
            overflow: hidden;

            /* HOVER EFFECT */
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .followup-column:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
            border-color: #CBD5E1;
        }


        /* ================= COLUMN HEADER ================= */

        .followup-column-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 11px 10px;
            border-bottom: 1px solid #E2E8F0;
        }

        .column-title {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 11px;
            font-weight: 500;
            color: #64748B;
        }

        .column-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .dot-red {
            background: #EF4444;
        }

        .dot-orange {
            background: #F59E0B;
        }

        .dot-purple {
            background: #4F46E5;
        }

        .dot-green {
            background: #22C55E;
        }

        .column-count {
            min-width: 18px;
            height: 18px;
            padding: 0 5px;
            border-radius: 999px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEF2FF;
            color: #4F46E5;
            font-size: 8px;
            font-weight: 600;
        }


        /* ================= FOLLOW-UP CARD ================= */

        .followup-card {
            margin: 9px;
            padding: 10px;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            background: #FFFFFF;

            /* HOVER EFFECT */
            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                border-color 0.2s ease;
        }

        .followup-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 18px rgba(15, 23, 42, 0.08);
            border-color: #C7D2FE;
        }


        /* ================= CARD TOP ================= */

        .followup-card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 5px;
            margin-bottom: 9px;
        }

        .followup-type {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 3px 6px;
            border-radius: 5px;
            background: #EEF2FF;
            color: #4F46E5;
            font-size: 8px;
            font-weight: 600;
        }

        .followup-type.whatsapp {
            background: #ECFDF3;
            color: #16A34A;
        }

        .followup-type.email {
            background: #EFF6FF;
            color: #2563EB;
        }

        .followup-due {
            padding: 3px 6px;
            border-radius: 5px;
            font-size: 7px;
            font-weight: 600;
            white-space: nowrap;
        }

        .due-red {
            color: #EF4444;
            background: #FEF2F2;
        }

        .due-orange {
            color: #F59E0B;
            background: #FFF7E6;
        }

        .due-blue {
            color: #2563EB;
            background: #EFF6FF;
        }

        .due-green {
            color: #16A34A;
            background: #ECFDF3;
        }


        /* ================= STUDENT NAME ================= */

        .followup-student {
            margin-bottom: 8px;
        }

        .followup-student-name {
            display: block;
            font-size: 10px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 3px;
        }

        .followup-student-course {
            display: block;
            font-size: 8px;
            color: #64748B;
        }


        /* ================= COUNSELOR ================= */

        .followup-counselor {
            display: flex;
            align-items: center;
            gap: 4px;
            margin-top: 3px;
            font-size: 7px;
            color: #64748B;
        }

        .followup-counselor i {
            color: #94A3B8;
            font-size: 7px;
        }


        /* ================= DESCRIPTION ================= */

        .followup-description {
            background: #F8FAFC;
            border-radius: 5px;
            padding: 8px;
            margin: 8px 0;
            color: #64748B;
            font-size: 8px;
            line-height: 13px;
        }


        /* ================= CARD BOTTOM ================= */

        .followup-card-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 7px;
            border-top: 1px solid #F1F5F9;
        }

        .followup-date {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: #64748B;
            font-size: 7px;
        }

        .followup-date i {
            font-size: 7px;
        }

        .details-link {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            color: #4F46E5;
            font-size: 7px;
            font-weight: 600;
            text-decoration: none;

            transition: all 0.2s ease;
        }

        .details-link:hover {
            color: #3730A3;
            transform: translateY(-1px);
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .followup-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .followup-board {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 700px) {

            .followup-page {
                padding: 15px;
            }

            .followup-header {
                flex-direction: column;
            }

            .followup-stats {
                grid-template-columns: 1fr;
            }

            .followup-board {
                grid-template-columns: 1fr;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="followup-page">


        <!-- ================= PAGE HEADER ================= -->

        <div class="followup-header">

            <div class="followup-title">

                <h1>
                    Follow-up Monitoring &amp; Oversight
                </h1>

                <p>
                    Monitor all pending &amp; completed follow-ups and track counselor activity timelines
                </p>

            </div>

        </div>


        <!-- ================= VIEW TABS ================= -->

        <div class="followup-view-tabs">

            <button type="button"
                    class="followup-view-tab active">

                <i class="fas fa-th-large"></i>
                Board

            </button>

            <button type="button"
                    class="followup-view-tab">

                <i class="fas fa-list"></i>
                Table List

            </button>

            <button type="button"
                    class="followup-view-tab">

                <i class="fas fa-user-tie"></i>
                Counselor Activities

            </button>

            <button type="button"
                    class="followup-view-tab">

                <i class="fas fa-calendar-alt"></i>
                Follow-up Calendar

            </button>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="followup-stats">


            <!-- TOTAL FOLLOW-UPS -->

            <div class="followup-stat-card">

                <div class="followup-stat-content">

                    <div class="followup-stat-icon followup-icon-purple">
                        <i class="fas fa-list-check"></i>
                    </div>

                    <div>

                        <div class="followup-stat-label">
                            Total Follow-ups
                        </div>

                        <div class="followup-stat-number">
                            52
                        </div>

                    </div>

                </div>

            </div>


            <!-- PENDING -->

            <div class="followup-stat-card">

                <div class="followup-stat-content">

                    <div class="followup-stat-icon followup-icon-orange">
                        <i class="fas fa-hourglass-half"></i>
                    </div>

                    <div>

                        <div class="followup-stat-label">
                            Pending / Due Today
                        </div>

                        <div class="followup-stat-number">
                            12
                        </div>

                    </div>

                </div>

            </div>


            <!-- OVERDUE -->

            <div class="followup-stat-card">

                <div class="followup-stat-content">

                    <div class="followup-stat-icon followup-icon-red">
                        <i class="fas fa-triangle-exclamation"></i>
                    </div>

                    <div>

                        <div class="followup-stat-label">
                            Overdue Follow-ups
                        </div>

                        <div class="followup-stat-number">
                            7
                        </div>

                    </div>

                </div>

            </div>


            <!-- COMPLETED -->

            <div class="followup-stat-card">

                <div class="followup-stat-content">

                    <div class="followup-stat-icon followup-icon-green">
                        <i class="fas fa-circle-check"></i>
                    </div>

                    <div>

                        <div class="followup-stat-label">
                            Completed Follow-ups
                        </div>

                        <div class="followup-stat-number">
                            33
                        </div>

                    </div>

                </div>

            </div>


        </div>


        <!-- ================= FILTER BAR ================= -->

        <div class="followup-filter-bar">


            <button type="button"
                    class="followup-filter active">

                <i class="fas fa-layer-group"></i>

                All Follow-ups

                <span class="followup-filter-count">
                    52
                </span>

            </button>


            <button type="button"
                    class="followup-filter">

                <i class="fas fa-circle filter-dot-orange"></i>

                Pending Follow-ups

                <span class="followup-filter-count">
                    12
                </span>

            </button>


            <button type="button"
                    class="followup-filter">

                <i class="fas fa-triangle-exclamation filter-dot-red"></i>

                Overdue

                <span class="followup-filter-count">
                    7
                </span>

            </button>


            <button type="button"
                    class="followup-filter">

                <i class="fas fa-circle filter-dot-green"></i>

                Completed Follow-ups

                <span class="followup-filter-count">
                    33
                </span>

            </button>


        </div>


        <!-- ================= FOLLOW-UP BOARD ================= -->

        <div class="followup-board">


            <!-- ================= OVERDUE ================= -->

            <div class="followup-column">

                <div class="followup-column-header">

                    <div class="column-title">
                        <span class="column-dot dot-red"></span>
                        Overdue
                    </div>

                    <span class="column-count">
                        7
                    </span>

                </div>


                <div class="followup-card">

                    <div class="followup-card-top">

                        <span class="followup-type">

                            <i class="fas fa-phone"></i>
                            Call

                        </span>

                        <span class="followup-due due-red">
                            2d overdue
                        </span>

                    </div>


                    <div class="followup-student">

                        <span class="followup-student-name">
                            Nikhil Kumar
                        </span>

                        <span class="followup-student-course">
                            M.Tech AI • Sarah Patel
                        </span>

                    </div>


                    <div class="followup-description">

                        Call student regarding missing mark sheets
                        for admission verification.

                    </div>


                    <div class="followup-card-bottom">

                        <span class="followup-date">

                            <i class="far fa-clock"></i>
                            Dec 14

                        </span>

                        <a href="#" class="details-link">

                            <i class="fas fa-eye"></i>
                            Details

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================= DUE TODAY ================= -->

            <div class="followup-column">

                <div class="followup-column-header">

                    <div class="column-title">

                        <span class="column-dot dot-orange"></span>
                        Due Today

                    </div>

                    <span class="column-count">
                        12
                    </span>

                </div>


                <div class="followup-card">

                    <div class="followup-card-top">

                        <span class="followup-type">

                            <i class="fas fa-phone"></i>
                            Call

                        </span>

                        <span class="followup-due due-orange">
                            Due 3:00 PM
                        </span>

                    </div>


                    <div class="followup-student">

                        <span class="followup-student-name">
                            Rajesh Kumar
                        </span>

                        <span class="followup-student-course">
                            B.Tech CSE • Sarah Patel
                        </span>

                    </div>


                    <div class="followup-description">

                        Discuss application fee payment and
                        final counseling schedule.

                    </div>


                    <div class="followup-card-bottom">

                        <span class="followup-date">

                            <i class="far fa-clock"></i>
                            Today

                        </span>

                        <a href="#" class="details-link">

                            <i class="fas fa-eye"></i>
                            Details

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================= UPCOMING ================= -->

            <div class="followup-column">

                <div class="followup-column-header">

                    <div class="column-title">

                        <span class="column-dot dot-purple"></span>
                        Upcoming

                    </div>

                    <span class="column-count">
                        28
                    </span>

                </div>


                <div class="followup-card">

                    <div class="followup-card-top">

                        <span class="followup-type whatsapp">

                            <i class="fab fa-whatsapp"></i>
                            WhatsApp

                        </span>

                        <span class="followup-due due-blue">
                            Dec 18
                        </span>

                    </div>


                    <div class="followup-student">

                        <span class="followup-student-name">
                            Karan Malhotra
                        </span>

                        <span class="followup-student-course">
                            M.Tech AI • Rahul Gupta
                        </span>

                    </div>


                    <div class="followup-description">

                        Send course syllabus PDF and hostel
                        accommodation fee structure.

                    </div>


                    <div class="followup-card-bottom">

                        <span class="followup-date">

                            <i class="far fa-calendar"></i>
                            Dec 18

                        </span>

                        <a href="#" class="details-link">

                            <i class="fas fa-eye"></i>
                            Details

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================= COMPLETED ================= -->

            <div class="followup-column">

                <div class="followup-column-header">

                    <div class="column-title">

                        <span class="column-dot dot-green"></span>
                        Completed

                    </div>

                    <span class="column-count">
                        33
                    </span>

                </div>


                <div class="followup-card">

                    <div class="followup-card-top">

                        <span class="followup-type email">

                            <i class="fas fa-envelope"></i>
                            Email

                        </span>

                        <span class="followup-due due-green">
                            Completed
                        </span>

                    </div>


                    <div class="followup-student">

                        <span class="followup-student-name">
                            Priya Sharma
                        </span>

                        <span class="followup-student-course">
                            MBA Finance • Meera Patel
                        </span>

                    </div>


                    <div class="followup-description">

                        Followed up on application status;
                        student confirmed document upload.

                    </div>


                    <div class="followup-card-bottom">

                        <span class="followup-date">

                            <i class="fas fa-check"></i>
                            Today 10:30 AM

                        </span>

                        <a href="#" class="details-link">

                            <i class="fas fa-eye"></i>
                            Details

                        </a>

                    </div>

                </div>

            </div>


        </div>

    </div>

</asp:Content>