//
//  ProductsVC.swift
//  coder-swag
//
//  Created by Min Thet Maung on 05/08/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController {
    
    private(set) public var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProduct(forCategoryTitle: category.title)
    }


}
