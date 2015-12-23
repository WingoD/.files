#!/usr/bin/env perl

my %time;
my %count;

while(<>)
{
  my ($prefix, $time, $query) = split(/	/);
  if (!exists $results{$query})
  {
    $time{$query} = 0.0;
    $count{$query} = 0;
  }
  $time{$query} += $time;
  $count{$query}++;
}

foreach my $key (keys(%count))
{
  print "$key: ($count{$key}): $time{$key}";
}
