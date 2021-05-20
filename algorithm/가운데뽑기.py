def solution(s): # s = 문자열
    answer = ""
    if len(s) % 2 == 0: # s의 갯수가 짝수일경우
        index = int(len(s) / 2) - 1
        answer = s[index] + s[index + 1]
    else: # 홀수일경우
        index = int(len(s) / 2)
        answer = s[index]
    return answer