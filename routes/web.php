<?php

use App\Http\Controllers\AboutController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\EducationController as AdminEducationController;
use App\Http\Controllers\Admin\ExperienceController as AdminExperienceController;
use App\Http\Controllers\Admin\MessageController;
use App\Http\Controllers\Admin\ProjectController as AdminProjectController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\Admin\TechnologyController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProjectController;
use Illuminate\Support\Facades\Route;

// Public routes
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/projects/{slug}', [ProjectController::class, 'show'])->name('projects.show');

Route::get('/about/download-cv', [AboutController::class, 'downloadCV'])->name('about.download-cv');

Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store')->middleware('throttle:3,1');





// Admin routes
Route::middleware(['auth', 'verified'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    Route::post('/update-sections', [DashboardController::class, 'updateSections'])->name('update-sections');
    Route::post('/update-sidebar-menus', [DashboardController::class, 'updateSidebarMenus'])->name('update-sidebar-menus');
    Route::resource('projects', AdminProjectController::class);
    Route::post('/experiences/generate-description', [AdminExperienceController::class, 'generateDescription'])->name('experiences.generate-description');
    Route::post('/experiences/translate', [AdminExperienceController::class, 'translate'])->name('experiences.translate');
    Route::resource('experiences', AdminExperienceController::class);
    Route::resource('education', AdminEducationController::class);   // Kept AdminEducationController as per original, assuming the snippet was a typo or incomplete
    Route::resource('technologies', TechnologyController::class); // Added this line
    Route::post('/skills/generate-category', [\App\Http\Controllers\Admin\SkillController::class, 'generateCategory'])->name('skills.generate-category');
    Route::post('/skills/translate', [\App\Http\Controllers\Admin\SkillController::class, 'translate'])->name('skills.translate');
    Route::resource('skills', \App\Http\Controllers\Admin\SkillController::class);
    Route::get('/messages', [MessageController::class, 'index'])->name('messages.index');
    Route::get('/messages/{message}', [MessageController::class, 'show'])->name('messages.show');
    Route::patch('/messages/{message}/read', [MessageController::class, 'markAsRead'])->name('messages.read');
    Route::delete('/messages/{message}', [MessageController::class, 'destroy'])->name('messages.destroy');
    Route::get('/settings', [SettingsController::class, 'index'])->name('settings');
    Route::put('/settings', [SettingsController::class, 'update'])->name('settings.update');
    Route::post('/settings/upload-cv', [SettingsController::class, 'uploadCV'])->name('settings.upload-cv');
    Route::post('/settings/upload-photo', [SettingsController::class, 'uploadPhoto'])->name('settings.upload-photo'); 
    Route::post('/settings/upload-favicon', [SettingsController::class, 'uploadFavicon'])->name('settings.upload-favicon');
    
    // Certifications
    Route::post('/certifications/translate', [\App\Http\Controllers\Admin\CertificationController::class, 'translate'])->name('certifications.translate');
    Route::resource('certifications', \App\Http\Controllers\Admin\CertificationController::class);
    
    // Visitor Logs
    Route::get('/visitors', [\App\Http\Controllers\Admin\VisitorController::class, 'index'])->name('visitors.index');
    
    // CV Generator
    Route::get('/cv', [\App\Http\Controllers\Admin\CVController::class, 'index'])->name('cv.index');
    Route::get('/cv/preview', [\App\Http\Controllers\Admin\CVController::class, 'preview'])->name('cv.preview');

    // Company Profile
    Route::get('/company-profile', [\App\Http\Controllers\Admin\CompanyProfileController::class, 'index'])->name('company-profile.index');
    Route::put('/company-profile', [\App\Http\Controllers\Admin\CompanyProfileController::class, 'update'])->name('company-profile.update');

    // Organization Structure
    Route::resource('organization-structure', \App\Http\Controllers\Admin\OrganizationStructureController::class);

    // Committee Activities
    Route::resource('committee-activities', \App\Http\Controllers\Admin\CommitteeActivityController::class);

    // Career Aspiration
    Route::get('/career-aspiration', [\App\Http\Controllers\Admin\CareerAspirationController::class, 'index'])->name('career-aspiration.index');
    Route::put('/career-aspiration', [\App\Http\Controllers\Admin\CareerAspirationController::class, 'update'])->name('career-aspiration.update');

    // Automation Strategies
    Route::resource('automation-strategies', \App\Http\Controllers\Admin\AutomationStrategyController::class);

    // Obstacle & Challenges
    Route::resource('obstacle-challenges', \App\Http\Controllers\Admin\ObstacleChallengeController::class);

    // Job Descriptions & Activities
    Route::resource('job-descriptions', \App\Http\Controllers\Admin\JobDescriptionController::class);

    // Business Process Flows
    Route::resource('business-process-flows', \App\Http\Controllers\Admin\BusinessProcessFlowController::class);
});

// Breeze auth routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
