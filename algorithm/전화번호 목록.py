#전화번호부에 적힌 전화번호를 담은 배열 phone_book 이 solution 함수의 매개변수로 주어질 때, 
#어떤 번호가 다른 번호의 접두어인 경우가 있으면 false를 그렇지 않으면 true를 return 하도록
#solution 함수를 작성해주세요.

def solution(phone_book):
    phone_book.sort()
    for i,  j in zip(phone_book, phone_book[1:]): # 병렬처리를 위해 zip() 사용
        if j.startswith(i): # startswith(String or Tuple) = 문자열이 특정 문자열로 시작하는지 알려줌
            return False # 특정문자열로 시작한다면, 바로 False를 리턴
    return True