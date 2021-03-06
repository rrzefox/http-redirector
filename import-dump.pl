#!/usr/bin/perl -w

use strict;
use warnings;
use Getopt::Long;

use lib '.';
use Mirror::DB;

my $db_output = 'db';
my $file = undef;

GetOptions('db-output=s' => \$db_output,
	    'dump-file=s' => \$file) or exit 1;

$file = $db_output.'.dump' if (!defined($file));

our $VAR1;

die ("failed to import '$file'") unless (do $file);

Mirror::DB::set($db_output);
Mirror::DB::store($VAR1);
