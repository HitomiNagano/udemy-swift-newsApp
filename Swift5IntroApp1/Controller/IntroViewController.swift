//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by Hitomi Nagano on 2021/04/14.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    var tutorialJsons = ["1", "2", "3", "4", "5"]
    var tutorialDescriptions = ["あいう", "かきく", "さしす", "たちつ", "なにぬ"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // ページングが出来るようにする
        scrollView.isPagingEnabled = true
        setUpScroll()
        // Lottie アニメーションの設定
        for i in 0...4 {
            let animationView = AnimationView()
            let animation = Animation.named(tutorialJsons[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        for i in 0...4 {
            let tutorialLabels = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            tutorialLabels.font = UIFont.boldSystemFont(ofSize: 15.0)
            tutorialLabels.textAlignment = .center
            tutorialLabels.text = tutorialDescriptions[i]
            scrollView.addSubview(tutorialLabels)
        }
    }
}
