<>;
$_ = join "", <>;
sub z {
    ($i, $w) = @_;
    @matches = split /\|/, substr($w, 1, -1), -1;
    return $matches[$i % ~~@matches];
}
s/\(.+?\)/z($c++,$&)/ges;
print
