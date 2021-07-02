# 문제 설명
# 스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 
# 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.

# 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
# 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
# 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
# 노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 
# 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.

# 제한사항
# genres[i]는 고유번호가 i인 노래의 장르입니다.
# plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
# genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
# 장르 종류는 100개 미만입니다.
# 장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
# 모든 장르는 재생된 횟수가 다릅니다.

def solution(genres, plays):
    answer = []
    dic = {}
    total_list = list(enumerate(zip(genres, plays)))
    
    # 딕셔너리 만들어 가장 많이 재생된 장르 찾기
    for g, p in zip(genres, plays):
        if g not in dic:
            dic[g] = p
        else:
            dic[g] += p
    
    # 내림차순 순서로 정렬
    dic = sorted(dic.items(), key=lambda x:x[1], reverse=True)
    
    # [인덱스번호, (장르, 재생횟수)] 로 구성된 리스트를 재생횟수 내림차순 순서로 정렬
    total_list = sorted(total_list, key=lambda x:x[1][1], reverse=True)
    
    
    for key in dic:
        cnt = 0
        for genre in total_list:
            if key[0] == genre[1][0] and cnt < 2:
                answer.append(genre[0])
                cnt += 1
    
    return answer