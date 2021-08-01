use feature 'say';

chomp($n = <>);

for $i (1..length($n) - 1) {
  if (substr($n, $i - 1, 1) > substr($n, $i, 1)) {
    $f = true;
    last;
  }
}

if (!$f) {
  $n++;
  if (substr($n, length($n) - 1, 1) != 0) {
    say $n;
    exit;
  }
}

$k = length($n) - 1;
for $i (1..length($n) - 1) {
  if (substr($n, $i - 1, 1) > substr($n, $i, 1)) {
    $k = $i;
    last;
  }
}

say substr($n, 0, $k) . substr($n, $k - 1, 1) x (length($n) - $k)
