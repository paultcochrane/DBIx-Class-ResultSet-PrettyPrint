#!perl
use 5.010;
use strict;
use warnings;
use Test::More;
use Module::Load::Conditional qw( can_load );

unless ( $ENV{RELEASE_TESTING} ) {
    plan( skip_all => "Author tests not required for installation" );
}

my $min_tcm = 0.9;
my $tcm_ok = can_load(
    modules => {
        'Test::CheckManifest' => $min_tcm,
    },
    autoload => 1,
);
plan skip_all => "Test::CheckManifest $min_tcm required" unless $tcm_ok;

ok_manifest();
