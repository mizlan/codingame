$r = <>;
$l = <>;
sub display {
    $w = shift;
    @a = $w =~ /(\S+)/g;
    return sprintf "%d %d ", scalar @a, $a[0];
}
for (1..$l-1) {
    $r =~ s/(\S+)(\s*\1)*/display$&/ge;
}
print $r =~ s/\s+/ /gr =~ s/ +$//r;
