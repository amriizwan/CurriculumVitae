<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.curriculumvitae.model.CvData" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${cv.fullName} — Curriculum Vitae</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        gold: '#B8963E',
                        navy: '#1a2332',
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gray-100 min-h-screen">

    <%
        CvData cv = (CvData) request.getAttribute("cv");
    %>

    <!-- Top Navigation Bar -->
    <div class="bg-white border-b border-gray-200 px-6 py-3 flex justify-between items-center print:hidden">
        <a href="${pageContext.request.contextPath}/form"
           class="text-sm text-gray-600 hover:text-[#B8963E] flex items-center gap-2">
            ← Back to Form
        </a>
        <button onclick="window.print()"
                class="text-sm bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg flex items-center gap-2">
            🖨 Print / Save PDF
        </button>
    </div>

    <!-- CV Container -->
    <div class="max-w-3xl mx-auto my-8 px-4">
        <div class="bg-white rounded-2xl shadow-md overflow-hidden">

            <!-- Header Section (Dark Navy) -->
            <div class="bg-[#1a2332] text-white px-10 py-10">
                <p class="text-[#B8963E] text-xs font-semibold tracking-widest uppercase mb-2">
                    <%= cv.getJobTitle() != null ? cv.getJobTitle() : "" %>
                </p>
                <h1 class="text-4xl font-bold mb-4">
                    <%= cv.getFullName() != null ? cv.getFullName() : "" %>
                </h1>
                <div class="flex flex-wrap gap-4 text-sm text-gray-300">
                    <% if (cv.getEmail() != null && !cv.getEmail().isEmpty()) { %>
                        <span>✉ <%= cv.getEmail() %></span>
                    <% } %>
                    <% if (cv.getPhone() != null && !cv.getPhone().isEmpty()) { %>
                        <span>📞 <%= cv.getPhone() %></span>
                    <% } %>
                    <% if (cv.getLocation() != null && !cv.getLocation().isEmpty()) { %>
                        <span>📍 <%= cv.getLocation() %></span>
                    <% } %>
                </div>
                <% if (cv.getLinkedinUrl() != null && !cv.getLinkedinUrl().isEmpty()) { %>
                    <div class="mt-2 text-sm text-gray-300">
                        🔗 <%= cv.getLinkedinUrl() %>
                    </div>
                <% } %>
            </div>

            <!-- Body -->
            <div class="p-10 grid grid-cols-3 gap-8">

                <!-- Left Column (2/3) -->
                <div class="col-span-2 space-y-8">

                    <!-- Profile Summary -->
                    <% if (cv.getProfileSummary() != null && !cv.getProfileSummary().isEmpty()) { %>
                    <div>
                        <div class="flex items-center gap-3 mb-3">
                            <span class="text-[#B8963E] text-lg">●</span>
                            <h2 class="text-lg font-bold text-gray-800">Profile Summary</h2>
                            <div class="flex-1 h-px bg-[#B8963E] opacity-30"></div>
                        </div>
                        <div class="bg-gray-50 border-l-4 border-[#B8963E] rounded-r-lg px-4 py-3 text-sm text-gray-700 leading-relaxed">
                            <%= cv.getProfileSummary() %>
                        </div>
                    </div>
                    <% } %>

                    <!-- Work Experience -->
                    <% if (cv.getExperienceList() != null && !cv.getExperienceList().isEmpty()) { %>
                    <div>
                        <div class="flex items-center gap-3 mb-4">
                            <span class="text-[#B8963E] text-lg">●</span>
                            <h2 class="text-lg font-bold text-gray-800">Work Experience</h2>
                            <div class="flex-1 h-px bg-[#B8963E] opacity-30"></div>
                        </div>
                        <% for (CvData.Experience exp : cv.getExperienceList()) { %>
                        <div class="mb-6">
                            <div class="flex items-start gap-3">
                                <span class="text-[#B8963E] mt-1">○</span>
                                <div class="flex-1">
                                    <h3 class="font-bold text-gray-800"><%= exp.getJobTitle() %></h3>
                                    <p class="text-[#B8963E] text-sm font-semibold"><%= exp.getCompany() %></p>
                                    <p class="text-gray-400 text-xs mt-0.5">
                                        🗓 <%= exp.getStartDate() %> — <%= exp.getEndDate() %>
                                    </p>
                                    <% if (exp.getResponsibilities() != null && !exp.getResponsibilities().isEmpty()) { %>
                                    <ul class="mt-2 space-y-1">
                                        <% for (String line : exp.getResponsibilities().split("\n")) {
                                            if (!line.trim().isEmpty()) { %>
                                        <li class="text-sm text-gray-600 flex gap-2">
                                            <span class="text-gray-400 mt-0.5">›</span>
                                            <span><%= line.trim() %></span>
                                        </li>
                                        <% } } %>
                                    </ul>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <% } %>

                    <!-- Education -->
                    <% if (cv.getEducationList() != null && !cv.getEducationList().isEmpty()) { %>
                    <div>
                        <div class="flex items-center gap-3 mb-4">
                            <span class="text-[#B8963E] text-lg">●</span>
                            <h2 class="text-lg font-bold text-gray-800">Education</h2>
                            <div class="flex-1 h-px bg-[#B8963E] opacity-30"></div>
                        </div>
                        <% for (CvData.Education edu : cv.getEducationList()) { %>
                        <div class="mb-5">
                            <div class="flex items-start gap-3">
                                <span class="text-[#B8963E] mt-1">○</span>
                                <div>
                                    <h3 class="font-bold text-gray-800"><%= edu.getInstitution() %></h3>
                                    <% if (!edu.getDegree().isEmpty() || !edu.getFieldOfStudy().isEmpty()) { %>
                                    <p class="text-sm text-[#B8963E] font-medium">
                                        <%= edu.getDegree() %>
                                        <% if (!edu.getDegree().isEmpty() && !edu.getFieldOfStudy().isEmpty()) { %> — <% } %>
                                        <%= edu.getFieldOfStudy() %>
                                    </p>
                                    <% } %>
                                    <p class="text-gray-400 text-xs mt-0.5">
                                        🗓 <%= edu.getStartYear() %> — <%= edu.getEndYear() %>
                                    </p>
                                    <% if (edu.getNotes() != null && !edu.getNotes().isEmpty()) { %>
                                    <p class="text-xs text-gray-500 italic mt-1"><%= edu.getNotes() %></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <% } %>

                    <!-- Projects -->
                    <% if (cv.getProjectList() != null && !cv.getProjectList().isEmpty()) { %>
                    <div>
                        <div class="flex items-center gap-3 mb-4">
                            <span class="text-[#B8963E] text-lg">●</span>
                            <h2 class="text-lg font-bold text-gray-800">Projects</h2>
                            <div class="flex-1 h-px bg-[#B8963E] opacity-30"></div>
                        </div>
                        <% for (CvData.Project proj : cv.getProjectList()) { %>
                        <div class="mb-5">
                            <div class="flex items-start gap-3">
                                <span class="text-[#B8963E] mt-1">○</span>
                                <div>
                                    <h3 class="font-bold text-gray-800"><%= proj.getTitle() %></h3>
                                    <p class="text-xs text-[#B8963E] italic"><%= proj.getTechnologies() %></p>
                                    <p class="text-sm text-gray-600 mt-1"><%= proj.getDescription() %></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <% } %>

                </div>

                <!-- Right Column (1/3) -->
                <div class="col-span-1 space-y-8">

                    <!-- Technical Skills -->
                    <% if (cv.getTechnicalSkills() != null && !cv.getTechnicalSkills().isEmpty()) { %>
                    <div>
                        <h2 class="text-xs font-bold tracking-widest text-gray-800 uppercase mb-3">
                            Technical Skills
                        </h2>
                        <div class="h-px bg-[#B8963E] mb-3 opacity-50"></div>
                        <div class="flex flex-wrap gap-2">
                            <% for (String skill : cv.getTechnicalSkills()) { %>
                            <span class="bg-gray-100 text-gray-700 text-xs px-3 py-1 rounded-full border border-gray-200">
                                <%= skill %>
                            </span>
                            <% } %>
                        </div>
                    </div>
                    <% } %>

                    <!-- Soft Skills -->
                    <% if (cv.getSoftSkills() != null && !cv.getSoftSkills().isEmpty()) { %>
                    <div>
                        <h2 class="text-xs font-bold tracking-widest text-gray-800 uppercase mb-3">
                            Soft Skills
                        </h2>
                        <div class="h-px bg-[#B8963E] mb-3 opacity-50"></div>
                        <div class="flex flex-wrap gap-2">
                            <% for (String skill : cv.getSoftSkills()) { %>
                            <span class="bg-gray-100 text-gray-700 text-xs px-3 py-1 rounded-full border border-gray-200">
                                <%= skill %>
                            </span>
                            <% } %>
                        </div>
                    </div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>

    <!-- Print styles -->
    <style>
        @media print {
            body { background: white; }
            .print\:hidden { display: none; }
        }
    </style>

</body>
</html>