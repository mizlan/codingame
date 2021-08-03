use strict;
use warnings;
use diagnostics;
use 5.32.1;
use List::Util qw(max min);

select(STDOUT); $| = 1;

chomp(my $n = <STDIN>);
chomp(my $c = <STDIN>);

my @a = <>;
chomp @a;
@a = sort { $a <=> $b } @a;

my @res;
my $ppl_left = $n;
for my $p (@a) {
    my $expected = int($c / $ppl_left);
    my $m = min($expected, $p);
    push @res, $m;
    $c -= $m;
    $ppl_left--;
}

if ($c <= 0) {
    print join"\n",@res;
} else {
    print "IMPOSSIBLE"
}
