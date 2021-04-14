//
//  BaseViewController.swift
//  Swift5IntroApp1
//
//  Created by Hitomi Nagano on 2021/04/14.
//

import UIKit
import SegementSlide

// 参考；https://qiita.com/nkekisasa222/items/135b20cc7a8a49652cbc
class BaseViewController: SegementSlideDefaultViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // SegementSlide
        reloadData()
        defaultSelectedIndex = 0
    }

    // @see https://github.com/Jiar/SegementSlide/blob/1883c5edb6cdcb6bb4b0dccddd6ee3f11ee9d385/Example/Main/Mine/MineViewController.swift
    override func segementSlideHeaderView() -> UIView {
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let headerHeight: CGFloat
        if #available(iOS 11.0, *) {
            headerHeight = view.bounds.height/4+view.safeAreaInsets.top
        } else {
            headerHeight = view.bounds.height/4+topLayoutGuide.length
        }
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        return headerView
    }
    
    // スライドのタイトルを決める
    override var titlesInSwitcher: [String] {
        return ["TOP", "Abema", "Yahoo", "IT", "Buzz", "CNN"]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {

        switch index {
        case 0:
            return Page1TableViewController()
        case 1:
            return Page2TableViewController()
        case 2:
            return Page3TableViewController()
        case 3:
            return Page4TableViewController()
        case 4:
            return Page5TableViewController()
        case 5:
            return Page6TableViewController()
        default:
            return Page1TableViewController()
        }
    }
}
