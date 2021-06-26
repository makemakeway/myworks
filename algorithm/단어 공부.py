lst = [0] * 26
alpha1 = "abcdefghijklmnopqrstuvwxyz"
alpha2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
s = input()

for c in s:
    if c in alpha1:
        i = alpha1.index(c)
        print(i)
        lst[i] += 1
    elif c in alpha2 :
        i = alpha2.index(c)
        lst[i] += 1


if lst.count(max(lst)) >= 2:
    print("?")
else:
    print(alpha2[lst.index(max(lst))])