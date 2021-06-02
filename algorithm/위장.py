# 스파이들은 매일 다른 옷을 조합하여 입어 자신을 위장합니다.

# 예를 들어 스파이가 가진 옷이 아래와 같고 오늘 스파이가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면

# 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야 합니다.

# 스파이가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.

def solution(clothes):
    count = 0
    answer = 1
    wearing = {}
    for i in clothes:
        key = i[1]                      # ["glasses", "eyewear"] 형태로 확인하기 때문에, key값으로 1번째 인자를 사용
        value = i[0]                    # value값으로는 0번째 인자를 사용
        if key in wearing:
            wearing[key].append(value)  # key값이 중복된다면, 그 key값에 value를 추가해줌
        else:
            wearing[key] = [value]      # 중복되지 않는다면, key와 value값을 새로 만들어줌

    for key in wearing.keys():
        answer *= (len(wearing[key]) + 1) # 안입은 경우까지 세기 위해 (모자갯수 + 1)(상의 + 1)(하의 + 1)을 곱해주는 과정 

    return answer - 1 # 모두 안입는 경우는 없으므로, 경우의 수에서 -1을 빼줌