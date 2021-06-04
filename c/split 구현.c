#include <stdlib.h>

int		is_char(char c, char *charset) // charset에 문자가 있는지 확인하는 함수
{
	int	i;

	i = 0;
	while (charset[i])
	{
		if (c == charset[i])		//charset을 순회하다, 일치하는 문자를 찾으면 1을 리턴
			return (1);
		i++;
	}
	return (0);
}

char		*ft_strcpy(char *dest, char *src, int n) // strncpy의 기능을 수행하는 함수
{
	int	i;

	i = 0;
	while (src[i] && i < n)	//src 전체만큼 혹은 n만큼 src를 dest로 복사
	{
		dest[i] = src[i];
		i++;
	}
	dest[i] = 0;
	return (dest);
}

char		**ft_split(char *str, char *charset)
{
	char	**result;
	char	*cpy;
	char	*start;
	int	i;

	i = 0;
	if(!(result = (char **)malloc(sizeof(char *) * 4096))) //공간을 얼마나 차지할지 모르므로 넉넉히 동적할당을 해둠
		return (NULL); // 동적할당에 실패했을 경우, NULL 리턴
	cpy = str;
	while(*cpy) // 문자열로 이루어진 cpy를 순회
	{
		if(*cpy && is_char(*cpy, charset)) 	// cpy를 순회하다가 charset에 들어있는 문자를 만났다면
			cpy++; 							// cpy를 한칸 이동
		else
		{
			start = cpy; 							//charset에 들어있지 않은 문자를 발견했으면, 그 부분을 기준점으로 잡음
			while (*cpy && !is_char(*cpy, charset)) //현재 cpy의 문자가 charset에 들어있지 않으면 반복문 수행
				cpy++;
			result[i] = (char *)malloc(sizeof(char) * (cpy - start + 1)); //result에 (현재까지 진행된 문자열 - 기준점 + null값을 넣을 공간)을 할당해줌 
			ft_strcpy(result[i], start, cpy - start); // strcpy함수를 이용해 복사
			i++;
		}
	}
	result[i] = 0; // 더 채울 것이 없으므로, null을 넣어 마무리해줌
	return (result);
}

#include <stdio.h>

int		main(void)
{
	char *test = "!@! sdff! fdfds@ wowo";
	char *set = "!@";

	printf("%s\n", ft_split(test, set)[0]);
	printf("%s\n", ft_split(test, set)[1]);
	printf("%s\n", ft_split(test, set)[2]);
	printf("%s\n", ft_split(test, set)[3]);
	printf("%s\n", ft_split(test, set)[4]);
	return (0);
}
