def solution(citations):
    answer = 0
    cnt = 0
    citations = sorted(citations, reverse=True)
    for nbr in citations:
        cnt += 1
        if cnt >= nbr:
            return cnt  
    return cnt