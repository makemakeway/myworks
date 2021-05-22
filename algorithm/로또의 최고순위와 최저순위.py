#로또 번호를 담은 배열 lottos, 
#당첨 번호를 담은 배열 win_nums가 매개변수로 주어집니다.
#이때, 당첨 가능한 최고 순위와 최저 순위를 차례대로 배열에 담아서 return 하도록
#solution 함수를 완성해주세요.

def solution(lottos, win_nums):
    answer = []
    count = 0 #당첨번호와 일치하는 숫자의 갯수
    zeros = lottos.count(0)#0의 갯수
    rank = {6:1, 5:2, 4:3, 3:4, 2:5, 1:6, 0:6}#{일치하는 숫자 갯수 : 등수} 로 이루어진 딕셔너리
    for i in lottos:
        if i in win_nums: #숫자가 일치하면, count를 높여줌
            count += 1
    answer = [rank[count + zeros], rank[count]] #키값에 일치하는 등수를 삽입
    return answer