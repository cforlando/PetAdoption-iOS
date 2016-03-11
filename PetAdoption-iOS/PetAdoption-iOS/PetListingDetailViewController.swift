//
//  PetListingDetailsViewController.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/13/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class PetListingDetailViewController: UIViewController {
	var pet : Pet!;
	@IBOutlet var containerScrollView: UIScrollView!
	@IBOutlet var imageContainerScrollView: UIScrollView!
	@IBOutlet var detailsView: UIView!
	@IBOutlet var additionalDetailsTableView: UITableView!

    override func viewDidLoad() {
		super.viewDidLoad();
		self.title = pet.petName;
		
		self.displayImages();
    }
	
	private func displayImages() {
		self.imageContainerScrollView.setNeedsLayout();
		self.imageContainerScrollView.layoutSubviews();
		
		let fullWidth : CGFloat = CGFloat(self.pet.petImageUrls.count) * self.imageContainerScrollView.frame.width;
		for (i, petImageUrl) in self.pet.petImageUrls.enumerate() {
			var xOffset = self.imageContainerScrollView.frame.width * CGFloat(i);
			
			if (xOffset != 0) {
				xOffset -= 75;
			}
			
			let currentFrameOfScreen = CGRectMake(xOffset, 0, self.imageContainerScrollView.frame.width, self.imageContainerScrollView.frame.height);
			let petImageCell = UINib(nibName: "ImageGalleryView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ImageGalleryView;
			petImageCell.frame = currentFrameOfScreen;
			petImageCell.updateWithPet(petImageUrl);
			self.imageContainerScrollView.addSubview(petImageCell);
		}
		
		self.imageContainerScrollView.contentSize = CGSizeMake(fullWidth - 150, self.imageContainerScrollView.frame.height);
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated);
		
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
