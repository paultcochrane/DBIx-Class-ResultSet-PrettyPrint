#!perl
use 5.010;
use strict;
use warnings;
use Test::More import => [ qw( plan ) ];
use Module::Load::Conditional qw( can_load );

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "Author tests not required for installation" );
}

# Ensure a recent version of Test::Pod
my $min_tp = 1.22;
my $tp_ok = can_load(
    modules => {
        'Test::Pod' => $min_tp,
    },
    autoload => 1,
);

if (!$tp_ok) {
    plan skip_all => "Test::Pod $min_tp required for testing POD";
}

all_pod_files_ok();
