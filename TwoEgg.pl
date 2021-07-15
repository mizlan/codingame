use strict;
use warnings;
use 5.32.1;
use feature 'say';

chomp(my $n = <STDIN>);

my $z = 0;
while ($n > 0) {
    $n -= ++$z;
}
say $z;
