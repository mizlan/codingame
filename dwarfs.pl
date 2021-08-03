use Data::Dumper;

use List::Util qw(max);

use strict;
use warnings;
#use diagnostics;
use 5.32.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

my $tokens;
my %outs;
my %indegree;
my @q;
my %nodes;

chomp(my $n = <STDIN>);
for my $i (0..$n-1) {
  chomp($tokens=<STDIN>);
  my ($x, $y) = split(/ /,$tokens);
  $indegree{$y}++;
  $nodes{$x} = 1;
  $nodes{$y} = 1;
  push @{$outs{$x}}, $y;
}
for (keys %nodes) {
  $indegree{$_} = 0 if !exists($indegree{$_});
}
my %maxlen;
for my $i (keys %nodes) {
  $maxlen{$i} = 1;
  if ($indegree{$i} == 0) {
    push @q, $i;
  }
}
while (@q) {
  my $nx = shift @q;
  for my $o (@{$outs{$nx}}) {
    my $thisd = $maxlen{$nx} + 1;
    # print "going to $o",$/;
    $maxlen{$o} = $thisd if $thisd > $maxlen{$o};
    $indegree{$o}--;
    if ($indegree{$o} == 0) {
      push @q, $o;
    }
  }
}

print max(values %maxlen);
