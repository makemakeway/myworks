//
//  HomeViewController.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/07.
//

import UIKit

class HomeViewController: UIViewController {
    
    // 테이블 뷰 연결
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    // MOCK DATA
    var items = [Item(image: "아이폰",
                      title: "아이폰8 A급매물 싸게 급처합니다! 네고x 흥정x 교환x 직거래 원합니다",
                      region: "구로구 구로제5동 ・ 5초 전",
                      price: "300,000원",
                      likes: 0),
                 Item(image: "아이패드",
                                   title: "아이패드 8세대",
                                   region: "구로구 개봉본동 ・ 1분 전",
                                   price: "405,000원",
                                   likes: 1),
                 Item(image: "아이맥",
                                   title: "아이맥 2021년 최신형",
                                   region: "영등포구 도림동 ・ 12분 전",
                                   price: "1,250,000원",
                                   likes: 2),
                 Item(image: "애플펜슬",
                                   title: "애플펜슬 2세대 극미중고 팝니다~~",
                                   region: "은평구 불광동 ・ 23분 전",
                                   price: "140,000원",
                                   likes: 4),
                 Item(image: "애플워치",
                                   title: "애플워치 무료나눔!!!!",
                                   region: "은평구 홍제동 ・ 44분 전",
                                   price: "나눔🧡",
                                   likes: 23),
                 Item(image: "에어팟",
                                   title: "에어팟 2세대 <프로아님> 극미중고 팝니다",
                                   region: "관악구 봉천동 ・ 1시간 전",
                                   price: "80,000원",
                                   likes: 0),
                 Item(image: "맥북",
                                   title: "맥북 air 2014년형",
                                   region: "금천구 시흥동 ・ 1일 전",
                                   price: "450,000원",
                                   likes: 2)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelegate()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray
        
        
        addPostButtonConfigure()
        navBarInit()
        tabbarConfigure()
        
    }
    
    func tabbarConfigure() {
        if let downcastStrings = self.tabBarController?.tabBar.items {
            downcastStrings[0].title = "홈"
            downcastStrings[0].image = UIImage(named: "홈")
            downcastStrings[0].selectedImage = UIImage(named: "홈(선택)")
            
            downcastStrings[1].title = "동네생활"
            downcastStrings[1].image = UIImage(named: "동네생활")
            downcastStrings[1].selectedImage = UIImage(named: "동네생활(선택)")
            
            downcastStrings[2].title = "내 근처"
            downcastStrings[2].image = UIImage(named: "내근처")
            downcastStrings[2].selectedImage = UIImage(named: "내근처(selected)")
            
            downcastStrings[3].title = "채팅"
            downcastStrings[3].image = UIImage(named: "채팅")
            downcastStrings[3].selectedImage = UIImage(named: "채팅(선택)")
            
            downcastStrings[4].title = "나의 당근"
            downcastStrings[4].image = UIImage(named: "사람")
            downcastStrings[4].selectedImage = UIImage(named: "사람(선택)")
        }
        self.tabBarController?.tabBar.tintColor = .black
        self.tabBarController?.tabBar.unselectedItemTintColor = .black
        self.tabBarController?.tabBar.barTintColor = .white
    }
    
    func addPostButtonConfigure() {
        self.backgroundView.backgroundColor = .orange
        self.backgroundView.layer.shadowOpacity = 0.5
        self.backgroundView.layer.shadowRadius = 5
        self.backgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.backgroundView.layer.masksToBounds = false
        
    }
    
    
    func navBarInit() {
        let titleFont = UIBarButtonItem(title: "구로제5동", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        titleFont.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!], for: UIControl.State.normal)
        navigationItem.leftBarButtonItem = titleFont
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addPost() {
        print("add post")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProductViewController {
            let vc = segue.destination as! ProductViewController
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            vc.item = items[(indexPath?.row)!]
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 재사용 가능한 Table Cell을 반환해주는 dequeueReusableCell함수
        // Identifier -> Table Cell의 identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomTableCell
        
        // Table Cell을 눌렀을 때,
        // 백그라운드 색이 회색으로 변하는 것을 방지하기 위한 코드
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        // cell에 MOCKDATA를 넘김
        cell.productImage.image = UIImage(named: items[indexPath.row].image)
        cell.productPrice.text = items[indexPath.row].price
        cell.region.text = items[indexPath.row].region
        cell.productTitle.text = items[indexPath.row].title
        
        // 좋아요가 0일 때
        if items[indexPath.row].likes == 0 {
            cell.likes?.text = ""
            cell.heartImage?.image = nil
        } else {
            cell.likes?.text = String(items[indexPath.row].likes)
            cell.heartImage?.image = UIImage(systemName: "heart")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}
