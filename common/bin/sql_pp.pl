#!/usr/bin/perl -w

use strict;
use SQL::Beautify;

my $sql_query = "";

while (<>) {
    $sql_query .= $_;
}

my $sql = new SQL::Beautify;
$sql->query($sql_query);
my $nice_sql = $sql->beautify;

print $nice_sql;
