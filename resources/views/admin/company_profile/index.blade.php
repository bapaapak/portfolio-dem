@extends('admin.layouts.app')

@section('title', 'Company Profile')

@section('content')
<div class="header-section">
    <h1>Company Profile</h1>
    <p>Manage company details and appearance.</p>
</div>

<div class="content-card">
    <form action="{{ route('admin.company-profile.update') }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        {{-- Basic Information --}}
        <div class="form-section mb-6">
            <h3 class="text-lg font-semibold mb-4 border-b pb-2">Basic Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="form-group">
                    <label>Company Name</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $profile->name) }}">
                </div>
                <div class="form-group">
                    <label>Company Logo</label>
                     @if($profile->logo)
                        <div class="mb-2">
                            <img src="{{ asset('storage/' . $profile->logo) }}" class="h-10 object-contain">
                        </div>
                    @endif
                    <input type="file" name="logo" class="form-control">
                </div>
                <div class="form-group">
                    <label>Slogan</label>
                    <input type="text" name="slogan" class="form-control" value="{{ old('slogan', $profile->slogan) }}">
                </div>
                <div class="form-group md:col-span-2">
                    <label>Description (History)</label>
                    <textarea name="description" class="form-control" rows="4">{{ old('description', $profile->description) }}</textarea>
                </div>
            </div>
        </div>

        {{-- Plants --}}
        <div class="form-section mb-6">
            <h3 class="text-lg font-semibold mb-4 border-b pb-2">Plants</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="border p-4 rounded">
                    <h4 class="font-medium mb-3">Plant 1 (Cikarang)</h4>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="plant_1_name" class="form-control" value="{{ old('plant_1_name', $profile->plant_1_name) }}">
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        @if($profile->plant_1_image)
                            <div class="mb-2">
                                <img src="{{ asset('storage/' . $profile->plant_1_image) }}" class="h-20 rounded">
                            </div>
                        @endif
                        <input type="file" name="plant_1_image" class="form-control">
                    </div>
                </div>
                <div class="border p-4 rounded">
                    <h4 class="font-medium mb-3">Plant 2 (Cirebon)</h4>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="plant_2_name" class="form-control" value="{{ old('plant_2_name', $profile->plant_2_name) }}">
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        @if($profile->plant_2_image)
                            <div class="mb-2">
                                <img src="{{ asset('storage/' . $profile->plant_2_image) }}" class="h-20 rounded">
                            </div>
                        @endif
                        <input type="file" name="plant_2_image" class="form-control">
                    </div>
                </div>
            </div>
        </div>

        {{-- Employees Stats --}}
        <div class="form-section mb-6">
            <h3 class="text-lg font-semibold mb-4 border-b pb-2">Employees Statistics</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="form-group">
                    <label>Employees (Cikarang)</label>
                    <input type="number" name="employees_cikarang" class="form-control" value="{{ old('employees_cikarang', $profile->employees_cikarang) }}">
                </div>
                <div class="form-group">
                    <label>Employees (Cirebon)</label>
                    <input type="number" name="employees_cirebon" class="form-control" value="{{ old('employees_cirebon', $profile->employees_cirebon) }}">
                </div>
            </div>
        </div>

        {{-- Business Models --}}
        <div class="form-section mb-6" x-data="{ items: {{ json_encode($profile->business_models ?? []) }} }">
            <h3 class="text-lg font-semibold mb-4 border-b pb-2">Business Models</h3>
            <div class="form-group mb-4">
                <label>Section Title</label>
                <input type="text" name="business_model_title" class="form-control" value="{{ old('business_model_title', $profile->business_model_title) }}">
            </div>
            
            <div class="space-y-4">
                <template x-for="(item, index) in items" :key="index">
                    <div class="border p-4 rounded flex gap-4 items-start bg-gray-50">
                        <div class="flex-1 grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" :name="'business_models[' + index + '][title]'" x-model="item.title" class="form-control" placeholder="e.g. Wiring Harness">
                            </div>
                            <div class="form-group">
                                <label>Description/Products (comma separated or text)</label>
                                <input type="text" :name="'business_models[' + index + '][description]'" x-model="item.description" class="form-control" placeholder="Product details">
                            </div>
                             <div class="form-group col-span-1 md:col-span-2">
                                <label>Image</label>
                                <div class="flex items-center gap-4">
                                    <template x-if="item.image">
                                        <img :src="'/storage/' + item.image" class="h-16 w-16 object-cover rounded border">
                                    </template>
                                    <input type="file" :name="'business_models[' + index + '][image]'" class="form-control flex-1">
                                    <input type="hidden" :name="'business_models[' + index + '][existing_image]'" :value="item.image">
                                </div>
                            </div>
                        </div>
                        <button type="button" @click="items = items.filter((_, i) => i !== index)" class="text-red-500 hover:text-red-700 mt-8">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </template>
            </div>
            <button type="button" @click="items.push({title: '', description: ''})" class="mt-4 px-4 py-2 bg-blue-50 text-blue-600 rounded hover:bg-blue-100">
                <i class="fas fa-plus mr-1"></i> Add Business Model
            </button>
        </div>

        {{-- Directors & Misc --}}
        <div class="form-section mb-6">
            <h3 class="text-lg font-semibold mb-4 border-b pb-2">Management & Others</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="border p-4 rounded">
                    <h4 class="font-medium mb-3">Director</h4>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="director_name" class="form-control" value="{{ old('director_name', $profile->director_name) }}">
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" name="director_title" class="form-control" value="{{ old('director_title', $profile->director_title) }}">
                    </div>
                    <div class="form-group">
                        <label>Photo</label>
                        @if($profile->director_image)
                            <div class="mb-2">
                                <img src="{{ asset('storage/' . $profile->director_image) }}" class="h-20 rounded">
                            </div>
                        @endif
                        <input type="file" name="director_image" class="form-control">
                    </div>
                </div>
                <div class="border p-4 rounded">
                    <h4 class="font-medium mb-3">Triputra DNA</h4>
                    <div class="form-group">
                        <label>Image (Top Right)</label>
                        @if($profile->triputra_dna_image)
                            <div class="mb-2">
                                <img src="{{ asset('storage/' . $profile->triputra_dna_image) }}" class="h-20 rounded">
                            </div>
                        @endif
                        <input type="file" name="triputra_dna_image" class="form-control">
                    </div>
                </div>
                
                <div class="form-group md:col-span-2 mt-4">
                    <label>Footer Quote/Text</label>
                    <input type="text" name="footer_text" class="form-control" value="{{ old('footer_text', $profile->footer_text) }}" placeholder="Knowledge & Technology Transformation for Employee Engagement">
                </div>
            </div>
        </div>

        <div class="form-actions mt-8">
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
    </form>
</div>
@endsection
