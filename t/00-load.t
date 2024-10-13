#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'DBIx::Class::ResultSet::PrettyPrint' ) || print "Bail out!\n";
}

diag( "Testing DBIx::Class::ResultSet::PrettyPrint $DBIx::Class::ResultSet::PrettyPrint::VERSION, Perl $], $^X" );
