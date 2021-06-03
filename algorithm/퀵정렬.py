arr = [6, 5, 1, 4, 7, 2, 3]

def quick_sort(arr):
    if len(arr) <= 1:               #arr의 가장 왼쪽에 가장 작은수만 왔을때
        return arr                  #그 arr을 리턴
    middle = (min(arr) + max(arr)) // 2     #중간값 설정
    left_arr, mid_arr, right_arr = [], [], []   #중간값보다 작은 수는 left_arr에, 중간값은 mid_arr에, 중간값보다 큰 수는 right_arr에 담김
    for num in arr:
        if num < middle:
            left_arr += [num]
        elif num > middle:
            right_arr += [num]
        else:
            mid_arr += [num]
    return quick_sort(left_arr) + mid_arr + quick_sort(right_arr)   #작은 배열에 담긴것부터 재귀호출
    
def reverse_quick_sort(arr):
    if len(arr) <= 1:
        return arr
    middle = (min(arr) + max(arr)) // 2
    left_arr, mid_arr, right_arr = [], [], []
    for num in arr:
        if num > middle:
            left_arr += [num]
        elif num < middle:
            right_arr += [num]
        else:
            mid_arr += [num]
    return reverse_quick_sort(left_arr) + mid_arr + reverse_quick_sort(right_arr)

print(quick_sort(arr))
print(reverse_quick_sort(arr))