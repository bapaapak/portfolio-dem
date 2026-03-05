<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Message;
use App\Models\Profile;
use App\Models\Project;
use App\Models\Skill;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Create admin user
        User::create([
            'name' => 'Admin',
            'email' => 'admin@portfolio.com',
            'password' => Hash::make('password'),
        ]);

        // Create profile
        Profile::create([
            'name' => 'Alex Developer',
            'title' => 'Full-Stack Developer',
            'bio' => 'Hi, I\'m a Creative Developer based in Jakarta. I specialize in building accessible, pixel-perfect user interfaces that blend form and function.',
            'story' => 'I started coding when I was 15, building simple WordPress themes. What began as a curiosity quickly turned into a career obsession. Today, I specialize in the MERN stack and Python. I believe code is just a tool to solve human problems, and I strive to make those solutions as elegant as possible.',
            'photo' => null,
            'email' => 'hello@portfolio.com',
            'phone' => '+62 812 3456 7890',
            'whatsapp' => '6281234567890',
            'location' => 'Jakarta Selatan, Indonesia',
            'cv_file' => null,
            'years_experience' => 5,
            'total_projects' => 40,
            'happy_clients' => 25,
            'awards' => 12,
            'hobbies' => [
                ['name' => 'Photography', 'icon' => 'camera'],
                ['name' => 'Gaming', 'icon' => 'gamepad'],
                ['name' => 'Hiking', 'icon' => 'mountain'],
                ['name' => 'Reading', 'icon' => 'book'],
            ],
            'social_links' => [
                'linkedin' => 'https://linkedin.com/in/alexdev',
                'github' => 'https://github.com/alexdev',
                'twitter' => 'https://twitter.com/alexdev',
            ],
        ]);

        // Create categories
        $categories = [
            ['name' => 'UI/UX Design', 'slug' => 'ui-ux-design', 'color' => '#00b4d8'],
            ['name' => 'Web Development', 'slug' => 'web-development', 'color' => '#48bb78'],
            ['name' => 'Mobile Apps', 'slug' => 'mobile-apps', 'color' => '#ed8936'],
            ['name' => 'Branding', 'slug' => 'branding', 'color' => '#9f7aea'],
            ['name' => 'Dashboard', 'slug' => 'dashboard', 'color' => '#f56565'],
        ];

        foreach ($categories as $category) {
            Category::create($category);
        }

        // Create skills
        $skills = [
            ['category' => 'Frontend', 'items' => 'React, Vue, Tailwind', 'type' => 'technical', 'order' => 1],
            ['category' => 'Backend', 'items' => 'Node.js, Python, Django', 'type' => 'technical', 'order' => 2],
            ['category' => 'Database', 'items' => 'PostgreSQL, MongoDB', 'type' => 'technical', 'order' => 3],
            ['category' => 'UI/UX Design', 'items' => 'Figma', 'type' => 'technical', 'order' => 4],
        ];

        foreach ($skills as $skill) {
            Skill::create($skill);
        }

        // Create experiences
        $experiences = [
            [
                'title' => 'Senior Frontend Engineer',
                'company' => 'TechStart Inc',
                'type' => 'Full-time',
                'start_date' => '2022-01-01',
                'end_date' => null,
                'description' => 'Leading the frontend migration to React 18, improving site performance by 40%. Mentoring junior developers and establishing UI guidelines.',
                'technologies' => ['React', 'Next.js', 'TypeScript'],
                'order' => 1,
            ],
            [
                'title' => 'Full Stack Developer',
                'company' => 'Creative Agency',
                'type' => 'Full-time',
                'start_date' => '2020-03-01',
                'end_date' => '2021-12-31',
                'description' => 'Developed and maintained e-commerce platforms for major retail clients. Integrated payment gateways and complex inventory systems.',
                'technologies' => ['Vue.js', 'Node.js', 'Firebase'],
                'order' => 2,
            ],
            [
                'title' => 'Junior Web Developer',
                'company' => 'Freelance',
                'type' => 'Freelance',
                'start_date' => '2018-06-01',
                'end_date' => '2020-02-28',
                'description' => 'Started my journey building custom WordPress themes and static websites for small businesses. Learned the fundamentals of HTML, CSS, and JS.',
                'technologies' => ['WordPress', 'HTML/CSS', 'JavaScript'],
                'order' => 3,
            ],
        ];

        foreach ($experiences as $experience) {
            Experience::create($experience);
        }

        // Create education
        $education = [
            [
                'institution' => 'University of Technology',
                'degree' => 'Bachelor of Computer Science',
                'start_date' => '2016-08-01',
                'end_date' => '2020-05-30',
                'gpa' => '3.8',
                'description' => 'Focused on Software Engineering and Artificial Intelligence. Active in student organizations and completed a thesis on Machine Learning for accessibility.',
                'order' => 1,
            ],
            [
                'institution' => 'Vocational High School',
                'degree' => 'Software Engineering',
                'start_date' => '2013-07-01',
                'end_date' => '2016-06-30',
                'gpa' => null,
                'description' => 'Learned the fundamentals of programming, web development, and database management. Participated in national coding competitions.',
                'order' => 2,
            ],
        ];

        foreach ($education as $edu) {
            Education::create($edu);
        }

        // Create projects
        $projects = [
            [
                'category_id' => 1,
                'title' => 'E-Commerce Redesign for Brand X',
                'slug' => 'e-commerce-redesign',
                'client' => 'Brand X Corp',
                'role' => 'Lead Designer',
                'timeline' => '4 Weeks',
                'description' => 'A complete overhaul of the shopping experience focusing on conversion, accessibility, and mobile responsiveness.',
                'challenge' => 'The client needed to rebuild their legacy platform while it was suffering from high bounce rates on mobile devices. Our goal was to streamline the checkout process and refresh the visual identity while maintaining brand recognition. The existing site was built on an outdated tech stack that made updates difficult and slow.',
                'solution' => 'We implemented a headless architecture using React and Shopify Plus, allowing for lightning-fast page loads and complete design freedom. The new design system utilizes a modular component library, ensuring consistency across all pages.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['UI/UX', 'Mobile'],
                'tools' => ['Figma', 'React', 'Shopify'],
                'key_improvements' => [
                    ['label' => '+45%', 'description' => 'Mobile Conversion Rate'],
                    ['label' => '2.6s', 'description' => 'Average Load Time'],
                    ['label' => '100%', 'description' => 'WCAG 2.1 Compliance'],
                    ['label' => '+65%', 'description' => 'Cart Abandonment'],
                ],
                'live_url' => 'https://example.com',
                'code_url' => 'https://github.com/example',
                'status' => 'published',
                'featured' => true,
            ],
            [
                'category_id' => 5,
                'title' => 'Finance Dashboard',
                'slug' => 'finance-dashboard',
                'client' => 'FinTech Corp',
                'role' => 'Full Stack Developer',
                'timeline' => '8 Weeks',
                'description' => 'Real-time data visualization tool for tracking investments and market trends.',
                'challenge' => 'Creating a dashboard that could handle real-time data streams while maintaining smooth performance.',
                'solution' => 'Built with React and D3.js for visualizations, with WebSocket connections for live data updates.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['Web App', 'React'],
                'tools' => ['React', 'D3.js', 'Node.js'],
                'key_improvements' => null,
                'live_url' => 'https://example.com',
                'code_url' => null,
                'status' => 'published',
                'featured' => true,
            ],
            [
                'category_id' => 4,
                'title' => 'Travel Brand Identity',
                'slug' => 'travel-brand-identity',
                'client' => 'Wanderlust Travel',
                'role' => 'Brand Designer',
                'timeline' => '3 Weeks',
                'description' => 'Complete visual identity system for a luxury travel agency specializing in remote destinations.',
                'challenge' => 'Creating a brand that conveys luxury while also appealing to adventure seekers.',
                'solution' => 'Developed a sophisticated yet adventurous visual language with custom typography and an earthy color palette.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['Branding', 'Identity'],
                'tools' => ['Figma', 'Illustrator'],
                'key_improvements' => null,
                'live_url' => null,
                'code_url' => null,
                'status' => 'published',
                'featured' => true,
            ],
            [
                'category_id' => 3,
                'title' => 'Fintech Mobile App',
                'slug' => 'fintech-mobile-app',
                'client' => 'PayFlow',
                'role' => 'Mobile Developer',
                'timeline' => '12 Weeks',
                'description' => 'Personal finance application that helps users track spending and set savings goals.',
                'challenge' => 'Building an intuitive interface for complex financial data on mobile devices.',
                'solution' => 'Used React Native with custom animations and clear data visualizations.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['React Native', 'iOS'],
                'tools' => ['React Native', 'Firebase'],
                'key_improvements' => null,
                'live_url' => null,
                'code_url' => null,
                'status' => 'published',
                'featured' => false,
            ],
            [
                'category_id' => 2,
                'title' => 'Corporate Landing Page',
                'slug' => 'corporate-landing-page',
                'client' => 'Global Tech',
                'role' => 'Frontend Developer',
                'timeline' => '2 Weeks',
                'description' => 'Marketing website for B2B SaaS startup, optimized for SEO and conversion.',
                'challenge' => 'Creating a fast-loading page with complex animations.',
                'solution' => 'Built with Next.js and Framer Motion for smooth animations without sacrificing performance.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['Webflow', 'SEO'],
                'tools' => ['Next.js', 'Framer Motion'],
                'key_improvements' => null,
                'live_url' => 'https://example.com',
                'code_url' => null,
                'status' => 'published',
                'featured' => false,
            ],
            [
                'category_id' => 3,
                'title' => 'Health Tracker iOS',
                'slug' => 'health-tracker-ios',
                'client' => 'HealthFirst',
                'role' => 'iOS Developer',
                'timeline' => '10 Weeks',
                'description' => 'Health tracking app connected to Apple Watch for monitoring fitness goals.',
                'challenge' => 'Integrating with HealthKit while maintaining battery efficiency.',
                'solution' => 'Implemented efficient background processing and smart data syncing.',
                'thumbnail' => null,
                'images' => null,
                'tags' => ['Swift', 'HealthKit'],
                'tools' => ['Swift', 'HealthKit', 'SwiftUI'],
                'key_improvements' => null,
                'live_url' => null,
                'code_url' => null,
                'status' => 'draft',
                'featured' => false,
            ],
        ];

        foreach ($projects as $project) {
            Project::create($project);
        }

        // Create sample messages
        Message::create([
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'subject' => 'Project Inquiry',
            'message' => 'Hi, I am interested in working with you on a new e-commerce project. Would love to discuss further.',
            'is_read' => false,
        ]);

        Message::create([
            'name' => 'Jane Smith',
            'email' => 'jane@example.com',
            'subject' => 'Collaboration Opportunity',
            'message' => 'Hello! I saw your portfolio and would love to collaborate on an upcoming mobile app project.',
            'is_read' => true,
        ]);

        Message::create([
            'name' => 'Mike Johnson',
            'email' => 'mike@company.com',
            'subject' => 'Full-time Position',
            'message' => 'We have an opening for a senior developer role and your profile caught our attention. Would you be interested?',
            'is_read' => false,
        ]);
    }
}
