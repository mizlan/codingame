import numpy as np

p = ['Rabbits', 'Chickens', 'Cows', 'Pegasi', 'Demons']

d = {
    #         R  H  C  P  D
    'Heads': [1, 1, 1, 1, 1],
    'Horns': [0, 0, 2, 0, 4],
    'Legs':  [4, 2, 4, 4, 4],
    'Wings': [0, 2, 0, 2, 2],
    'Eyes':  [2, 2, 2, 2, 4]
}

n = int(input())

in_use = [p.index(species) for species in input().split()]

r = dict(input().split() for _ in range(n))
r = {k: int(v) for k, v in r.items()}
f = np.array([v for k, v in r.items()])

full = np.array([np.array(d[part])[in_use] for part in r])

ans = np.linalg.solve(full, f)
for i, a in enumerate(ans):
    a = int(a)
    print(p[in_use[i]], a)
