//
//  presenter.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/25.
//

import UIKit

enum ProductPresenterJump {
    case jumpActive
    case jumpDetail
    case jumpWeb
}

typealias MyProductPresenterDelegate = ProductPresenterProtocol & UIViewController

protocol ProductPresenterProtocol {
    func presentGetProducts(products: [[Product]])
    
    func presentChangeProduct(indexPath: IndexPath)
    
    func jumpGotoWithType(type:ProductPresenterJump);
}

extension ProductPresenterProtocol {
    
    
    
}

class ProductPresenter {
    
    
    weak var delegate: MyProductPresenterDelegate?
    
    public func setDelegate(_ delegate: MyProductPresenterDelegate) {
        self.delegate = delegate
    }
    
    /// 获取用户网络数据
    /// - Returns: <#description#>
    public func getProducts() {
        
        
        let books = Product.getProducts()
        
        let loveBooks = books.filter { p in
            p.type == 4000
        }
        
        let classicBooks = books.filter { p in
            p.type == 2000
        }
        
        let onlineBooks = books.filter { p in
            p.type == 3000
        }
        
        let studyBooks = books.filter { p in
            p.type == 1000
        }
        
        
        let otherBooks = books.filter { p in
            p.type == 9999
        }
        
        var allBooks:[[Product]] = []
        allBooks.append(loveBooks)
        allBooks.append(classicBooks)
        allBooks.append(onlineBooks)
        allBooks.append(studyBooks)
        allBooks.append(otherBooks)

        
        
        
        self.delegate?.presentGetProducts(products: allBooks)
    }
   
    public func changeProduct(indexPath: IndexPath) {
        self.delegate?.presentChangeProduct(indexPath: indexPath)
    }
    
    public func did(indexPath: IndexPath) {
        if indexPath.row >= 10 {
            self.delegate?.jumpGotoWithType(type: .jumpDetail)
            return
        }
        if indexPath.row % 2 == 0 {
            self.delegate?.jumpGotoWithType(type: .jumpActive)
        }else {
            self.delegate?.jumpGotoWithType(type: .jumpWeb)
        }
        
    }
}
