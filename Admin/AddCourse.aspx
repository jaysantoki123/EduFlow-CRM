<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="EduFlow.Admin.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .form-layout {
            display: grid;
            grid-template-columns: 1fr 360px;
            gap: var(--spacing-lg)
        }

        .form-card {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            margin-bottom: var(--spacing-lg)
        }

        .form-section {
            margin-bottom: var(--spacing-xl);
            padding-bottom: var(--spacing-xl);
            border-bottom: 1px solid var(--border-subtle)
        }

            .form-section:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0
            }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: 12px
        }

        .section-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg,rgba(79,70,229,.1),rgba(0,81,213,.1));
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary)
        }

        .form-group {
            margin-bottom: var(--spacing-lg)
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--on-surface);
            margin-bottom: 8px;
            display: block
        }

            .form-label.required::after {
                content: '*';
                color: var(--danger);
                margin-left: 4px
            }

        .form-control, .form-select {
            height: 48px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            font-size: 14px;
            background: white;
            width: 100%;
            transition: all .2s
        }

            .form-control:focus, .form-select:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79,70,229,.1)
            }

            .form-control.is-invalid {
                border-color: var(--error)
            }

        textarea.form-control {
            height: 120px;
            resize: vertical
        }

        .invalid-feedback {
            font-size: 12px;
            color: var(--error);
            margin-top: 4px;
            display: none
        }

        .form-control.is-invalid ~ .invalid-feedback {
            display: block
        }

        .semester-builder {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-md)
        }

        .semester-item {
            background: var(--surface-container-low);
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-lg);
            padding: var(--spacing-md);
            display: flex;
            align-items: center;
            gap: var(--spacing-md)
        }

        .semester-number {
            width: 40px;
            height: 40px;
            background: var(--primary);
            color: white;
            border-radius: var(--radius-full);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
            flex-shrink: 0
        }

        .semester-input {
            flex: 1
        }

        .semester-remove {
            width: 32px;
            height: 32px;
            border: none;
            background: transparent;
            color: var(--on-surface-variant);
            cursor: pointer;
            border-radius: var(--radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all .2s
        }

            .semester-remove:hover {
                background: rgba(239,68,68,.1);
                color: var(--danger)
            }

        .eligibility-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            padding: 10px;
            border: 1px solid var(--border-subtle);
            border-radius: var(--radius-md);
            background: white;
            min-height: 48px;
            cursor: text
        }

            .eligibility-tags:focus-within {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(79,70,229,.1)
            }

        .elig-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 12px;
            background: var(--primary);
            color: white;
            border-radius: var(--radius-full);
            font-size: 13px
        }

            .elig-tag button {
                background: none;
                border: none;
                color: white;
                cursor: pointer;
                padding: 0;
                font-size: 14px
            }

        .elig-input {
            border: none;
            outline: none;
            flex: 1;
            min-width: 120px;
            font-size: 14px;
            padding: 4px
        }

        .form-actions {
            display: flex;
            gap: var(--spacing-md);
            justify-content: flex-end;
            padding-top: var(--spacing-lg);
            border-top: 1px solid var(--border-subtle);
            margin-top: var(--spacing-xl)
        }

        /* Preview */
        .preview-card {
            background: rgba(255,255,255,.8);
            backdrop-filter: blur(12px);
            border-radius: var(--radius-xl);
            border: 1px solid var(--border-subtle);
            padding: var(--spacing-xl);
            position: sticky;
            top: 96px
        }

        .preview-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: var(--spacing-lg);
            display: flex;
            align-items: center;
            gap: 8px
        }

        .preview-banner {
            height: 100px;
            border-radius: var(--radius-lg);
            margin-bottom: var(--spacing-md);
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg,var(--primary),var(--secondary))
        }

            .preview-banner i {
                font-size: 36px;
                color: rgba(255,255,255,.2)
            }

        .preview-item {
            display: flex;
            align-items: flex-start;
            gap: var(--spacing-sm);
            padding: var(--spacing-sm) 0;
            border-bottom: 1px solid var(--border-subtle)
        }

            .preview-item:last-child {
                border-bottom: none
            }

        .preview-icon {
            width: 32px;
            height: 32px;
            border-radius: var(--radius-md);
            background: var(--surface-container);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            flex-shrink: 0;
            margin-top: 2px
        }

        .preview-label {
            font-size: 11px;
            color: var(--on-surface-variant);
            text-transform: uppercase;
            letter-spacing: .05em
        }

        .preview-value {
            font-size: 14px;
            font-weight: 500;
            color: var(--on-surface)
        }

        @media(max-width:1024px) {
            .form-layout {
                grid-template-columns: 1fr
            }

            .preview-card {
                position: static
            }
        }

        @media(max-width:768px) {
            .form-card {
                padding: var(--spacing-lg)
            }

            .form-actions {
                flex-direction: column
            }

                .form-actions button, .form-actions a {
                    width: 100%
                }
        }
    </style>

    <!-- Authentication and Navigation Control -->
    <script src="../js/auth.js"></script>
    <script src="../js/navigation.js"></script>

    <!-- Responsive Enhancements -->
    <style>
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
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="headline-lg mb-1" id="pageTitle">Add New Course</h1>
                    <p class="text-muted">Create a new academic program</p>
                </div>
                <a href="course-list.html" class="btn btn-secondary"><i class="fas fa-arrow-left"></i>Back to Courses</a>
            </div>

            <form id="courseForm" novalidate>
                <div class="form-layout">
                    <div>
                        <div class="form-card">
                            <!-- Basic Info -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-book"></i></div>
                                    <span>Basic Information</span></div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="form-label required">Course Name</label><input type="text" class="form-control" id="courseName" placeholder="e.g., B.Tech Computer Science" required><div class="invalid-feedback">Course name is required</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Course Code</label><input type="text" class="form-control" id="courseCode" placeholder="e.g., CSE-BTECH-001" required><div class="invalid-feedback">Code is required</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Department</label><select class="form-select" id="department" required><option value="">Select...</option>
                                                <option>Engineering</option>
                                                <option>Management</option>
                                                <option>Science</option>
                                                <option>Computer Applications</option>
                                                <option>Arts & Humanities</option>
                                            </select><div class="invalid-feedback">Department is required</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Level</label><select class="form-select" id="level" required><option value="">Select...</option>
                                                <option>Undergraduate</option>
                                                <option>Postgraduate</option>
                                                <option>Diploma</option>
                                                <option>Certificate</option>
                                            </select></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Mode</label><select class="form-select" id="mode"><option>Full-Time</option>
                                                <option>Part-Time</option>
                                                <option>Online</option>
                                                <option>Hybrid</option>
                                            </select></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label required">Description</label><textarea class="form-control" id="description" placeholder="Detailed course description..." required></textarea><div class="invalid-feedback">Description is required</div>
                                </div>
                            </div>

                            <!-- Duration & Structure -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-calendar-alt"></i></div>
                                    <span>Duration & Structure</span></div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Duration</label><select class="form-select" id="duration"><option>1 Year</option>
                                                <option>2 Years</option>
                                                <option>3 Years</option>
                                                <option selected>4 Years</option>
                                                <option>5 Years</option>
                                            </select></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Total Semesters</label><input type="number" class="form-control" id="semesters" value="8" min="1" max="12"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Total Seats</label><input type="number" class="form-control" id="seats" value="120" min="1"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Semester Subjects (Optional)</label>
                                    <div class="semester-builder" id="semesterBuilder">
                                        <div class="semester-item">
                                            <div class="semester-number">1</div>
                                            <div class="semester-input">
                                                <input type="text" class="form-control" placeholder="e.g., Programming, Data Structures, Math" style="height: 40px"></div>
                                            <button type="button" class="semester-remove" onclick="this.parentElement.remove()"><i class="fas fa-times"></i></button>
                                        </div>
                                        <div class="semester-item">
                                            <div class="semester-number">2</div>
                                            <div class="semester-input">
                                                <input type="text" class="form-control" placeholder="e.g., Algorithms, DBMS, OS" style="height: 40px"></div>
                                            <button type="button" class="semester-remove" onclick="this.parentElement.remove()"><i class="fas fa-times"></i></button>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-sm btn-secondary mt-2" id="addSemesterBtn"><i class="fas fa-plus"></i>Add Semester</button>
                                </div>
                            </div>

                            <!-- Fee & Financial -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-rupee-sign"></i></div>
                                    <span>Fee Structure</span></div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label required">Tuition Fee (per year)</label><input type="number" class="form-control" id="tuitionFee" placeholder="₹" value="380000"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label">Registration Fee</label><input type="number" class="form-control" id="registrationFee" placeholder="₹" value="10000"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label">Other Charges</label><input type="number" class="form-control" id="otherCharges" placeholder="₹" value="25000"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Scholarship Available</label>
                                    <div class="d-flex gap-4 flex-wrap">
                                        <div class="d-flex align-items-center gap-2">
                                            <input type="checkbox" id="meritScholarship" checked style="accent-color: var(--primary); width: 18px; height: 18px"><label for="meritScholarship" style="font-size: 14px; cursor: pointer">Merit-Based</label></div>
                                        <div class="d-flex align-items-center gap-2">
                                            <input type="checkbox" id="needScholarship" style="accent-color: var(--primary); width: 18px; height: 18px"><label for="needScholarship" style="font-size: 14px; cursor: pointer">Need-Based</label></div>
                                        <div class="d-flex align-items-center gap-2">
                                            <input type="checkbox" id="sportsScholarship" style="accent-color: var(--primary); width: 18px; height: 18px"><label for="sportsScholarship" style="font-size: 14px; cursor: pointer">Sports</label></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Eligibility -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-list-check"></i></div>
                                    <span>Eligibility & Requirements</span></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Minimum Qualification</label><select class="form-select" id="minQualification"><option>10th Standard</option>
                                                <option selected>12th Standard</option>
                                                <option>Diploma</option>
                                                <option>Bachelor's Degree</option>
                                                <option>Master's Degree</option>
                                            </select></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Minimum Percentage</label><input type="number" class="form-control" id="minPercentage" placeholder="e.g., 60" value="60" min="0" max="100"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Entrance Exam Required</label><select class="form-select" id="entranceExam"><option value="none">None</option>
                                        <option value="jee">JEE Main/Advanced</option>
                                        <option value="cat">CAT</option>
                                        <option value="gate">GATE</option>
                                        <option value="cuet">CUET</option>
                                        <option value="internal">Internal Exam</option>
                                    </select></div>
                                <div class="form-group">
                                    <label class="form-label">Additional Criteria</label>
                                    <div class="eligibility-tags" id="eligTags">
                                        <div class="elig-tag">Physics & Math in 12th
                                            <button onclick="this.parentElement.remove()">&times;</button></div>
                                        <input type="text" class="elig-input" id="eligInput" placeholder="Type & press Enter...">
                                    </div>
                                </div>
                            </div>

                            <!-- Settings -->
                            <div class="form-section">
                                <div class="section-title">
                                    <div class="section-icon"><i class="fas fa-cog"></i></div>
                                    <span>Settings</span></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Status</label><select class="form-select" id="status"><option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                                <option value="upcoming">Upcoming</option>
                                            </select></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Accreditation</label><input type="text" class="form-control" id="accreditation" placeholder="e.g., AICTE, UGC, NAAC"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Course Highlights</label><textarea class="form-control" id="highlights" placeholder="Key features, placements, industry partnerships..." style="height: 80px"></textarea></div>
                            </div>

                            <div class="form-actions">
                                <a href="course-list.html" class="btn btn-secondary"><i class="fas fa-times"></i>Cancel</a>
                                <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i>Save Course</button>
                            </div>
                        </div>
                    </div>

                    <!-- Preview -->
                    <div>
                        <div class="preview-card">
                            <h3 class="preview-title"><i class="fas fa-eye" style="color: var(--primary)"></i>Course Preview</h3>
                            <div class="preview-banner"><i class="fas fa-book-open"></i></div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-book"></i></div>
                                <div>
                                    <p class="preview-label">Name</p>
                                    <p class="preview-value" id="prevName">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-code"></i></div>
                                <div>
                                    <p class="preview-label">Code</p>
                                    <p class="preview-value" id="prevCode">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-building"></i></div>
                                <div>
                                    <p class="preview-label">Department</p>
                                    <p class="preview-value" id="prevDept">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-layer-group"></i></div>
                                <div>
                                    <p class="preview-label">Level</p>
                                    <p class="preview-value" id="prevLevel">—</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="far fa-clock"></i></div>
                                <div>
                                    <p class="preview-label">Duration</p>
                                    <p class="preview-value" id="prevDuration">4 Years</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-chair"></i></div>
                                <div>
                                    <p class="preview-label">Seats</p>
                                    <p class="preview-value" id="prevSeats">120</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-rupee-sign"></i></div>
                                <div>
                                    <p class="preview-label">Fee / Year</p>
                                    <p class="preview-value" id="prevFee">₹3,80,000</p>
                                </div>
                            </div>
                            <div class="preview-item">
                                <div class="preview-icon"><i class="fas fa-toggle-on"></i></div>
                                <div>
                                    <p class="preview-label">Status</p>
                                    <p class="preview-value" id="prevStatus">Active</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>

    <script>
        // Check edit mode
        if (window.location.search.includes('edit=1')) { document.getElementById('pageTitle').textContent = 'Edit Course'; document.getElementById('courseName').value = 'B.Tech Computer Science'; document.getElementById('courseCode').value = 'CSE-BTECH-001'; document.getElementById('description').value = 'Bachelor of Technology in Computer Science and Engineering.'; }

        // Live Preview
        document.getElementById('courseName').addEventListener('input', function () { document.getElementById('prevName').textContent = this.value || '—' });
        document.getElementById('courseCode').addEventListener('input', function () { document.getElementById('prevCode').textContent = this.value || '—' });
        document.getElementById('department').addEventListener('change', function () { document.getElementById('prevDept').textContent = this.options[this.selectedIndex].text || '—' });
        document.getElementById('level').addEventListener('change', function () { document.getElementById('prevLevel').textContent = this.options[this.selectedIndex].text || '—' });
        document.getElementById('duration').addEventListener('change', function () { document.getElementById('prevDuration').textContent = this.options[this.selectedIndex].text });
        document.getElementById('seats').addEventListener('input', function () { document.getElementById('prevSeats').textContent = this.value });
        document.getElementById('tuitionFee').addEventListener('input', function () { document.getElementById('prevFee').textContent = '₹' + Number(this.value).toLocaleString('en-IN') });
        document.getElementById('status').addEventListener('change', function () { document.getElementById('prevStatus').textContent = this.options[this.selectedIndex].text });

        // Add Semester
        let semCount = 2;
        document.getElementById('addSemesterBtn').addEventListener('click', function () { semCount++; const item = document.createElement('div'); item.className = 'semester-item'; item.innerHTML = `<div class="semester-number">${semCount}</div><div class="semester-input"><input type="text" class="form-control" placeholder="Subjects for semester ${semCount}" style="height:40px"></div><button type="button" class="semester-remove" onclick="this.parentElement.remove()"><i class="fas fa-times"></i></button>`; document.getElementById('semesterBuilder').appendChild(item) });

        // Eligibility Tags
        document.getElementById('eligInput').addEventListener('keydown', function (e) { if (e.key === 'Enter' && this.value.trim()) { e.preventDefault(); const tag = document.createElement('div'); tag.className = 'elig-tag'; tag.innerHTML = `${this.value.trim()} <button onclick="this.parentElement.remove()">&times;</button>`; this.parentElement.insertBefore(tag, this); this.value = '' } });

        // Form Submit
        document.getElementById('courseForm').addEventListener('submit', function (e) { e.preventDefault(); let valid = true;['courseName', 'courseCode', 'department', 'description'].forEach(id => { const el = document.getElementById(id); if (!el.value.trim()) { el.classList.add('is-invalid'); valid = false } else { el.classList.remove('is-invalid') } }); if (valid) { alert('Course saved successfully!'); window.location.href = 'course-list.html' } });

        document.querySelectorAll('.form-control,.form-select').forEach(el => { el.addEventListener('input', function () { this.classList.remove('is-invalid') }) });
    </script>
</asp:Content>
