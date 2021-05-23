#사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때
#숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록
#solution 함수를 작성해주세요.

def solution(numbers, target):
    root = [0] #0부터 시작해서 [0 + numbers[i], 0 - numbers[i] ...] 
    for num in numbers:
        tmp = [] #임시 리스트
        for rootnum in root:
            tmp.append(rootnum + num) #임시리스트에 numbers[i]를 +, - 해주는 부분
            tmp.append(rootnum - num)
        root = tmp #임시리스트를 root에 덮어씌우기. 이 다음 실행은 [0 + numbers[i] + numbers[i+1]] 혹은 [0 + numbers[i] - numbers[i+1]] 이런 식으로 진행
    return root.count(target) #마지막까지 진행된 list에서 target의 갯수를 리턴