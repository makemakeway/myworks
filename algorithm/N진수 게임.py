# N진수 게임
# 튜브가 활동하는 코딩 동아리에서는 전통적으로 해오는 게임이 있다. 이 게임은 여러 사람이 둥글게 앉아서 숫자를 하나씩 차례대로 말하는 게임인데, 규칙은 다음과 같다.

# 숫자를 0부터 시작해서 차례대로 말한다. 첫 번째 사람은 0, 두 번째 사람은 1, … 열 번째 사람은 9를 말한다.
# 10 이상의 숫자부터는 한 자리씩 끊어서 말한다. 즉 열한 번째 사람은 10의 첫 자리인 1, 열두 번째 사람은 둘째 자리인 0을 말한다.

# 진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p 가 주어진다.

def convert(nbr, n):            #진수 변환을 위한 함수
    base = '0123456789ABCDEF'
    q, r = divmod(nbr, n)       #q에는 몫, r에는 나머지 저장
    if q == 0:                  #나눠질 몫이 없다면 
        return base[r]          #base[r]을 반환
    else:
        return convert(q, n) + base[r]  #나눠질 몫이 있다면, 나눠질 몫이 없어질때까지 재귀 호출
    
def solution(n, t, m, p):
    answer = ''
    order = p
    cnt = 0
    for nbr in range(t*m):                  #0부터 시작
        base_nbr = str(convert(nbr, n))     #nbr을 n진법에 맞게 변환한 후, 문자열 형식으로 캐스팅
        for base_n in base_nbr:             #문자열이 된 nbr의 문자를 순회
            if order == 1:                  #튜브가 말할 차례라면, 그 문자를 answer에 더해줌
                answer += base_n
                order = m                   #튜브가 말했으므로, 순서를 초기화해줌
            else:
                order -= 1                  #튜브의 차례가 아니므로, 순서를 당겨줌
            cnt += 1                        #한명이 말할때마다, 카운트를 세줌
            if cnt == t * m:                #모두가 말해야 하는 숫자를 채웠을 경우
                return answer               #지금까지 완성된 answer를 리턴
    return answer