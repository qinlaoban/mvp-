//
//  ViewController.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
    }
    
    

    @IBAction func mvc_click(_ sender: Any) {
        let vc = MVCShoppingCarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func mvp_click(_ sender: Any) {
        let vc = MVPViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

