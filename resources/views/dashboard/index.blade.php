@extends('layouts.app')

@php
    // Helper function to format currency with jt (million) and M (billion)
    function formatRupiahDashboard($amount)
    {
        if ($amount >= 1000000000) {
            // Billions - use M (Milyar)
            return 'Rp ' . number_format($amount / 1000000000, 1, ',', '.') . ' M';
        } elseif ($amount >= 1000000) {
            // Millions - use jt (juta)
            return 'Rp ' . number_format($amount / 1000000, 1, ',', '.') . ' jt';
        } else {
            // Below million - show full number
            return 'Rp ' . number_format($amount, 0, ',', '.');
        }
    }
@endphp

@section('content')
    <div class="mb-4">
        <h4 class="fw-bold mb-1">Dashboard Overview</h4>
        <p class="text-muted mb-0 small">Financial Summary & Operational Status</p>
    </div>

    <!-- Top Stats Cards -->
    <div class="row g-4 mb-4">
        <!-- Total Budget Plan -->
        <div class="col-md-4">
            <div class="card border-0 h-100 shadow-sm rounded-4" style="background: linear-gradient(135deg, #1e3a5f 0%, #0f172a 100%); transition: transform 0.2s;">
                <div class="card-body text-white d-flex justify-content-between align-items-start p-4">
                    <div>
                        <p class="mb-2 opacity-75 small fw-bold text-uppercase ls-1">Total Budget Plan</p>
                        <h2 class="fw-bold mb-1">{{ formatRupiahDashboard($totalBudget) }}</h2>
                        <div class="d-flex align-items-center mt-2">
                            <span class="badge bg-white bg-opacity-10 rounded-pill fw-normal px-2 py-1" style="font-size: 0.7rem;">
                                <i class="fas fa-check-circle me-1"></i>Approved
                            </span>
                        </div>
                    </div>
                    <div class="rounded-circle p-3 d-flex align-items-center justify-content-center" style="background: rgba(255,255,255,0.1); width: 50px; height: 50px;">
                        <i class="fas fa-coins fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Total Realization -->
        <div class="col-md-4">
            <div class="card border-0 h-100 shadow-sm rounded-4" style="background: linear-gradient(135deg, #0d9488 0%, #134e4a 100%); transition: transform 0.2s;">
                <div class="card-body text-white d-flex justify-content-between align-items-start p-4">
                    <div>
                        <p class="mb-2 opacity-75 small fw-bold text-uppercase ls-1">Total PR Usage</p>
                        <h2 class="fw-bold mb-1">{{ formatRupiahDashboard($totalRealization) }}</h2>
                        <div class="d-flex align-items-center mt-2">
                             <span class="badge bg-white bg-opacity-10 rounded-pill fw-normal px-2 py-1" style="font-size: 0.7rem;">
                                <i class="fas fa-chart-line me-1"></i>YTD
                            </span>
                        </div>
                    </div>
                    <div class="rounded-circle p-3 d-flex align-items-center justify-content-center" style="background: rgba(255,255,255,0.1); width: 50px; height: 50px;">
                        <i class="fas fa-file-invoice fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Remaining Balance -->
        <div class="col-md-4">
            <div class="card border-0 h-100 shadow-sm rounded-4 bg-white" style="transition: transform 0.2s;">
                <div class="card-body d-flex justify-content-between align-items-start p-4">
                    <div>
                        <p class="mb-2 text-muted small fw-bold text-uppercase ls-1">Remaining Balance</p>
                        <h2 class="fw-bold mb-1 text-dark">{{ formatRupiahDashboard($remainingBalance) }}</h2>
                        <div class="d-flex align-items-center mt-2">
                            <span class="badge bg-light text-muted border rounded-pill fw-normal px-2 py-1" style="font-size: 0.7rem;">
                                Available
                            </span>
                        </div>
                    </div>
                    <div class="rounded-circle p-3 d-flex align-items-center justify-content-center bg-light" style="width: 50px; height: 50px;">
                        <i class="fas fa-wallet fa-lg text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart + Top Projects -->
    <div class="row g-4 mb-4">
        <!-- Budget vs Realization Chart -->
        <div class="col-lg-7">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center py-3">
                    <div>
                        <h6 class="fw-bold mb-0">Budget vs Realization</h6>
                        <small class="text-muted">Comparison by Business Category</small>
                    </div>
                    <select class="form-select form-select-sm" style="width: auto;">
                        <option>FY 2025</option>
                        <option>FY 2024</option>
                    </select>
                </div>
                <div class="card-body">
                    <div style="height: 250px; position: relative;">
                        <canvas id="budgetChart"></canvas>
                    </div>
                    <div class="d-flex justify-content-center gap-4 mt-3">
                        <span><i class="fas fa-square text-primary me-1"></i> Budget Plan</span>
                        <span><i class="fas fa-square text-info me-1"></i> Realized</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Projects -->
        <div class="col-lg-5">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white border-0 py-3">
                    <h6 class="fw-bold mb-0">Top Projects</h6>
                    <small class="text-muted">Highest budget allocation</small>
                </div>
                <div class="card-body p-0">
                    @forelse($topProjects as $project)
                        <div class="d-flex justify-content-between align-items-center px-4 py-3 border-bottom">
                            <div>
                                <div class="fw-semibold">{{ $project->project_name }}</div>
                                @php
                                    // Use budget_status if available, otherwise project status (or default Active)
                                    $pStatus = $project->budget_status ?? $project->status ?? 'Active';

                                    $badgeClass = match ($pStatus) {
                                        'Approved' => 'bg-success',
                                        'Rejected' => 'bg-danger',
                                        'Submitted' => 'bg-warning',
                                        'Draft' => 'bg-secondary',
                                        'Completed' => 'bg-dark',
                                        default => 'bg-primary'
                                    };
                                @endphp
                                <span class="badge {{ $badgeClass }} text-white"
                                    style="padding: 0.35rem 0.75rem; border-radius: 6px; font-weight: 500; font-size: 0.7rem;">
                                    {{ $pStatus }}
                                </span>
                            </div>
                            <div class="text-end">
                                @php
                                    $budget = $project->total_budget ?? 0;
                                    $realization = $project->total_realization ?? 0;
                                    $percentage = $budget > 0 ? ($realization / $budget) * 100 : 0;
                                    $realizationColor = 'success'; // green default
                                    if ($percentage >= 90) {
                                        $realizationColor = 'danger'; // red
                                    } elseif ($percentage >= 80) {
                                        $realizationColor = 'warning'; // yellow
                                    }
                                @endphp
                                <div class="text-muted small">Rp {{ number_format($budget, 0, ',', '.') }}</div>
                                <div class="text-{{ $realizationColor }} small">Rp
                                    {{ number_format($realization, 0, ',', '.') }}</div>
                            </div>
                        </div>
                    @empty
                        <div class="text-center py-4 text-muted">
                            <i class="fas fa-folder-open fa-2x mb-2 opacity-50"></i>
                            <p class="mb-0">No projects found</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>

    <!-- PR Status Cards -->
    <div class="row g-4">
        <!-- PR Approved -->
        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-grow-1">
                        <p class="text-muted small mb-1">PR Approved</p>
                        <h3 class="fw-bold mb-0">{{ $prApproved }}</h3>
                        <small class="text-muted">Ready for PO</small>
                    </div>
                    <div class="rounded-circle p-3 bg-success bg-opacity-10">
                        <i class="fas fa-check-circle text-success fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- PR Completed -->
        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-grow-1">
                        <p class="text-muted small mb-1">PR Completed</p>
                        <h3 class="fw-bold mb-0">{{ $prCompleted }}</h3>
                        <small class="text-muted">Closed / Finished</small>
                    </div>
                    <div class="rounded-circle p-3 bg-secondary bg-opacity-10">
                        <i class="fas fa-clipboard-check text-secondary fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- PR Draft -->
        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-grow-1">
                        <p class="text-muted small mb-1">PR Draft</p>
                        <h3 class="fw-bold mb-0">{{ $prDraft }}</h3>
                        <small class="text-muted">Not Submitted</small>
                    </div>
                    <div class="rounded-circle p-3 bg-info bg-opacity-10">
                        <i class="fas fa-edit text-info fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- PR On Progress -->
        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-grow-1">
                        <p class="text-muted small mb-1">PR On Progress</p>
                        <h3 class="fw-bold mb-0">{{ $prOnProgress }}</h3>
                        <small class="text-muted">In Approval Process</small>
                    </div>
                    <div class="rounded-circle p-3 bg-warning bg-opacity-10">
                        <i class="fas fa-spinner text-warning fa-lg"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('budgetChart').getContext('2d');

            const labels = {!! json_encode($chartData['labels']) !!};
            const budgetData = {!! json_encode($chartData['budget']) !!};
            const realizedData = {!! json_encode($chartData['realized']) !!};

            // Ensure we have at least some labels
            if (labels.length === 0) {
                labels.push('No Data');
                budgetData.push(0);
                realizedData.push(0);
            }

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Budget Plan',
                            data: budgetData,
                            backgroundColor: '#3b82f6',
                            borderRadius: 4,
                            maxBarThickness: 50,
                        },
                        {
                            label: 'Realized',
                            data: realizedData,
                            backgroundColor: '#06b6d4',
                            borderRadius: 4,
                            maxBarThickness: 50,
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function (value) {
                                    if (value >= 1000000000) {
                                        return (value / 1000000000).toFixed(1) + 'M';
                                    } else if (value >= 1000000) {
                                        return (value / 1000000).toFixed(0) + 'jt';
                                    }
                                    return value;
                                }
                            },
                            grid: { color: '#f1f5f9' }
                        },
                        x: {
                            grid: { display: false }
                        }
                    }
                }
            });
        });
    </script>
@endpush