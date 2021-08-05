$b = <>;
while ($b =~ /(?=(1*01*))/g) {
    $l = length $1;
    $\ = $l if $l > $\;
}
print
