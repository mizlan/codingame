import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

m = int(input())
n = int(input())
a = [*filter(lambda b: b <= m, map(int, input().split()))]
n = len(a)

dp = [[-1] * (m + 1)]
dp[0][0] = 0
# dp[i][j] = last bar for j using first i bars

for i in range(n):
    bar = a[i]
    row = list(dp[-1])
    for l in range(bar, m + 1):
        if dp[-1][l - bar] != -1:
            row[l] = i
    dp.append(row)

ans = []
for l in range(m, -1, -1):
    if dp[-1][l] != -1:
        g = l
        break

i = -1
while g != 0:
    i = dp[i][g]
    b = a[i]
    g -= b
    ans.append(b)

print(*ans[::-1])
