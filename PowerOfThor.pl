use strict;
use warnings;
#use diagnostics;
use 5.32.1;

select(STDOUT); $| = 1; # DO NOT REMOVE

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

my $tokens;

# light_x: the X position of the light of power
# light_y: the Y position of the light of power
# initial_tx: Thor's starting X position
# initial_ty: Thor's starting Y position
chomp($tokens=<STDIN>);
my ($light_x, $light_y, $initial_tx, $initial_ty) = split(/ /,$tokens);

# game loop
while (1) {
    chomp(my $remaining_turns = <STDIN>); # The remaining amount of turns Thor can move. Do not remove this line.
    
    # Write an action using print
    # To debug: print STDERR "Debug messages...\n";
    my $d = '';
    if ($initial_ty < $light_y) {
        $initial_ty += 1;
        $d .= 'S';
    } elsif ($initial_ty > $light_y) {
        $initial_ty -= 1;
        $d .= 'N';
    }
    if ($initial_tx < $light_x) {
        $initial_tx += 1;
        $d .= 'E';
    } elsif ($initial_tx > $light_x) {
        $initial_tx -= 1;
        $d .= 'W';
    }
    # A single line providing the move to be made: N NE E SE S SW W or NW

    print $d, "\n";
}
