//
//  CalcCell.swift
//  MVP设计模式
//
//  Created by qin on 2022/10/25.
//

import UIKit

typealias handler = ()->()

class CalcCell: UITableViewCell {
    
    var block:handler?
    
    var  product:Product!
    
    @IBOutlet weak var num: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addNum(_ sender: Any) {
        
        self.block?()

        
        
    }
    
    
    @IBAction func minusNum(_ sender: Any) {
        print("minus")
        self.block?()
        

    }
    
    func updateWithProduct(product:Product)  {
        self.textLabel?.text = product.name
        self.num.text = "价格是：\(product.calc.price)"
        self.product = product
    }
    
    
  
    
}
