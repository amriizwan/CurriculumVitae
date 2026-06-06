<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Builder — Create Your CV</title>
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

    <!-- Header -->
    <div class="bg-[#1a2332] text-white px-8 py-10">
        <p class="text-[#B8963E] text-xs font-semibold tracking-widest uppercase mb-2">Curriculum Vitae Builder</p>
        <h1 class="text-4xl font-bold">Craft Your <span class="text-[#B8963E]">Professional Story</span></h1>
        <p class="text-gray-400 mt-2 text-sm">Fill in your details below and generate a polished CV instantly.</p>
        <a href="${pageContext.request.contextPath}/example"
           class="inline-flex items-center gap-2 mt-4 text-[#B8963E] text-sm hover:underline">
            ☀ View Example CV
        </a>
    </div>

    <!-- Form -->
    <div class="max-w-2xl mx-auto py-10 px-4">
        <form action="${pageContext.request.contextPath}/form" method="post">

            <!-- Personal Information -->
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
                <div class="flex items-center gap-2 mb-5">
                    <span class="bg-[#B8963E] text-white text-xs font-bold px-3 py-1 rounded">👤 PERSONAL INFORMATION</span>
                </div>

                <label class="block text-xs font-semibold text-gray-500 mb-1">FULL NAME *</label>
                <input type="text" name="fullName" placeholder="e.g. Ahmad Zulkifli"
                       class="w-full border border-gray-200 rounded-lg px-4 py-2 mb-4 text-sm focus:outline-none focus:border-[#B8963E]" required>

                <label class="block text-xs font-semibold text-gray-500 mb-1">JOB TITLE *</label>
                <input type="text" name="jobTitle" placeholder="e.g. Junior Java Developer"
                       class="w-full border border-gray-200 rounded-lg px-4 py-2 mb-4 text-sm focus:outline-none focus:border-[#B8963E]" required>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-xs font-semibold text-gray-500 mb-1">EMAIL ADDRESS *</label>
                        <input type="email" name="email" placeholder="you@email.com"
                               class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]" required>
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-gray-500 mb-1">PHONE NUMBER *</label>
                        <input type="text" name="phone" placeholder="+60 12-345 6789"
                               class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]" required>
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4 mt-4">
                    <div>
                        <label class="block text-xs font-semibold text-gray-500 mb-1">LOCATION</label>
                        <input type="text" name="location" placeholder="Kuala Lumpur, Malaysia"
                               class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                    </div>
                    <div>
                        <label class="block text-xs font-semibold text-gray-500 mb-1">LINKEDIN / PORTFOLIO URL</label>
                        <input type="text" name="linkedinUrl" placeholder="linkedin.com/in/yourname"
                               class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                    </div>
                </div>

                <div class="mt-4">
                    <label class="block text-xs font-semibold text-gray-500 mb-1">PROFILE SUMMARY</label>
                    <textarea name="profileSummary" rows="4"
                              placeholder="A brief overview of your professional profile, goals, and what makes you unique..."
                              class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E] resize-none"></textarea>
                </div>
            </div>

            <!-- Education -->
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6" id="education-section">
                <div class="flex items-center gap-2 mb-5">
                    <span class="bg-[#B8963E] text-white text-xs font-bold px-3 py-1 rounded">🎓 EDUCATION</span>
                </div>

                <div id="education-entries">
                    <div class="education-entry mb-4">
                        <label class="block text-xs font-semibold text-gray-500 mb-1">INSTITUTION NAME *</label>
                        <input type="text" name="institution" placeholder="Universiti Teknologi Malaysia"
                               class="w-full border border-gray-200 rounded-lg px-4 py-2 mb-3 text-sm focus:outline-none focus:border-[#B8963E]">

                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">DEGREE / QUALIFICATION</label>
                                <input type="text" name="degree" placeholder="Bachelor of Computer Science"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">FIELD OF STUDY</label>
                                <input type="text" name="fieldOfStudy" placeholder="Software Engineering"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                        </div>

                        <div class="grid grid-cols-2 gap-4 mt-3">
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">START YEAR</label>
                                <input type="text" name="eduStartYear" placeholder="2020"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">END YEAR</label>
                                <input type="text" name="eduEndYear" placeholder="2024 (or Present)"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                        </div>

                        <div class="mt-3">
                            <label class="block text-xs font-semibold text-gray-500 mb-1">NOTES / ACHIEVEMENTS</label>
                            <input type="text" name="eduNotes" placeholder="Dean's List, GPA 3.8, etc."
                                   class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                        </div>
                    </div>
                </div>

                <button type="button" onclick="addEducation()"
                        class="mt-2 text-sm text-[#B8963E] border border-[#B8963E] rounded-lg px-4 py-2 hover:bg-[#B8963E] hover:text-white transition">
                    + Add Another Education
                </button>
            </div>

            <!-- Work Experience -->
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
                <div class="flex items-center gap-2 mb-5">
                    <span class="bg-[#B8963E] text-white text-xs font-bold px-3 py-1 rounded">💼 WORK EXPERIENCE</span>
                </div>

                <div id="experience-entries">
                    <div class="experience-entry mb-4">
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">JOB TITLE *</label>
                                <input type="text" name="jobTitle[]" placeholder="Software Engineer"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">COMPANY / ORGANISATION</label>
                                <input type="text" name="company" placeholder="TechCorp Sdn. Bhd."
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                        </div>

                        <div class="grid grid-cols-2 gap-4 mt-3">
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">START DATE</label>
                                <input type="text" name="expStartDate" placeholder="Jan 2022"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">END DATE</label>
                                <input type="text" name="expEndDate" placeholder="Dec 2023 (or Present)"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                        </div>

                        <div class="mt-3">
                            <label class="block text-xs font-semibold text-gray-500 mb-1">KEY RESPONSIBILITIES & ACHIEVEMENTS</label>
                            <textarea name="responsibilities" rows="4"
                                      placeholder="• Developed REST APIs using Spring Boot&#10;• Reduced load time by 40% through caching"
                                      class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E] resize-none"></textarea>
                        </div>
                    </div>
                </div>

                <button type="button" onclick="addExperience()"
                        class="mt-2 text-sm text-[#B8963E] border border-[#B8963E] rounded-lg px-4 py-2 hover:bg-[#B8963E] hover:text-white transition">
                    + Add Another Experience
                </button>
            </div>

            <!-- Skills -->
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
                <div class="flex items-center gap-2 mb-5">
                    <span class="bg-[#B8963E] text-white text-xs font-bold px-3 py-1 rounded">⭐ SKILLS</span>
                </div>

                <label class="block text-xs font-semibold text-gray-500 mb-1">TECHNICAL SKILLS</label>
                <input type="text" name="technicalSkills"
                       placeholder="e.g. Java, Spring Boot, MySQL (comma separated)"
                       class="w-full border border-gray-200 rounded-lg px-4 py-2 mb-4 text-sm focus:outline-none focus:border-[#B8963E]">

                <label class="block text-xs font-semibold text-gray-500 mb-1">SOFT SKILLS</label>
                <input type="text" name="softSkills"
                       placeholder="e.g. Leadership, Teamwork (comma separated)"
                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
            </div>

            <!-- Projects -->
            <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
                <div class="flex items-center gap-2 mb-5">
                    <span class="bg-[#B8963E] text-white text-xs font-bold px-3 py-1 rounded">🖥 PROJECTS</span>
                    <span class="text-xs text-gray-400 border border-gray-300 rounded px-2 py-0.5">OPTIONAL</span>
                </div>

                <div id="project-entries">
                    <div class="project-entry mb-4">
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">PROJECT TITLE</label>
                                <input type="text" name="projectTitle" placeholder="CV Builder Web App"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-500 mb-1">TECHNOLOGIES USED</label>
                                <input type="text" name="projectTech" placeholder="Java EE, JSP, Tailwind CSS"
                                       class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E]">
                            </div>
                        </div>
                        <div class="mt-3">
                            <label class="block text-xs font-semibold text-gray-500 mb-1">DESCRIPTION</label>
                            <textarea name="projectDesc" rows="3"
                                      placeholder="Brief description of the project, your role, and outcome..."
                                      class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm focus:outline-none focus:border-[#B8963E] resize-none"></textarea>
                        </div>
                    </div>
                </div>

                <button type="button" onclick="addProject()"
                        class="mt-2 text-sm text-[#B8963E] border border-[#B8963E] rounded-lg px-4 py-2 hover:bg-[#B8963E] hover:text-white transition">
                    + Add Another Project
                </button>
            </div>

            <!-- Submit -->
            <div class="flex items-center justify-between mt-6">
                <a href="${pageContext.request.contextPath}/example"
                   class="text-sm text-[#B8963E] hover:underline">☀ See an Example CV first</a>
                <button type="submit"
                        class="bg-[#1a2332] text-white px-8 py-3 rounded-xl font-semibold hover:bg-[#B8963E] transition">
                    Generate My CV →
                </button>
            </div>

        </form>
    </div>

    <script>
        function addEducation() {
            const container = document.getElementById('education-entries');
            const entry = container.querySelector('.education-entry').cloneNode(true);
            entry.querySelectorAll('input, textarea').forEach(el => el.value = '');
            container.appendChild(entry);
        }

        function addExperience() {
            const container = document.getElementById('experience-entries');
            const entry = container.querySelector('.experience-entry').cloneNode(true);
            entry.querySelectorAll('input, textarea').forEach(el => el.value = '');
            container.appendChild(entry);
        }

        function addProject() {
            const container = document.getElementById('project-entries');
            const entry = container.querySelector('.project-entry').cloneNode(true);
            entry.querySelectorAll('input, textarea').forEach(el => el.value = '');
            container.appendChild(entry);
        }
    </script>

</body>
</html>