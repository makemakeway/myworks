#문장이 주어졌을 때, 단어를 모두 뒤집어서 출력하는 프로그램을 작성하시오. 단, 단어의 순서는 바꿀 수 없다. 단어는 영어 알파벳으로만 이루어져 있다.
#첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스는 한 줄로 이루어져 있으며, 문장이 하나 주어진다. 단어의 길이는 최대 20, 문장의 길이는 최대 1000이다. 단어와 단어 사이에는 공백이 하나 있다.
#각 테스트 케이스에 대해서, 입력으로 주어진 문장의 단어를 모두 뒤집어 출력한다.

import sys

temp = []
rev = []
command = int(sys.stdin.readline())
for i in range(command): #입력을 위한 반복문
    temp.append(sys.stdin.readline().strip()) #strip() -> 앞 뒤 개행문자를 없애줌
    rev.append(temp[i][::-1].split()) #문자를 거꾸로 슬라이싱한 후 단어단위로 나누어 rev 리스트에 담아줌
for i in range(command): #출력을 위한 반복문
    print(' '.join(rev[i][::-1])) #리스트 형식으로 나뉘어져 있기에 join을 통해 문자열로 만들어줌. 단어의 순서만 정위치로 바꿔줌