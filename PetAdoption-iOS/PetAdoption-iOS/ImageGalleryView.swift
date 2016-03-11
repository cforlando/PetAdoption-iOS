//
//  ImageGalleryView.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/14/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class ImageGalleryView: UIView {
	@IBOutlet var imagePlacholderImageView: UIImageView!
	
	func updateWithPet(imageUrl: String) {
		let url = NSURL(string: imageUrl);
        self.imagePlacholderImageView.sd_setImageWithURL(url);
	}
	
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
