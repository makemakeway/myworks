n, m = map(int, input().split())

x, y, d = map(int, input().split())

room = []

# 방문처리를 위한 배열
visit = [[False for col in range(m)] for row in range(n)]

# room 입력
for i in range(n):
    room.append(list(map(int, input().split())))

# 로봇청소기 방향(d)에 따른 x, y 증감
nx = [-1, 0, 1, 0]
ny = [0, 1, 0, -1]

# 로봇청소기의 기본 위치를 방문처리
visit[x][y] = True
answer = 1


def clean(x, y, d, visit, room, answer):
    while True:
        check = False
        for i in range(4):
            nd = (d + 3) % 4
            next_x = x + nx[nd]
            next_y = y + ny[nd]
            print(next_x, next_y)
            d = nd
            if visit[next_x][next_y] == False and room[next_x][next_y] == 0: 
                x, y = next_x, next_y
                visit[x][y] = True
                answer += 1
                check = True
                break
        if check == False:
            if room[x - nx[d]][y - ny[d]] == 1:
                return answer
            else:
                x, y = x - nx[d], y - ny[d]

print(clean(x, y, d, visit, room, answer))

