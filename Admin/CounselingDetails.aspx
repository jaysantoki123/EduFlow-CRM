<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CounselingDetails.aspx.cs" Inherits="EduFlow.Admin.CounselingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .detail-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            border-radius: var(--radius-xl);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
            color: white;
        }

        .detail-header-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: var(--spacing-lg);
        }

        .session-badge {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 8px 16px;
            border-radius: var(--radius-full);
            font-size: 14px;
            font-weight: 600;
        }

        .header-actions {
            display: flex;
            gap: var(--spacing-sm);
        }

        .header-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 8px 16px;
            border-radius: var(--radius-md);
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .header-btn:hover {
                background: rgba(255, 255, 255, 0.3);
            }

        .detail-header-body {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: var(--spacing-xl);
        }

        .header-section h3 {
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            opacity: 0.8;
            margin-bottom: var(--spacing-md);
        }

        .header-person {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-avatar {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-full);
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-weight: 700;
        }

        .header-person-name {
            font-size: 18px;
            font-weight: 600;
            margin: 0;
        }

        .header-person-role {
            font-size: 13px;
            opacity: 0.8;
            margin: 0;
        }

        .header-schedule-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
            font-size: 14px;
        }

            .header-schedule-item i {
                width: 20px;
                text-align: center;
                opacity: 0.8;
            }

        .detail-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-lg);
            padding-bottom: var(--spacing-md);
            border-bottom: 2px solid var(--border-subtle);
        }

        .section-title-icon {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .section-icon-circle {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.1) 0%, rgba(0, 81, 213, 0.1) 100%);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px;
        }

        .section-title-text h3 {
            font-size: 18px;
            font-weight: 600;
            margin: 0;
        }

        .section-title-text p {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: var(--spacing-lg);
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .info-value {
            font-size: 15px;
            font-weight: 500;
            color: var(--on-surface);
        }

        /* Outcome Section */
        .outcome-card {
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.05) 0%, rgba(34, 197, 94, 0.1) 100%);
            border: 1px solid rgba(34, 197, 94, 0.2);
            border-radius: var(--radius-xl);
            padding: var(--spacing-lg);
        }

        .outcome-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: var(--spacing-md);
        }

        .outcome-icon {
            width: 48px;
            height: 48px;
            background: var(--success);
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
        }

        .outcome-title {
            font-size: 16px;
            font-weight: 600;
            margin: 0;
        }

        .outcome-subtitle {
            font-size: 13px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        /* Notes Textarea */
        .notes-textarea {
            width: 100%;
            min-height: 120px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: 16px;
            font-size: 14px;
            resize: vertical;
            font-family: 'Inter', sans-serif;
        }

            .notes-textarea:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
            }

        /* Feedback Rating */
        .rating-stars {
            display: flex;
            gap: 8px;
        }

        .rating-star {
            font-size: 28px;
            color: var(--border-subtle);
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .rating-star.active {
                color: var(--warning);
            }

            .rating-star:hover {
                transform: scale(1.2);
            }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: var(--spacing-md);
            flex-wrap: wrap;
        }

        .action-btn-large {
            flex: 1;
            min-width: 200px;
            padding: var(--spacing-md) var(--spacing-lg);
            border-radius: var(--radius-lg);
            border: 2px solid var(--border-subtle);
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
        }

            .action-btn-large:hover {
                border-color: var(--primary);
                transform: translateY(-2px);
                box-shadow: var(--shadow-md);
            }

        .action-btn-icon {
            width: 48px;
            height: 48px;
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .action-btn-title {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin: 0;
        }

        .action-btn-desc {
            font-size: 12px;
            color: var(--on-surface-variant);
            margin: 0;
        }

        @media (max-width: 768px) {
            .detail-header-body {
                grid-template-columns: 1fr;
            }

            .detail-header-top {
                flex-direction: column;
                gap: var(--spacing-md);
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
            <!-- Back -->
            <div class="mb-3">
                <a href="counseling-list.html" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left"></i>Back to Sessions</a>
            </div>

            <!-- Detail Header -->
            <div class="detail-header">
                <div class="detail-header-top">
                    <div class="session-badge"><i class="fas fa-hashtag"></i>COU-2024-0045</div>
                    <div class="header-actions">
                        <button class="header-btn"><i class="fas fa-edit"></i>Edit</button>
                        <button class="header-btn"><i class="fas fa-print"></i>Print</button>
                        <button class="header-btn"><i class="fas fa-times"></i>Cancel</button>
                    </div>
                </div>

                <div class="detail-header-body">
                    <div class="header-section">
                        <h3>Student</h3>
                        <div class="header-person">
                            <div class="header-avatar">RK</div>
                            <div>
                                <p class="header-person-name">Rajesh Kumar</p>
                                <p class="header-person-role">B.Tech Computer Science</p>
                            </div>
                        </div>
                    </div>
                    <div class="header-section">
                        <h3>Counselor</h3>
                        <div class="header-person">
                            <div class="header-avatar">SP</div>
                            <div>
                                <p class="header-person-name">Sarah Patel</p>
                                <p class="header-person-role">Senior Counselor</p>
                            </div>
                        </div>
                    </div>
                    <div class="header-section">
                        <h3>Schedule</h3>
                        <div class="header-schedule-item"><i class="far fa-calendar"></i><span>December 18, 2024</span></div>
                        <div class="header-schedule-item"><i class="far fa-clock"></i><span>10:00 AM - 11:00 AM</span></div>
                        <div class="header-schedule-item"><i class="fas fa-video"></i><span>Online (Zoom)</span></div>
                    </div>
                </div>
            </div>

            <div class="row g-3">
                <div class="col-lg-8">
                    <!-- Session Information -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-info-circle"></i></div>
                                <div class="section-title-text">
                                    <h3>Session Information</h3>
                                    <p>Complete session details</p>
                                </div>
                            </div>
                        </div>

                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Session Type</span>
                                <span class="info-value">First Counseling</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Duration</span>
                                <span class="info-value">60 Minutes</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Status</span>
                                <span class="badge badge-primary" style="width: fit-content; padding: 6px 14px">Scheduled</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Related Inquiry</span>
                                <span class="info-value" style="color: var(--primary); cursor: pointer">#INQ-2024-001</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Meeting Link</span>
                                <a href="#" style="color: var(--primary); font-size: 14px; font-weight: 500">https://zoom.us/j/meeting123</a>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Created On</span>
                                <span class="info-value">Dec 15, 2024 at 10:30 AM</span>
                            </div>
                        </div>
                    </div>

                    <!-- Agenda -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-list-check"></i></div>
                                <div class="section-title-text">
                                    <h3>Session Agenda</h3>
                                    <p>Topics to be covered</p>
                                </div>
                            </div>
                        </div>

                        <ul style="padding-left: 20px; margin: 0; display: flex; flex-direction: column; gap: 12px">
                            <li style="font-size: 14px; color: var(--on-surface)">Introduction and understanding student's academic background</li>
                            <li style="font-size: 14px; color: var(--on-surface)">Discuss B.Tech CSE program curriculum and specializations</li>
                            <li style="font-size: 14px; color: var(--on-surface)">Explain admission process and requirements</li>
                            <li style="font-size: 14px; color: var(--on-surface)">Fee structure and scholarship opportunities</li>
                            <li style="font-size: 14px; color: var(--on-surface)">Campus facilities and placement statistics</li>
                            <li style="font-size: 14px; color: var(--on-surface)">Q&A and next steps</li>
                        </ul>
                    </div>

                    <!-- Outcome (shown for completed sessions) -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-clipboard-check"></i></div>
                                <div class="section-title-text">
                                    <h3>Session Outcome</h3>
                                    <p>Record the session results</p>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label style="font-size: 14px; font-weight: 600; display: block; margin-bottom: 8px">Outcome Status</label>
                            <select class="form-select" style="max-width: 300px" id="outcomeStatus">
                                <option value="">Select Outcome...</option>
                                <option value="positive">Positive - Likely to Apply</option>
                                <option value="neutral">Neutral - Needs More Info</option>
                                <option value="negative">Negative - Not Interested</option>
                                <option value="followup">Requires Follow-up</option>
                            </select>
                        </div>

                        <div class="form-group mb-3">
                            <label style="font-size: 14px; font-weight: 600; display: block; margin-bottom: 8px">Session Notes</label>
                            <textarea class="notes-textarea" placeholder="Write detailed notes about the session outcome..."></textarea>
                        </div>

                        <div class="form-group mb-3">
                            <label style="font-size: 14px; font-weight: 600; display: block; margin-bottom: 8px">Student Feedback Rating</label>
                            <div class="rating-stars">
                                <i class="fas fa-star rating-star active" data-rating="1"></i>
                                <i class="fas fa-star rating-star active" data-rating="2"></i>
                                <i class="fas fa-star rating-star active" data-rating="3"></i>
                                <i class="fas fa-star rating-star active" data-rating="4"></i>
                                <i class="fas fa-star rating-star" data-rating="5"></i>
                            </div>
                        </div>

                        <button class="btn btn-primary"><i class="fas fa-save"></i>Save Outcome</button>
                    </div>
                </div>

                <div class="col-lg-4">
                    <!-- Student Info -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-user"></i></div>
                                <div class="section-title-text">
                                    <h3>Student Info</h3>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="session-avatar" style="width: 56px; height: 56px; font-size: 20px">RK</div>
                            <div>
                                <p style="margin: 0; font-size: 18px; font-weight: 600">Rajesh Kumar</p>
                                <p style="margin: 0; font-size: 13px; color: var(--on-surface-variant)">B.Tech Computer Science</p>
                            </div>
                        </div>

                        <div class="d-flex flex-column gap-3">
                            <div style="display: flex; align-items: center; gap: 10px; font-size: 13px">
                                <i class="fas fa-envelope" style="color: var(--primary); width: 16px"></i>
                                <span>rajesh.kumar@email.com</span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 10px; font-size: 13px">
                                <i class="fas fa-phone" style="color: var(--primary); width: 16px"></i>
                                <span>+91 98765 43210</span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 10px; font-size: 13px">
                                <i class="fas fa-map-marker-alt" style="color: var(--primary); width: 16px"></i>
                                <span>Mumbai, Maharashtra</span>
                            </div>
                        </div>

                        <a href="inquiry-details.html" class="btn btn-secondary btn-sm w-100 mt-3">
                            <i class="fas fa-external-link-alt"></i>View Full Profile
                        </a>
                    </div>

                    <!-- Quick Actions -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-bolt"></i></div>
                                <div class="section-title-text">
                                    <h3>Quick Actions</h3>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-column gap-3">
                            <div class="action-btn-large">
                                <div class="action-btn-icon" style="background: rgba(79,70,229,0.1); color: var(--primary)">
                                    <i class="fas fa-redo"></i>
                                </div>
                                <div>
                                    <p class="action-btn-title">Reschedule</p>
                                    <p class="action-btn-desc">Change date or time</p>
                                </div>
                            </div>

                            <div class="action-btn-large">
                                <div class="action-btn-icon" style="background: rgba(34,197,94,0.1); color: var(--success)">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <div>
                                    <p class="action-btn-title">Mark Complete</p>
                                    <p class="action-btn-desc">End session and record outcome</p>
                                </div>
                            </div>

                            <div class="action-btn-large">
                                <div class="action-btn-icon" style="background: rgba(0,81,213,0.1); color: var(--info)">
                                    <i class="fas fa-calendar-plus"></i>
                                </div>
                                <div>
                                    <p class="action-btn-title">Schedule Follow-up</p>
                                    <p class="action-btn-desc">Book next session</p>
                                </div>
                            </div>

                            <div class="action-btn-large">
                                <div class="action-btn-icon" style="background: rgba(245,158,11,0.1); color: var(--warning)">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div>
                                    <p class="action-btn-title">Send Reminder</p>
                                    <p class="action-btn-desc">Email/SMS notification</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Session History -->
                    <div class="detail-section">
                        <div class="section-header">
                            <div class="section-title-icon">
                                <div class="section-icon-circle"><i class="fas fa-history"></i></div>
                                <div class="section-title-text">
                                    <h3>Previous Sessions</h3>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: center; padding: var(--spacing-lg); color: var(--on-surface-variant)">
                            <i class="fas fa-calendar-times" style="font-size: 48px; color: var(--border-subtle); margin-bottom: var(--spacing-md); display: block"></i>
                            <p style="font-size: 14px; font-weight: 500; margin: 0 0 4px 0">No Previous Sessions</p>
                            <p style="font-size: 13px; margin: 0">This is the first counseling session for this student</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        // Sidebar
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('collapsed');
            document.getElementById('mainContent').classList.toggle('sidebar-collapsed');
        });

        // Rating Stars
        document.querySelectorAll('.rating-star').forEach(star => {
            star.addEventListener('click', function() {
                const rating = parseInt(this.dataset.rating);
                document.querySelectorAll('.rating-star').forEach(s => {
                    s.classList.toggle('active', parseInt(s.dataset.rating) <= rating);
                });
            });

            star.addEventListener('mouseenter', function() {
                const rating = parseInt(this.dataset.rating);
                document.querySelectorAll('.rating-star').forEach(s => {
                    if (parseInt(s.dataset.rating) <= rating) {
                        s.style.color = 'var(--warning)';
                    }
                });
            });

            star.addEventListener('mouseleave', function() {
                document.querySelectorAll('.rating-star').forEach(s => {
                    s.style.color = s.classList.contains('active') ? 'var(--warning)' : 'var(--border-subtle)';
                });
            });
        });
    </script>
</asp:Content>
