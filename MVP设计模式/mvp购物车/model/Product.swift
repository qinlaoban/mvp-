//
//  User.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/25.
//

import Foundation

struct Price {
    var price: Double = 0.0
}

struct Product {
    var name: String
    var desc: String
    var type: Int = 0

    var calc = Price()

    static func getProducts() -> [Product] {
        return [
            Product(name: "红宝书", desc: "英文", type: 1000, calc: Price(price: 98)),
            Product(name: "三年高考", desc: "英文", type: 1000, calc: Price(price: 89)),

            Product(name: "三国", desc: "经典名著", type: 2000, calc: Price(price: 54.5)),
            Product(name: "水浒", desc: "经典名著", type: 2000, calc: Price(price: 22.5)),
            Product(name: "红楼梦", desc: "经典名著", type: 2000, calc: Price(price: 43)),
            Product(name: "西游记", desc: "经典名著", type: 2000, calc: Price(price: 32)),

            Product(name: "诛仙", desc: "网络小说", type: 3000, calc: Price(price: 56)),
            Product(name: "明朝那些事儿", desc: "网络小说", type: 3000, calc: Price(price: 43)),

            Product(name: "回到明朝当王爷", desc: "言情小说", type: 4000, calc: Price(price: 18.4)),
            Product(name: "微微一笑", desc: "言情小说", type: 4000, calc: Price(price: 35.4)),
            
            Product(name: "十万个为什么", desc: "禁书", type: 9999, calc: Price(price: 35.4)),
        ]
    }
}
