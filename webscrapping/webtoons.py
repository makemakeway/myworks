import requests
from bs4 import BeautifulSoup

url = "https://comic.naver.com/webtoon/weekday.nhn"
res = requests.get(url)
res.raise_for_status()

soup = BeautifulSoup(res.text, "lxml")
cartoons = soup.find_all("a", attrs={"class":"title"})
#class 속성이 title인 모든 "a" 태그 element를 반환
for cartoon in cartoons:
    print(cartoon.get_text())