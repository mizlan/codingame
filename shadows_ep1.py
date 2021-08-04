import sys
import math

def debug(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
w, h = [int(i) for i in input().split()]
n = int(input())  # maximum number of turns before game over.
x0, y0 = [int(i) for i in input().split()]

# all inclusive
Bx1 = 0
By1 = 0
Bx2 = w - 1
By2 = h - 1

debug(Bx1, By1, Bx2, By2)

# game loop
while True:
    bomb_dir = input()  # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    if bomb_dir == 'U':
        Bx1 = Bx2 = x0
        debug('triggered U')
    elif bomb_dir == 'D':
        Bx1 = Bx2 = x0
        debug('triggered D')
    elif bomb_dir == 'L':
        By1 = By2 = y0
        debug('triggered L')
    elif bomb_dir == 'R':
        By1 = By2 = y0
        debug('triggered R')

    if 'U' in bomb_dir:
        By2 = min(By2, y0-1)
    if 'D' in bomb_dir:
        By1 = max(By1, y0+1)
    if 'L' in bomb_dir:
        Bx2 = min(Bx1, x0-1)
    if 'R' in bomb_dir:
        Bx1 = max(Bx2, x0+1)

    x0 = (Bx1 + Bx2) // 2
    y0 = (By1 + By2) // 2

    debug(Bx1, By1, Bx2, By2, bomb_dir, x0, y0)

    print(x0, y0)
