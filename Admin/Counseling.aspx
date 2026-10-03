<%@ Page Title="Counseling Monitoring"
    Language="C#"
    MasterPageFile="~/Admin/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Counseling.aspx.cs"
    Inherits="EduCRM.Counseling" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =====================================================
           COUNSELING MONITORING PAGE
           Page-specific CSS only
           ===================================================== */

        .counseling-page {
            width: 100%;
            min-height: calc(100vh - 70px);
            padding: 24px;
            background: #F8FAFC;
            font-family: 'Inter', Arial, sans-serif;
            color: #111C2D;
            box-sizing: border-box;
        }

        .counseling-page *,
        .counseling-page *::before,
        .counseling-page *::after {
            box-sizing: border-box;
        }

        /* ================= HEADER ================= */

        .counseling-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 22px;
            gap: 20px;
        }

        .counseling-title h1 {
            margin: 0 0 5px 0;
            font-family: 'Montserrat', Arial, sans-serif;
            font-size: 30px;
            font-weight: 600;
            line-height: 40px;
            color: #111C2D;
        }

        .counseling-title p {
            margin: 0;
            font-size: 13px;
            line-height: 21px;
            color: #64748B;
        }

        .calendar-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 10px 15px;
            border: 1px solid #DDE3FF;
            border-radius: 9px;
            background: #EEF2FF;
            color: #4F46E5;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            white-space: nowrap;
        }

        .calendar-btn:hover {
            background: #E0E7FF;
        }

        /* ================= VIEW TABS ================= */

        .view-tabs {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 20px;
        }

        .view-tab {
            border: none;
            background: transparent;
            color: #64748B;
            padding: 8px 13px;
            border-radius: 8px;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 11px;
            cursor: pointer;
        }

        .view-tab i {
            margin-right: 5px;
        }

        .view-tab.active {
            color: #FFFFFF;
            background: #4F46E5;
            box-shadow: 0 2px 7px rgba(79, 70, 229, .25);
        }

        /* ================= STAT CARDS ================= */

        .counseling-stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 16px;
            margin-bottom: 20px;
        }

        .counseling-stat { 
    background: #FFFFFF; 
    border: 1px solid #E2E8F0; 
    border-radius: 14px; 
    padding: 18px; 
    min-height: 125px; 
    box-shadow: 0 2px 8px rgba(15, 23, 42, .03);

    transition: transform 0.2s ease, box-shadow 0.2s ease;
    cursor: pointer;
}

