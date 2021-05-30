# 알파벳 소문자로만 이루어진 단어 S가 주어진다. 
# 각 알파벳이 단어에 몇 개가 포함되어 있는지 구하는 프로그램을 작성하시오.

import sys

S = input()                             # 주어지는 단어
answer = ['0'] * 26                     # 정답을 담아둘 리스트
alpha = "abcdefghijklmnopqrstuvwxyz"
for char in alpha:                      # alpha 문자열을 순회
    if char in S:                       # 문자가 주어진 단어에 있는지 확인
        answer[ord(char) - ord('a')] = str(S.count(char))   # 알맞은 인덱스의 숫자를 늘려줘야 하기에 ord함수 활용. join함수로 문자열로 합치기 위해 int타입을 str타입으로 캐스팅
print(' '.join(answer))