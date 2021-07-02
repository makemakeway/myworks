
while True:
    w, h = map(int, input().split())
    if w == 0 and h == 0:
        break

    graph = []
    for i in range(h):
        graph.append(list(map(int, input().split())))
    visit = [[False for i in range(w)] for j in range(h)]
    answer = 0


    def DFS(x, y):
        # 인덱스 범위 바깥일 경우, False 리턴
        if x <= -1 or x >= h or y <= -1 or y >= w:
            return False
            # 방문하지 않은 곳이 땅이라면
        if visit[x][y] == False and graph[x][y] == 1:
            # 방문처리
            visit[x][y] = True
            # 상하좌우 검사
            DFS(x-1, y)
            DFS(x, y-1)
            DFS(x+1, y)
            DFS(x, y+1)

            # 대각선 검사
            DFS(x-1, y-1)
            DFS(x+1, y+1)
            DFS(x-1, y+1)
            DFS(x+1, y-1)
            return True
        return False


    for i in range(h):
        for j in range(w):
            if DFS(i, j) == True:
                answer += 1
    print(answer)

