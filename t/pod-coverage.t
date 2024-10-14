#!perl
use 5.010;
use strict;
use warnings;
use Test::More;
use Module::Load::Conditional qw( can_load );

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "Author tests not required for installation" );
}

# Ensure a recent version of Test::Pod::Coverage
my $min_tpc = 1.08;
my $tpc_ok = can_load(
    modules => {
        'Test::Pod::Coverage' => $min_tpc,
    },
    autoload => 1,
);
plan skip_all => "Test::Pod::Coverage $min_tpc required for testing POD coverage"
    unless $tpc_ok;

# Test::Pod::Coverage doesn't require a minimum Pod::Coverage version,
# but older versions don't recognize some common documentation styles
my $min_pc = 0.18;
my $pc_ok = can_load(
    modules => {
        'Pod::Coverage' => $min_pc,
    },
    autoload => 1,
);
plan skip_all => "Pod::Coverage $min_pc required for testing POD coverage"
    unless $pc_ok;

all_pod_coverage_ok();
