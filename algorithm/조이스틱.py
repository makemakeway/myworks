def solution(name):
    count = 0
    leng = len(name)
    default = "A" * leng
    for d, n in zip(default, name): #수직 이동방향을 정하는 부분
        if d != n:
            if ord(n) - ord(d) >= 14: #반대방향으로 이동하는 조건
                count = count + ord('Z') - ord(n) + 1
            else:
                count = count + ord(n) - ord(d)
    right = 1
    left = 1
    for i in range(leng):
        if name[0 - i] == 'A':
            left += 1
        else:
            break
    for i in range(leng):
        if name[0 + i] == 'A':
            right += 1
        else:
            break
    if right >= left:
        count += len(name[left:])
    else:
        count += len(name[right:])
    return count