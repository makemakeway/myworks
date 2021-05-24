import requests
from bs4 import BeautifulSoup

url = "https://comic.naver.com/webtoon/weekday.nhn"
res = requests.get(url)
res.raise_for_status()

soup = BeautifulSoup(res.text, "lxml")
# print(soup.title.get_text())
# print(soup.a.get_text()) # a.attrs -> 속성 확인(딕셔너리 형태)
# print(soup.a["href"]) # a element의 속성값 확인

# print(soup.find("li", attrs={"class":"rank01"}))

# rank1 = soup.find("li", attrs={"class":"rank01"})
# rank2 = rank1.find_next_sibling("li")
# rank3 = rank2.next_sibling.next_sibling
# rank1 = soup.find("li", attrs={"class":"rank01"})
# print(rank1.find_next_siblings("li"))

webtoon = soup.search("a", text="나노마신-046")
print(webtoon)