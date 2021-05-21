def solution(s, n): # 문자열 s와 거리 n을 입력받아 s를 n만큼 밀어내는 함수
    answer = ''
    for char in s:
        if char.isupper(): # 대문자일 때
            answer += chr((ord(char) + n - ord('A')) % 26 + ord('A')) # 25(Z)가 넘어가는 경우, 다시 0(A)부터 
        elif char.islower(): # 소문자일 때
            answer += chr((ord(char) + n - ord('a')) % 26 + ord('a'))
        else: # whitespace일 때
            answer += char
    return answer