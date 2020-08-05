//
//  ProductsVC.swift
//  coder-swag
//
//  Created by Min Thet Maung on 05/08/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.delegate = self
        productsCollection.dataSource = self
    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProduct(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = productsCollection.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
            
        return ProductCell()
    }

}
