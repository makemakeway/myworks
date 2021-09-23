//
//  TutorialContentsViewController.swift
//  RisingcampWeek2
//
//  Created by 박연배 on 2021/09/22.
//

import UIKit

class TutorialContentsViewController: UIViewController {

    @IBOutlet weak var placeholerView: UIView!
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        self.scrollView.frame = placeholerView.bounds
        placeholerView.addSubview(scrollView)
        let tutorial = Tutorial()
        let titles = tutorial.contentTitle
        let images = tutorial.contentImages
        let manuals = tutorial.contentManual
        
        for x in 0..<4 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * placeholerView.frame.size.width, y: 0, width: placeholerView.frame.size.width, height: placeholerView.frame.size.height))
            scrollView.addSubview(pageView)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 100))
            
            let manual = UILabel(frame: CGRect(x: 10, y: 50, width: pageView.frame.size.width-20, height: 100))
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+100+10+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height - 80 - 130 - 15))
            
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-80, width: pageView.frame.size.width-20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 28)
            pageView.addSubview(label)
            label.text = titles[x]
            
            manual.textAlignment = .center
            manual.font = UIFont(name: "Helvetica-SemiBold", size: 24)
            pageView.addSubview(manual)
            manual.text = manuals[x]
            manual.adjustsFontSizeToFitWidth = true
            manual.minimumScaleFactor = 0.5
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: images[x])
            pageView.addSubview(imageView)
            
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemTeal
            button.layer.cornerRadius = 20
            button.tag = x+1
            
            if x != 3 {
                button.setTitle("다음", for: .normal)
            } else {
                button.setTitle("시작하기", for: .normal)
            }
            pageView.addSubview(button)
        }
        scrollView.contentSize = CGSize(width: placeholerView.frame.size.width * 4, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    @objc func didTapButton(_ button: UIButton) {
        guard button.tag < 4 else {
            Tutorial.shared.setTutorialCompleted()
            dismiss(animated: true, completion: nil)
            return
        }
        scrollView.setContentOffset(CGPoint(x: placeholerView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}
