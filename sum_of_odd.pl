use strict;
use warnings;
use feature 'say';

my $n = <>;
my $ways = 0;
my @ans;

for my $num_values (2..80000) {
  # = 0 2 4 6 8 10
  # = 0 1 2 3 4 5   $ * 2
  my $extra = ($num_values - 1) * $num_values;
  my $rem = $n - $extra;
  if ($rem <= 0) {
    last;
  }
  my $start_num = $rem / $num_values;
  if ($rem % $num_values == 0 and $start_num % 2 == 1) {
    $ways++;
    @ans = ($start_num, $start_num + ($num_values * 2) - 2);
  }
}

say $ways;
say join(" ", @ans) if $ways;
