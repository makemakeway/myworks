import re

p = re.compile("ca.e")

# . = 하나의 문자를 의미
# ^ = 문자열의 시작을 의미 ex) ^de = desk, destination ...
# $ = 문자열의 끝을 의미 ex se$ = case, base ....

def print_match(m):
    if m:
        print(m.group()) # 일치하는 문자열 반환 
        print(m.string) # 입력받은 문자열 반환
        print(m.start()) # 일치하는 문자열의 시작 인덱스 반환
        print(m.end()) # 일치하는 문자열의 끝 인덱스
        print(m.span()) # 일치하는 문자열의 시작, 끝 인덱스
    else:
        print("매칭되지 않음")

# m = p.match("good cafe") # match = 처음부터 일치하는지 확인
# print_match(m)

# m = p.search("good care") # search = 주어진 문자열중에 일치하는게 있는지 확인
# print_match(m)

# lst = p.findall("careless good cafe") # 일치하는 모든 것을 리스트 형태로 반환
# print(lst)