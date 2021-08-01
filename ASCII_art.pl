use feature 'say';
$l = <>;
$h = <>;
chomp($t = lc <>);
@a = <>;

for (@a) {
  say $t =~ s/./$& =~ m#[a-z]# ? substr($_, $l * (ord($&) - ord('a')), $l) : substr($_, 26 * $l, $l)/ger;
}
