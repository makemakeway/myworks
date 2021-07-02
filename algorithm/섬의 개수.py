# 문제
# 정사각형으로 이루어져 있는 섬과 바다 지도가 주어진다. 섬의 개수를 세는 프로그램을 작성하시오.

# 한 정사각형과 가로, 세로 또는 대각선으로 연결되어 있는 사각형은 걸어갈 수 있는 사각형이다. 

# 두 정사각형이 같은 섬에 있으려면, 한 정사각형에서 다른 정사각형으로 걸어서 갈 수 있는 경로가 있어야 한다. 
# 지도는 바다로 둘러싸여 있으며, 지도 밖으로 나갈 수 없다.

# 입력
# 입력은 여러 개의 테스트 케이스로 이루어져 있다. 
# 각 테스트 케이스의 첫째 줄에는 지도의 너비 w와 높이 h가 주어진다. 
# w와 h는 50보다 작거나 같은 양의 정수이다.

# 둘째 줄부터 h개 줄에는 지도가 주어진다. 1은 땅, 0은 바다이다.

# 입력의 마지막 줄에는 0이 두 개 주어진다.

# 출력
# 각 테스트 케이스에 대해서, 섬의 개수를 출력한다.

import sys
# 재귀함수 호출 제한을 풀어줌
sys.setrecursionlimit(1000000000)

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

