import random

#웹 스크래핑에 필요한 모듈
import requests
from bs4 import BeautifulSoup

#재고 메세지를 받기 위한 텔레그램 모듈
import telegram

#스케쥴러 모듈
from apscheduler.schedulers.blocking import BlockingScheduler

#텔레그램 설정
chat_id = 1677964383 #자신의 텔레그램 봇 '채팅방' id를 입력
token = '1704308499:AAG-QFIw9UY76UzT5PiMRRqCTiAmHFcGRJk' #자신의 텔레그램 봇 토큰을 입력
bot = telegram.Bot(token=token)

sched = BlockingScheduler()

def stock_check():
    url = 'https://www.mamagari.com/shop/shopdetail.html?branduid=1177867&xcode=012&mcode=000&scode=&type=P&sort=brandname&cur_code=012&GfDT=bGl3VQ%3D%3D'
    #url = 'https://store.musinsa.com/app/goods/1922597' #재고 있는 상품 시험
    headers = {"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36"} # 웹사이트에 접속하는 환경 설정
    req = requests.get(url, headers=headers)
    req.raise_for_status() # 오류확인
    html = req.text
    soup = BeautifulSoup(html, 'html.parser')
    search_result = soup.find("a", title="44") #a태그중 클래스가 btn_black인것을 찾음

    if search_result == None: #값이 None이면 재고가 없는 것이므로, False 리턴하며 종료
        return False
    bot.sendMessage(chat_id=chat_id, text="재고있음") #재고가 있을 시 텔레그램 봇 채팅방을 통해 재고있음 전송
    return True

stock_check() # 프로그램 실행

sched.add_job(stock_check, 'interval', minutes=random.randrange(1,3)) #interval -> 일정 주기로 실행, 분단위 실행은 minutes 시간단위 실행은 hours. 트래픽을 최소화하고자 1시간 단위로 실행
sched.start()
