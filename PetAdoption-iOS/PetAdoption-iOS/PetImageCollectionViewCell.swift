//
//  PetImageView.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/2/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit
import SDWebImage;

class PetImageCollectionViewCell: UICollectionViewCell {
	static let DID_TAP_ON_PET_CELL_NOTIFICATION = "DID_TAP_ON_PET_CELL_NOTIFICATION";
	
	@IBOutlet var petNameTextContainer: UIView!
	@IBOutlet var petImageView: UIImageView!
	@IBOutlet var petNameText: UILabel!
	
	private var didSetTapEvent = false;
	var pet : Pet!;
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		
		
	}
	
	func updateWithPet(pet: Pet) {
		self.pet = pet;
		self.petNameText.text = pet.petName;
		self.petImageView.sd_setImageWithURL(NSURL(string: pet.petImageUrls[0]), placeholderImage: UIImage(named: "Image Placeholder"));
		self.petImageView.contentMode = UIViewContentMode.ScaleAspectFill;
		
		if (!didSetTapEvent) {
			didSetTapEvent = true;
			let imageTapGesture = UITapGestureRecognizer(target: self, action: "didTap");
			let labelTapGesture = UITapGestureRecognizer(target: self, action: "didTap");
			self.petImageView.addGestureRecognizer(imageTapGesture);
			self.petNameTextContainer.addGestureRecognizer(labelTapGesture);
		}
	}
	
	@objc
	private func didTap() {
		UIView.animateWithDuration(0.1, animations: { () -> Void in
			self.petImageView.alpha = 0.5;
			
			}) { (complete) -> Void in
				NSNotificationCenter.defaultCenter().postNotificationName(PetImageCollectionViewCell.DID_TAP_ON_PET_CELL_NOTIFICATION, object: self.pet);
				
				if (complete) {
					self.petImageView.alpha = 1;
					UIView.animateWithDuration(0.2, animations: { () -> Void in
						
					});
				}
		};
	}
	
}
