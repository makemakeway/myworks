# 블라인드 공채를 통과한 신입 사원 라이언은 신규 게임 개발 업무를 맡게 되었다. 이번에 출시할 게임 제목은 "프렌즈4블록".
# 같은 모양의 카카오프렌즈 블록이 2×2 형태로 4개가 붙어있을 경우 사라지면서 점수를 얻는 게임이다.

# TTTANT
# RRFACC
# RRRFCC
# TRRRAA
# TTMMMF
# TMMTTJ

# 만약 판이 위와 같이 주어질 경우, 라이언이 2×2로 배치된 7개 블록과 콘이 2×2로 배치된 4개 블록이 지워진다. 
# 같은 블록은 여러 2×2에 포함될 수 있으며, 지워지는 조건에 만족하는 2×2 모양이 여러 개 있다면 한꺼번에 지워진다.

# 블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채우게 된다.
# 만약 빈 공간을 채운 후에 다시 2×2 형태로 같은 모양의 블록이 모이면 다시 지워지고 떨어지고를 반복하게 된다.

# 입력 형식
# 입력으로 판의 높이 m, 폭 n과 판의 배치 정보 board가 들어온다.
# 2 ≦ n, m ≦ 30
# board는 길이 n인 문자열 m개의 배열로 주어진다. 블록을 나타내는 문자는 대문자 A에서 Z가 사용된다.
# 출력 형식
# 입력으로 주어진 판 정보를 가지고 몇 개의 블록이 지워질지 출력하라.


def find_block(board, i, j, boom):
    now_c = board[i][j]
    if now_c == board[i][j+1]:
        if now_c == board[i+1][j] and now_c == board[i+1][j+1]:
            boom.append((i, j))
            boom.append((i, j+1))
            boom.append((i+1, j))
            boom.append((i+1, j+1))
            
def restruct(board, i, boom):
    for i in reversed(boom):
                upper = i[0] - 1
                boom_block = i[0]
                while upper >= 0:
                    if board[upper][i[1]] != "0" and board[boom_block][i[1]] == "0":
                        board[boom_block][i[1]] = board[upper][i[1]]
                        board[upper][i[1]] = "0"
                        boom_block -= 1
                    upper -= 1
            
def solution(m, n, board):
    answer = 0
    
    # board list형식으로 변환
    for i in range(len(board)):
        board[i] = list(board[i])
        
    # 터트릴 블록이 없을 때 까지 진행
    while True:
        boom = []
        for i in range(m-1):
            for j in range(n-1):
                
                # 탐색하는 곳이 터진 블록이라면, 다음 블록 탐색
                if board[i][j] == '0':
                    continue
                find_block(board, i, j, boom)
                
        # 터트릴 블록 없을 시, break
        if len(boom) == 0:
            break
        else:
            answer += len(set(boom))
            
            # 터트림 처리
            for i in boom:
                board[i[0]][i[1]] = "0"
            
            # 보드 아래에서부터, 터진 블록 채우는 과정
            restruct(board, i, boom)
                    
    return answer