.counseling-stat:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(15, 23, 42, .10);
}

        .stat-content {
            display: flex;
            align-items: flex-start;
            gap: 13px;
        }

        .stat-icon {
            width: 46px;
            height: 46px;
            border-radius: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 18px;
        }

        .icon-purple {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .icon-green {
            background: #ECFDF3;
            color: #22C55E;
        }

        .icon-orange {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .icon-blue {
            background: #EFF6FF;
            color: #2563EB;
        }

        .stat-label {
            font-size: 10px;
            font-weight: 600;
            color: #64748B;
            text-transform: uppercase;
            letter-spacing: .5px;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 23px;
            font-weight: 600;
            color: #111C2D;
            line-height: 28px;
        }

        .stat-small {
            margin-top: 5px;
            font-size: 10px;
            color: #64748B;
        }

        .green-text {
            color: #22C55E;
        }

        .orange-text {
            color: #F59E0B;
        }

        .blue-text {
            color: #2563EB;
        }

        /* ================= SESSION FILTER ================= */

        .session-tabs {
            display: flex;
            align-items: center;
            gap: 3px;
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 11px;
            padding: 4px;
            margin-bottom: 18px;
            overflow-x: auto;
        }

        .session-tab {
            border: none;
            background: transparent;
            color: #64748B;
            padding: 8px 14px;
            border-radius: 8px;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 10px;
            white-space: nowrap;
            cursor: pointer;
        }

        .session-tab span {
            margin-left: 4px;
            color: #94A3B8;
        }

        .session-tab.active {
            color: #FFFFFF;
            background: #4F46E5;
        }

        .session-tab.active span {
            color: #FFFFFF;
        }

        /* ================= SESSION GRID ================= */

        .session-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
        }

        /* ================= SESSION CARD ================= */

        .session-card { 
    background: #FFFFFF; 
    border: 1px solid #E2E8F0; 
    border-top: 3px solid #4F46E5; 
    border-radius: 12px; 
    padding: 16px; 
    box-shadow: 0 2px 8px rgba(15, 23, 42, .03);

    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.session-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(15, 23, 42, .10);
}

        .session-card.ongoing {
            border-top-color: #F59E0B;
        }

        .session-card.completed {
            border-top-color: #22C55E;
        }

        .session-card.rescheduled {
            border-top-color: #2563EB;
        }

        .session-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
        }

        .session-id {
            font-size: 10px;
            color: #4F46E5;
            font-weight: 600;
        }

        .session-status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 4px 8px;
            border-radius: 999px;
            font-size: 9px;
            font-weight: 600;
        }

        .session-status.scheduled {
            background: #EEF2FF;
            color: #4F46E5;
        }

        .session-status.ongoing {
            background: #FFF7E6;
            color: #F59E0B;
        }

        .session-status.completed {
            background: #ECFDF3;
            color: #22C55E;
        }

        .session-status.rescheduled {
            background: #EFF6FF;
            color: #2563EB;
        }

        /* ================= STUDENT ================= */

        .student-row {
            display: flex;
            align-items: center;
            gap: 11px;
            margin-bottom: 14px;
        }

        .student-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            background: linear-gradient(135deg, #4F46E5, #0051D5);
            font-size: 11px;
            font-weight: 600;
            flex-shrink: 0;
        }

        .student-info h3 {
            margin: 0 0 2px 0;
            font-size: 13px;
            font-weight: 600;
            color: #111C2D;
        }

        .student-info p {
            margin: 0;
            font-size: 10px;
            color: #64748B;
        }

        /* ================= SESSION DETAILS ================= */

        .session-details {
            background: #F0F3FF;
            border-radius: 10px;
            padding: 12px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 9px 15px;
            margin-bottom: 13px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            gap: 7px;
            min-width: 0;
        }

        .detail-item i {
            color: #4F46E5;
            width: 13px;
            font-size: 10px;
            text-align: center;
        }

        .detail-item span {
            color: #475569;
            font-size: 9px;
            line-height: 14px;
        }

        /* ================= COUNSELOR ================= */

        .counselor-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 11px;
            border-top: 1px solid #E2E8F0;
            margin-bottom: 12px;
        }

        .counselor-left {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .counselor-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: #EEF2FF;
            color: #4F46E5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 8px;
            font-weight: 700;
        }

        .counselor-text {
            font-size: 9px;
            color: #64748B;
        }

        .counselor-text strong {
            display: block;
            color: #334155;
            font-size: 10px;
            margin-bottom: 2px;
        }

        .view-session-btn {
            width: 100%;
            height: 30px;
            border: none;
            border-radius: 6px;
            background: linear-gradient(135deg, #4F46E5, #4338CA);
            color: #FFFFFF;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 9px;
            cursor: pointer;
        }

        .view-session-btn:hover {
            background: linear-gradient(135deg, #4338CA, #3730A3);
        }

        .view-session-btn i {
            margin-right: 5px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .counseling-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .session-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {

            .counseling-page {
                padding: 16px;
            }

            .counseling-header {
                flex-direction: column;
            }

            .counseling-stats {
                grid-template-columns: 1fr;
            }

            .session-details {
                grid-template-columns: 1fr;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="MainContent"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="counseling-page">

        <!-- ================= HEADER ================= -->

        <div class="counseling-header">

            <div class="counseling-title">

                <h1>Counseling Monitoring</h1>

                <p>
                    Monitor all student counseling sessions, counselor ratings, and appointment schedules
                </p>

            </div>

            <button type="button" class="calendar-btn">
                <i class="fas fa-calendar-alt"></i>
                Counseling Calendar
            </button>

        </div>


        <!-- ================= VIEW TABS ================= -->

        <div class="view-tabs">

            <button type="button" class="view-tab active">
                <i class="fas fa-th-large"></i>
                Cards
            </button>

            <button type="button" class="view-tab">
                <i class="fas fa-table"></i>
                Table
            </button>

            <button type="button" class="view-tab">
                <i class="fas fa-chart-line"></i>
                Performance
            </button>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="counseling-stats">

            <!-- TODAY'S SESSIONS -->

            <div class="counseling-stat">

                <div class="stat-content">

                    <div class="stat-icon icon-purple">
                        <i class="fas fa-calendar-check"></i>
                    </div>

                    <div>

                        <div class="stat-label">
                            Today's Sessions
                        </div>

                        <div class="stat-value">
                            8
                        </div>

                        <div class="stat-small green-text">
                            <i class="fas fa-arrow-up"></i>
                            3 scheduled today
                        </div>

                    </div>

                </div>

            </div>


            <!-- COMPLETED -->

            <div class="counseling-stat">

                <div class="stat-content">

                    <div class="stat-icon icon-green">
                        <i class="fas fa-check"></i>
                    </div>

                    <div>

                        <div class="stat-label">
                            Completed Sessions
                        </div>

                        <div class="stat-value">
                            124
                        </div>

                        <div class="stat-small green-text">
                            <i class="fas fa-chart-line"></i>
                            85% completion rate
                        </div>

                    </div>

                </div>

            </div>


            <!-- RATING -->

            <div class="counseling-stat">

                <div class="stat-content">

                    <div class="stat-icon icon-orange">
                        <i class="fas fa-star"></i>
                    </div>

                    <div>

                        <div class="stat-label">
                            Avg. Counselor Rating
                        </div>

                        <div class="stat-value">
                            4.8 / 5.0
                        </div>

                        <div class="stat-small green-text">
                            <i class="fas fa-circle"></i>
                            High student feedback
                        </div>

                    </div>

                </div>

            </div>


            <!-- ACTIVE COUNSELORS -->

            <div class="counseling-stat">

                <div class="stat-content">

                    <div class="stat-icon icon-blue">
                        <i class="fas fa-users"></i>
                    </div>

                    <div>

                        <div class="stat-label">
                            Active Counselors
                        </div>

                        <div class="stat-value">
                            8
                        </div>

                        <div class="stat-small green-text">
                            <i class="fas fa-circle"></i>
                            100% capacity
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= SESSION FILTER ================= -->

        <div class="session-tabs">

            <button type="button" class="session-tab active">
                All Sessions
                <span>148</span>
            </button>

            <button type="button" class="session-tab">
                Scheduled
                <span>18</span>
            </button>

            <button type="button" class="session-tab">
                Ongoing
                <span>3</span>
            </button>

            <button type="button" class="session-tab">
                Completed
                <span>124</span>
            </button>

            <button type="button" class="session-tab">
                Rescheduled
                <span>5</span>
            </button>

        </div>


        <!-- ================= SESSION CARDS ================= -->

        <div class="session-grid">


            <!-- ================= RAJESH ================= -->

            <div class="session-card">

                <div class="session-top">

                    <span class="session-id">
                        #COU-2024-0045
                    </span>

                    <span class="session-status scheduled">
                        <i class="fas fa-circle"></i>
                        Scheduled
                    </span>

                </div>


                <div class="student-row">

                    <div class="student-avatar">
                        RK
                    </div>

                    <div class="student-info">

                        <h3>
                            Rajesh Kumar
                        </h3>

                        <p>
                            B.Tech Computer Science
                        </p>

                    </div>

                </div>


                <div class="session-details">

                    <div class="detail-item">

                        <i class="fas fa-calendar"></i>

                        <span>
                            Dec 18, 2024
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="far fa-clock"></i>

                        <span>
                            10:00 AM - 11:00 AM
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-video"></i>

                        <span>
                            Online (Zoom)
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-tag"></i>

                        <span>
                            First Counseling
                        </span>

                    </div>

                </div>


                <div class="counselor-row">

                    <div class="counselor-left">

                        <div class="counselor-avatar">
                            SP
                        </div>

                        <div class="counselor-text">

                            <strong>
                                Sarah Patel
                            </strong>

                            Senior Counselor

                        </div>

                    </div>

                </div>


                <button type="button"
        class="view-session-btn"
        onclick="window.location.href='<%= ResolveUrl("~/Admin/CounselingDetails.aspx?id=COU-2024-0045") %>';"> 

    <i class="fas fa-eye"></i> 
    View Session Details 

</button>
            </div>


            <!-- ================= PRIYA ================= -->

            <div class="session-card ongoing">

                <div class="session-top">

                    <span class="session-id">
                        #COU-2024-0044
                    </span>

                    <span class="session-status ongoing">
                        <i class="fas fa-circle"></i>
                        Ongoing
                    </span>

                </div>


                <div class="student-row">

                    <div class="student-avatar">
                        PS
                    </div>

                    <div class="student-info">

                        <h3>
                            Priya Sharma
                        </h3>

                        <p>
                            MBA Finance
                        </p>

                    </div>

                </div>


                <div class="session-details">

                    <div class="detail-item">

                        <i class="fas fa-calendar"></i>

                        <span>
                            Dec 16, 2024
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="far fa-clock"></i>

                        <span>
                            2:00 PM - 3:00 PM
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-building"></i>

                        <span>
                            Office - Room 205
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-tag"></i>

                        <span>
                            Career Guidance
                        </span>

                    </div>

                </div>


                <div class="counselor-row">

                    <div class="counselor-left">

                        <div class="counselor-avatar">
                            RG
                        </div>

                        <div class="counselor-text">

                            <strong>
                                Rahul Gupta
                            </strong>

                            Counselor

                        </div>

                    </div>

                </div>


               <button type="button"
        class="view-session-btn"
        onclick="window.location.href='<%= ResolveUrl("~/Admin/CounselingDetails.aspx?id=COU-2024-0044") %>';"> 

    <i class="fas fa-eye"></i> 
    View Session Details 

</button>

            </div>


            <!-- ================= AMIT ================= -->

            <div class="session-card completed">

                <div class="session-top">

                    <span class="session-id">
                        #COU-2024-0043
                    </span>

                    <span class="session-status completed">
                        <i class="fas fa-circle"></i>
                        Completed
                    </span>

                </div>


                <div class="student-row">

                    <div class="student-avatar">
                        AV
                    </div>

                    <div class="student-info">

                        <h3>
                            Amit Verma
                        </h3>

                        <p>
                            BCA
                        </p>

                    </div>

                </div>


                <div class="session-details">

                    <div class="detail-item">

                        <i class="fas fa-calendar"></i>

                        <span>
                            Dec 15, 2024
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="far fa-clock"></i>

                        <span>
                            11:00 AM - 12:00 PM
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-video"></i>

                        <span>
                            Online (Meet)
                        </span>

                    </div>

                    <div class="detail-item">

                        <i class="fas fa-tag"></i>

                        <span>
                            Follow-up
                        </span>

                    </div>

                </div>


                <div class="counselor-row">

                    <div class="counselor-left">

                        <div class="counselor-avatar">
                            MP
                        </div>

                        <div class="counselor-text">

                            <strong>
                                Meera Patel
                            </strong>

                            Senior Counselor

                        </div>

                    </div>

                </div>


                <button type="button"
        class="view-session-btn"
        onclick="window.location.href='<%= ResolveUrl("~/Admin/CounselingDetails.aspx?id=COU-2024-0043") %>';"> 

    <i class="fas fa-eye"></i> 
    View Session Details 

</button>
            </div>


        </div>

    </div>

</asp:Content>