# 문제
# 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오. 
# 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 
# 더 이상 방문할 수 있는 점이 없는 경우 종료한다. 정점 번호는 1번부터 N번까지이다.

# 입력
# 첫째 줄에 정점의 개수 N(1 ≤ N ≤ 1,000), 간선의 개수 M(1 ≤ M ≤ 10,000), 
# 탐색을 시작할 정점의 번호 V가 주어진다. 다음 M개의 줄에는 간선이 연결하는 두 정점의 번호가 주어진다. 
# 어떤 두 정점 사이에 여러 개의 간선이 있을 수 있다. 입력으로 주어지는 간선은 양방향이다.

# 출력
# 첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다. 
# V부터 방문된 점을 순서대로 출력하면 된다.

n, m, v = map(int, input().split())

graph = [[False] * (n+1) for i in range(n+1)] 

for i in range(m):
    a, b = map(int, input().split())
    graph[a][b] = graph[b][a] = True    # 노드 연결

visit = [False for i in range(n+1)]

def DFS(v):
    visit[v] = True     # True로 방문처리
    print(v, end= " ")
    for i in range(1, n+1):
        if visit[i] == False and graph[v][i] == True:   # 방문하지 않았는데 연결되어 있는 노드라면 DFS 호출
            DFS(i)

def BFS(v):
    q = [v]
    visit[v] = False    # 위에서 True로 방문처리 했으므로, False로 방문처리
    while q:
        v = q.pop(0)
        print(v, end= " ")
        for i in range(1, n+1):
            if visit[i] == True and graph[v][i] == True:
                q.append(i)
                visit[i] = False

DFS(v)
print("")
BFS(v)