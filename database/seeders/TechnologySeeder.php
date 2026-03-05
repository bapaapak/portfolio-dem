<?php

namespace Database\Seeders;

use App\Models\Technology;
use Illuminate\Database\Seeder;

class TechnologySeeder extends Seeder
{
    public function run(): void
    {
        $technologies = [
            ['name' => 'JavaScript', 'icon' => 'fab fa-js-square', 'order' => 1],
            ['name' => 'PHP', 'icon' => 'fab fa-php', 'order' => 2],
            ['name' => 'Python', 'icon' => 'fab fa-python', 'order' => 3],
            ['name' => 'React', 'icon' => 'fab fa-react', 'order' => 4],
            ['name' => 'Vue.js', 'icon' => 'fab fa-vuejs', 'order' => 5],
            ['name' => 'Laravel', 'icon' => 'fab fa-laravel', 'order' => 6],
            ['name' => 'Node.js', 'icon' => 'fab fa-node-js', 'order' => 7],
            ['name' => 'Tailwind', 'icon' => 'fas fa-wind', 'order' => 8],
            ['name' => 'Docker', 'icon' => 'fab fa-docker', 'order' => 9],
            ['name' => 'MySQL', 'icon' => 'fas fa-database', 'order' => 10],
        ];

        foreach ($technologies as $technology) {
            Technology::create($technology);
        }
    }
}
