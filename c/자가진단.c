#include <stdio.h>
#include <stdlib.h>

int	*solution(int *arr, int size)	// 배열과 배열의 원소의 갯수를 매개변수로 하는 solution 함수 작성
{
	int nbr = 1;
	int i = 0;
	int j = 0;
	int count = 0;
	int *answer = {0, };

	answer = malloc(sizeof(int) * 50); // arr의 최대길이가 100이므로, 중복의 개수를 담을 배열의 최대 크기는 50으로 설정 

	while(nbr <= 100)	// 1~100까지 검사
	{
		i = 0;
		while(i < size)
		{
			if(nbr == arr[i]) // 배열에 1~100 사이의 숫자가 있는지 셈
				count++; 	// 있다면 count를 1씩 증가
			i++;
		}
		if(count >= 2) // 갯수가 2개 이상이면 중복이 있다는 것이므로, answer에 추가해줌
		{
			answer[j] = count;
			j++;
		}
		count = 0;			// 다음 숫자를 세기 전에 count를 초기화해줌
		nbr++;
	}
	i = 0;
	if(answer[0] == 0) // 중복된 숫자가 없을 경우, -1을 리턴
	{
		answer[0] = -1;
		return (answer);
	}
	return (answer);
}


int	main(void)
{
	//int arr[] = {1, 1, 1, 2, 2, 3};
	//int arr[] = {1, 2, 3, 3, 3, 3, 4, 4};
	int arr[] = {3, 2, 4, 4, 2, 5, 2, 5, 5};
	//int arr[] = {3, 5, 7, 9 ,1};
	solution(arr, sizeof(arr) / sizeof(int));
	return (0);
}
