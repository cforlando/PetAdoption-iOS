//
//  CustomHomeCollectionViewFlowLayout.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/2/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class CustomHomeCollectionViewFlowLayout: UICollectionViewFlowLayout {
	override init() {
		super.init()
		setupLayout()
	}
	
	override var itemSize: CGSize {
		set {
			
		}
		get {
			let itemWidth = CGRectGetWidth(self.collectionView!.frame) * 0.95;
			return CGSizeMake(itemWidth, itemWidth * 0.6);
		}
	}
 
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupLayout()
	}
 
	func setupLayout() {
		minimumInteritemSpacing = 10
		minimumLineSpacing = 10
		scrollDirection = .Vertical
	}
}
