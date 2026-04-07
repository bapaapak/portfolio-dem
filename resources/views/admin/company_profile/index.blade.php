@extends('admin.layouts.app')

@section('title', 'Company Profile')

@section('content')
<div class="page-header">
    <h1><i class="fas fa-building mr-2"></i>Company Profile</h1>
    <p>Manage company details and appearance.</p>
</div>

@if(session('success'))
    <div class="alert-success">
        <i class="fas fa-check-circle mr-2"></i>{{ session('success') }}
    </div>
@endif

<form action="{{ route('admin.company-profile.update') }}" method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')

    {{-- Basic Information --}}
    <div class="form-card">
        <div class="form-section">
            <h3><i class="fas fa-info-circle mr-2"></i>Basic Information</h3>
            <div class="form-row">
                <div class="form-group">
                    <label>Company Name</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $profile->name) }}">
                </div>
                <div class="form-group">
                    <label>Slogan</label>
                    <input type="text" name="slogan" class="form-control" value="{{ old('slogan', $profile->slogan) }}">
                </div>
            </div>
            <div class="form-group">
                <label>Company Logo</label>
                @if($profile->logo_data || $profile->logo)
                    <div class="mb-3 p-3 rounded" style="background: var(--bg-primary); display: inline-block;">
                        @if($profile->logo_data)
                            <img src="{{ $profile->logo_data }}" style="height: 48px;" class="object-contain" alt="Company Logo">
                        @elseif($profile->logo)
                            <img src="/media/{{ $profile->logo }}" style="height: 48px;" class="object-contain" alt="Company Logo" onerror="this.parentElement.style.display='none'">
                        @endif
                    </div>
                @endif
                <input type="file" name="logo" class="form-control" accept="image/*">
                <span class="form-help">Recommended: PNG or SVG, max 2MB</span>
            </div>
            <div class="form-group">
                <label>Description (History)</label>
                <textarea name="description" class="form-control" rows="4">{{ old('description', $profile->description) }}</textarea>
            </div>
        </div>
    </div>

    {{-- Plants --}}
    <div class="form-card">
        <div class="form-section">
            <h3><i class="fas fa-industry mr-2"></i>Plants</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                {{-- Plant 1 --}}
                <div class="p-4 rounded-lg" style="background: var(--bg-primary); border: 1px solid var(--border-color);">
                    <h4 class="font-medium mb-4 flex items-center gap-2">
                        <span class="inline-flex items-center justify-center w-6 h-6 rounded-full text-xs font-bold" style="background: var(--primary); color: var(--bg-primary);">1</span>
                        Plant Cikarang
                    </h4>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="plant_1_name" class="form-control" value="{{ old('plant_1_name', $profile->plant_1_name) }}">
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        @if($profile->plant_1_image_data || $profile->plant_1_image)
                            <div class="mb-2">
                                @if($profile->plant_1_image_data)
                                    <img src="{{ $profile->plant_1_image_data }}" class="w-full h-32 object-cover rounded" alt="Plant 1">
                                @elseif($profile->plant_1_image)
                                    <img src="/media/{{ $profile->plant_1_image }}" class="w-full h-32 object-cover rounded" alt="Plant 1" onerror="this.style.display='none'">
                                @endif
                            </div>
                        @endif
                        <input type="file" name="plant_1_image" class="form-control" accept="image/*">
                    </div>
                </div>
                {{-- Plant 2 --}}
                <div class="p-4 rounded-lg" style="background: var(--bg-primary); border: 1px solid var(--border-color);">
                    <h4 class="font-medium mb-4 flex items-center gap-2">
                        <span class="inline-flex items-center justify-center w-6 h-6 rounded-full text-xs font-bold" style="background: var(--primary); color: var(--bg-primary);">2</span>
                        Plant Cirebon
                    </h4>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="plant_2_name" class="form-control" value="{{ old('plant_2_name', $profile->plant_2_name) }}">
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        @if($profile->plant_2_image_data || $profile->plant_2_image)
                            <div class="mb-2">
                                @if($profile->plant_2_image_data)
                                    <img src="{{ $profile->plant_2_image_data }}" class="w-full h-32 object-cover rounded" alt="Plant 2">
                                @elseif($profile->plant_2_image)
                                    <img src="/media/{{ $profile->plant_2_image }}" class="w-full h-32 object-cover rounded" alt="Plant 2" onerror="this.style.display='none'">
                                @endif
                            </div>
                        @endif
                        <input type="file" name="plant_2_image" class="form-control" accept="image/*">
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Employees Stats --}}
    <div class="form-card">
        <div class="form-section">
            <h3><i class="fas fa-users mr-2"></i>Employees Statistics</h3>
            <div class="form-row">
                <div class="form-group">
                    <label>Employees (Cikarang)</label>
                    <input type="number" name="employees_cikarang" class="form-control" value="{{ old('employees_cikarang', $profile->employees_cikarang) }}" min="0">
                </div>
                <div class="form-group">
                    <label>Employees (Cirebon)</label>
                    <input type="number" name="employees_cirebon" class="form-control" value="{{ old('employees_cirebon', $profile->employees_cirebon) }}" min="0">
                </div>
            </div>
        </div>
    </div>

    {{-- Business Models --}}
    <div class="form-card" x-data="{ items: {{ json_encode($profile->business_models ?? []) }} }">
        <div class="form-section">
            <h3><i class="fas fa-cubes mr-2"></i>Business Models</h3>
            <div class="form-group">
                <label>Section Title</label>
                <input type="text" name="business_model_title" class="form-control" value="{{ old('business_model_title', $profile->business_model_title) }}">
            </div>

            <div class="space-y-4 mt-4">
                <template x-for="(item, index) in items" :key="index">
                    <div class="p-4 rounded-lg relative" style="background: var(--bg-primary); border: 1px solid var(--border-color);">
                        <button type="button" @click="items = items.filter((_, i) => i !== index)" class="absolute top-3 right-3 btn-icon btn-sm" style="color: var(--danger);" title="Remove">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 pr-8">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" :name="'business_models[' + index + '][title]'" x-model="item.title" class="form-control" placeholder="e.g. Wiring Harness">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" :name="'business_models[' + index + '][description]'" x-model="item.description" class="form-control" placeholder="Product details">
                            </div>
                            <div class="form-group md:col-span-2">
                                <label>Image</label>
                                <div class="flex items-center gap-4">
                                    <template x-if="item.image_data || item.image">
                                        <img :src="item.image_data ? item.image_data : (item.image && item.image.startsWith('data:') ? item.image : '/media/' + item.image)" class="h-16 w-16 object-cover rounded" style="border: 1px solid var(--border-color);" alt="Business Model">
                                    </template>
                                    <div class="flex-1">
                                        <input type="file" :name="'business_models[' + index + '][image]'" class="form-control" accept="image/*">
                                    </div>
                                    <input type="hidden" :name="'business_models[' + index + '][existing_image]'" :value="item.image">
                                    <input type="hidden" :name="'business_models[' + index + '][existing_image_data]'" :value="item.image_data">
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
            </div>
            <button type="button" @click="items.push({title: '', description: '', image: '', image_data: ''})" class="btn btn-outline mt-4">
                <i class="fas fa-plus mr-1"></i> Add Business Model
            </button>
        </div>
    </div>

    {{-- Director --}}
    <div class="form-card">
        <div class="form-section">
            <h3><i class="fas fa-user-tie mr-2"></i>Director</h3>
            <div class="form-row">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="director_name" class="form-control" value="{{ old('director_name', $profile->director_name) }}">
                </div>
                <div class="form-group">
                    <label>Title</label>
                    <input type="text" name="director_title" class="form-control" value="{{ old('director_title', $profile->director_title) }}">
                </div>
            </div>
            <div class="form-group">
                <label>Photo</label>
                @if($profile->director_image_data || $profile->director_image)
                    <div class="mb-2">
                        @if($profile->director_image_data)
                            <img src="{{ $profile->director_image_data }}" class="h-24 w-24 object-cover rounded-full" style="border: 2px solid var(--border-color);" alt="Director">
                        @elseif($profile->director_image)
                            <img src="/media/{{ $profile->director_image }}" class="h-24 w-24 object-cover rounded-full" style="border: 2px solid var(--border-color);" alt="Director" onerror="this.style.display='none'">
                        @endif
                    </div>
                @endif
                <input type="file" name="director_image" class="form-control" accept="image/*">
            </div>
        </div>
    </div>

    {{-- Triputra DNA & Footer --}}
    <div class="form-card">
        <div class="form-section">
            <h3><i class="fas fa-dna mr-2"></i>Triputra DNA & Footer</h3>
            <div class="form-group">
                <label>Triputra DNA Image</label>
                @if($profile->triputra_dna_image_data || $profile->triputra_dna_image)
                    <div class="mb-2">
                        @if($profile->triputra_dna_image_data)
                            <img src="{{ $profile->triputra_dna_image_data }}" class="h-20 rounded" alt="Triputra DNA">
                        @elseif($profile->triputra_dna_image)
                            <img src="/media/{{ $profile->triputra_dna_image }}" class="h-20 rounded" alt="Triputra DNA" onerror="this.style.display='none'">
                        @endif
                    </div>
                @endif
                <input type="file" name="triputra_dna_image" class="form-control" accept="image/*">
                <span class="form-help">Displayed at top-right of the company profile section</span>
            </div>
            <div class="form-group">
                <label>Footer Quote/Text</label>
                <input type="text" name="footer_text" class="form-control" value="{{ old('footer_text', $profile->footer_text) }}" placeholder="Knowledge & Technology Transformation for Employee Engagement">
            </div>
        </div>
    </div>

    {{-- Save --}}
    <div class="form-card">
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save mr-2"></i>Save Changes
            </button>
        </div>
    </div>
</form>
@endsection
