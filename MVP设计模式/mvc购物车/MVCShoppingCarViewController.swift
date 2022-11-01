//
//  MVCShoppingCarViewController.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/26.
//

import UIKit

class MVCShoppingCarViewController: UIViewController {
    private var products:[Product] = []
    let tableView = UITableView()

    deinit {
        print("MVCShoppingCarViewController ...deinit .....")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "MVCShoppingCarViewController"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CalcCell", bundle: nil), forCellReuseIdentifier: "calc")
        
        getProduct()
        
    }
    
    func getProduct()  {
        products = Product.getProducts()
        tableView.reloadData()
    }
    
    func updateProduct(indexPath:IndexPath)  {
        var p = self.products[indexPath.row]
        p.calc.price = p.calc.price + 1
        self.products[indexPath.row] = p
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        tableView.frame = view.bounds
    }

 
}
extension MVCShoppingCarViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = self.products[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "calc", for: indexPath) as! CalcCell
        
        
        cell.updateWithProduct(product: product)
        
        
        cell.block = {[weak self]   in
            guard let self = self else {
                return
            }
            self.updateProduct(indexPath: indexPath)
            
            
            
        }
        return cell
    }
    
    
}
