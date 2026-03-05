<?php

namespace Database\Seeders;

use App\Models\Education;
use Illuminate\Database\Seeder;

class EducationSeeder extends Seeder
{
    public function run(): void
    {
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
    }
}
