# X = int(input())
# count = 0

# while X != 1:
#     target = (X // 3) * 3
#     count += X - target
#     X = target
#     X //= 3
#     count += 1
    
# print(count)

# 위 코드로는 조건을 만족시킬 수 없을 것 같아 새로 작성

X = int(input())
result = [0, 0, 1, 1] # 0, 1, 2, 3일때의 최소 연산값

for i in range(4, X+1): # 4부터 X까지의 연산 수행
    result.append(result[i-1]+1) # X에서 1을 뺄 때의 최소연산값
    if i % 3 == 0:
        result[i] = min(result[i//3]+1, result[i]) # X를 3으로 나눌때의 최소 연산값
    if i % 2 == 0:
        result[i] = min(result[i//2]+1, result[i]) # X를 2로 나눌때의 최소 연산값

print(result[X])