//
//  MVPViewController.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/25.
//

import UIKit

class MVPViewController: UIViewController, ProductPresenterProtocol {
   
    
    private let tableView = ShopingCarTableView()
    private var presenter = ProductPresenter()
    private var allBooks:[[Product]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UINib(nibName: "CalcCell", bundle: nil), forCellReuseIdentifier: "calc")
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter.setDelegate(self)
        presenter.getProducts()
    }
    
 
    
    deinit {
        print("MVPViewController deinit ")
    }
    
    // MARK: - presenter
    
    func presentAlert(title: String, mes: String) {
        
        tableView.reloadData()
    }
    
    func presentGetProducts(products: [[Product]]) {
        
        self.allBooks = products
        tableView.reloadData()
    }
    
    func presentChangeProduct(indexPath: IndexPath) {
        var p = self.allBooks[indexPath.section][indexPath.row]
        p.calc.price = p.calc.price + 1
        self.allBooks[indexPath.section][indexPath.row] = p
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func jumpGotoWithType(type: ProductPresenterJump) {
        print("跳转....、\(type)")
        
        let vc = ShopingCarDetailViewController()
        vc.title = String(describing: type)
        navigationController?.pushViewController(vc, animated: true)
    }
   
    
   
}


extension MVPViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return allBooks.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allBooks[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allBooks[section][0].desc
    }
    
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = self.allBooks[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "calc", for: indexPath) as! CalcCell
        
        
        cell.updateWithProduct(product: product)
        
        
        cell.block = {[weak self]   in
            guard let self = self else {
                return
            }
           
            self.presenter.changeProduct(indexPath: indexPath)
            
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.did(indexPath: indexPath)
    }

}


