# 2016년 1월 1일은 금요일입니다. 
# 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 
# 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요.
# 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT입니다.
# 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.

def solution(a, b):
    answer = ''
    week = "FRI SAT SUN MON TUE WED THU".split()            # 1월 1일이 금요일이라 첫번째 인덱스를 금요일로 설정
    day = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]  # 각 월의 일자 수를 담아놓은 리스트
    answer += week[(sum(day[:a-1]) + b-1) % 7]              # 구해야하는 월의 전월까지의 일수를 합한 뒤, b를 더해줌. 인덱스처리를 위해 -1씩 빼줌 
    return answer