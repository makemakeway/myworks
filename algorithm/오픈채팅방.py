# 오픈채팅방
# 카카오톡 오픈채팅방에서는 친구가 아닌 사람들과 대화를 할 수 있는데, 
# 본래 닉네임이 아닌 가상의 닉네임을 사용하여 채팅방에 들어갈 수 있다.

# 신입사원인 김크루는 카카오톡 오픈 채팅방을 개설한 사람을 위해, 
# 다양한 사람들이 들어오고, 나가는 것을 지켜볼 수 있는 관리자창을 만들기로 했다.
# 채팅방에 누군가 들어오면 다음 메시지가 출력된다.

# "[닉네임]님이 들어왔습니다."

# 채팅방에서 누군가 나가면 다음 메시지가 출력된다.

# "[닉네임]님이 나갔습니다."

# 채팅방에서 닉네임을 변경하는 방법은 다음과 같이 두 가지이다.

# 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
# 채팅방에서 닉네임을 변경한다.
# 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.

# 예를 들어, 채팅방에 "Muzi"와 "Prodo"라는 닉네임을 사용하는 사람이 순서대로 들어오면 채팅방에는 다음과 같이 메시지가 출력된다.

# "Muzi님이 들어왔습니다."
# "Prodo님이 들어왔습니다."

# 채팅방에 있던 사람이 나가면 채팅방에는 다음과 같이 메시지가 남는다.

# "Muzi님이 들어왔습니다."
# "Prodo님이 들어왔습니다."
# "Muzi님이 나갔습니다."

# Muzi가 나간후 다시 들어올 때, Prodo 라는 닉네임으로 들어올 경우 기존에 채팅방에 남아있던 Muzi도 Prodo로 다음과 같이 변경된다.

# "Prodo님이 들어왔습니다."
# "Prodo님이 들어왔습니다."
# "Prodo님이 나갔습니다."
# "Prodo님이 들어왔습니다."

# 채팅방은 중복 닉네임을 허용하기 때문에, 현재 채팅방에는 Prodo라는 닉네임을 사용하는 사람이 두 명이 있다. 
# 이제, 채팅방에 두 번째로 들어왔던 Prodo가 Ryan으로 닉네임을 변경하면 채팅방 메시지는 다음과 같이 변경된다.

# "Prodo님이 들어왔습니다."
# "Ryan님이 들어왔습니다."
# "Prodo님이 나갔습니다."
# "Prodo님이 들어왔습니다."

# 채팅방에 들어오고 나가거나, 닉네임을 변경한 기록이 담긴 문자열 배열 record가 매개변수로 주어질 때, 모든 기록이 처리된 후, 
# 최종적으로 방을 개설한 사람이 보게 되는 메시지를 문자열 배열 형태로 return 하도록 solution 함수를 완성하라.



def solution(record):
    answer = []
    dic = {}
    key = ''
    value = ''
    
    for command in record:          #recode를 순회하며, 최종적으로 남는 {id:nickname} 저장
        tmp = command.split()
        key = tmp[1]
        if tmp[0] != 'Leave':
            value = tmp[2]
            dic[key] = value
        else:
            del dic[key]

    for command in record:          # 다시 한번 순회하며, 위 for문에서 얻은 dic을 활용하며 answer에 저장
        tmp = command.split()
        if tmp[0] == 'Leave':
            answer.append(dic[tmp[1]] + "님이 나갔습니다.")
        elif tmp[0] == 'Enter':
            answer.append(dic[tmp[1]] + "님이 들어왔습니다.")

    return answer
    # 런타임에러 발생

    def solution(record):
    answer = []
    dic = {}
    result = []
    
    for command in record:          #recode를 순회하며, 최종적으로 남는 {id:nickname} 저장
        tmp = command.split()
        key = tmp[1]
        if tmp[0] != 'Leave':
            value = tmp[2]
            dic[key] = value
            if tmp[0] != 'Change':
                result.append(key + " Enter")
        else:
            result.append(key + " Out")
            del dic[key]        # result란 리스트를 만들어, Change를 제외한 id + InOut을 저장

    for res in result:          # result 순회하며, 위 for문에서 얻은 dic을 활용하며 answer에 저장
        tmp = res.split()
        if tmp[1] == 'Out':
            answer.append(dic[tmp[0]] + "님이 나갔습니다.")
        elif tmp[1] == 'Enter':
            answer.append(dic[tmp[0]] + "님이 들어왔습니다.")

    return answer

    # Change 경우를 제외하고 반복문을 출력하기 때문에 시간복잡도를 줄일 수 있었으나, 여전히 런타임에러 발생

    def solution(record):
    answer = []
    dic = {}
    result = []
    
    for command in record:          #recode를 순회하며, 최종적으로 남는 {id:nickname} 저장
        tmp = command.split()
        if tmp[0] != 'Leave':
            dic[tmp[1]] = tmp[2]
        if tmp[0] == 'Enter' or tmp[0] == 'Leave':
            result.append('{} {}'.format(tmp[1], tmp[0]))   # split으로 활용할 것이기 때문에 format함수로 ["id inout"] 형태로 저장

    for res in result:              # 위 for문에서 얻은 dic와 result를 활용하며 answer에 저장
        tmp = res.split()
        if tmp[1] == 'Leave':
            answer.append(dic[tmp[0]] + "님이 나갔습니다.")
        elif tmp[1] == 'Enter':
            answer.append(dic[tmp[0]] + "님이 들어왔습니다.")

    return answer