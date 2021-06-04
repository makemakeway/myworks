# arr = [1,2,3,3,3,3,4,4]
# arr = [3,2,4,4,2,5,2,5,5]
# arr = [3,5,7,9,1]
arr = [1,2,3,4,5,6,7,8,9,10,10,10,9,8]

def solution_0(arr):
    answer = []
    arr = sorted(arr)           #오름차순 순서로 정렬
    done = []
    for nbr in arr:             #arr의 원소를 순환
        if nbr in done:         #done에 있는 숫자는 중복 개수를 센 것이므로, 다음 원소로 진행
            continue
        cnt = arr.count(nbr)
        if cnt > 1:             #cnt가 1보다 크다는것은 중복이 있다는 것
            answer.append(cnt)  #answer에 cnt를 원소로 추가시켜줌
            done.append(nbr)    #현재 확인한 숫자를 done에 추가시켜줌
    if answer == []:
        answer.append(-1)       #중복이 없을 경우, -1을 원소로 추가시켜줌
    return answer

def solution_1(arr):
    answer = []
    set_arr = sorted(set(arr))      #set으로 arr의 중복된 숫자를 없애고, 오름차순 순서로 정렬
    done = []
    for nbr in set_arr:             #set_arr의 원소를 순환
        cnt = arr.count(nbr)      #arr에 있는 nbr의 갯수를 구해 cnt에 저장
        if cnt > 1:             #cnt가 1보다 크다는것은 중복이 있다는 것
            answer.append(cnt)  #answer에 cnt를 원소로 추가시켜줌
            done.append(nbr)    #현재 확인한 숫자를 done에 추가시켜줌
    if answer == []:
        answer.append(-1)       #중복이 없을 경우, -1을 원소로 추가시켜줌
    return answer

print(solution_0(arr))
print(solution_1(arr))