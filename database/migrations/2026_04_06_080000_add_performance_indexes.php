<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $this->addIndexIfPossible('experiences', ['featured', 'start_date'], 'idx_exp_featured_start');
        $this->addIndexIfPossible('education', ['order', 'start_date'], 'idx_edu_order_start');
        $this->addIndexIfPossible('technologies', ['is_active', 'featured', 'order'], 'idx_tech_active_featured_order');
        $this->addIndexIfPossible('projects', ['status', 'featured', 'created_at'], 'idx_projects_status_featured_created');
        $this->addIndexIfPossible('skills', ['type', 'order'], 'idx_skills_type_order');
        $this->addIndexIfPossible('certifications', ['issued_at'], 'idx_cert_issued_at');
        $this->addIndexIfPossible('committee_activities', ['is_active', 'event_date', 'order'], 'idx_committee_active_event_order');
        $this->addIndexIfPossible('automation_strategies', ['is_active', 'term_type', 'category', 'order'], 'idx_auto_active_term_cat_order');
        $this->addIndexIfPossible('obstacle_challenges', ['type', 'is_active', 'order'], 'idx_obstacle_type_active_order');
        $this->addIndexIfPossible('job_descriptions', ['type', 'is_active', 'order'], 'idx_job_type_active_order');
        $this->addIndexIfPossible('organization_structures', ['parent_id', 'is_active', 'order'], 'idx_org_parent_active_order');
        $this->addIndexIfPossible('business_process_flows', ['step_order'], 'idx_bpf_step_order');
    }

    public function down(): void
    {
        $this->dropIndexIfPossible('experiences', 'idx_exp_featured_start');
        $this->dropIndexIfPossible('education', 'idx_edu_order_start');
        $this->dropIndexIfPossible('technologies', 'idx_tech_active_featured_order');
        $this->dropIndexIfPossible('projects', 'idx_projects_status_featured_created');
        $this->dropIndexIfPossible('skills', 'idx_skills_type_order');
        $this->dropIndexIfPossible('certifications', 'idx_cert_issued_at');
        $this->dropIndexIfPossible('committee_activities', 'idx_committee_active_event_order');
        $this->dropIndexIfPossible('automation_strategies', 'idx_auto_active_term_cat_order');
        $this->dropIndexIfPossible('obstacle_challenges', 'idx_obstacle_type_active_order');
        $this->dropIndexIfPossible('job_descriptions', 'idx_job_type_active_order');
        $this->dropIndexIfPossible('organization_structures', 'idx_org_parent_active_order');
        $this->dropIndexIfPossible('business_process_flows', 'idx_bpf_step_order');
    }

    private function addIndexIfPossible(string $table, array $columns, string $indexName): void
    {
        if (!Schema::hasTable($table)) {
            return;
        }

        foreach ($columns as $column) {
            if (!Schema::hasColumn($table, $column)) {
                return;
            }
        }

        try {
            Schema::table($table, function (Blueprint $blueprint) use ($columns, $indexName) {
                $blueprint->index($columns, $indexName);
            });
        } catch (\Throwable $e) {
            // Ignore if index already exists or database does not support this operation.
        }
    }

    private function dropIndexIfPossible(string $table, string $indexName): void
    {
        if (!Schema::hasTable($table)) {
            return;
        }

        try {
            Schema::table($table, function (Blueprint $blueprint) use ($indexName) {
                $blueprint->dropIndex($indexName);
            });
        } catch (\Throwable $e) {
            // Ignore if index does not exist.
        }
    }
};
