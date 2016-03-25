//
//  FindPetsService.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/2/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class FindPetsService: NSObject {
	
	func execute(success: (FindPetsResult) -> Void) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
			//Should do an API request, instead, we'll be using test data
			let result = FindPetsResult();
			let fakePetImages = [
				"https://40.media.tumblr.com/tumblr_lszizpc70p1r4reyqo1_400.jpg",
				"https://www.petfinder.com/wp-content/uploads/2012/11/99059361-choose-cat-litter-632x475.jpg",
				"https://www.petfinder.com/wp-content/uploads/2012/11/152177319-declawing-cats-632x475-e1354303246526-632x353.jpg",
				"https://drpem3xzef3kf.cloudfront.net/photos/pets/34616851/1/?bust=1457267217&width=632&no_scale_up=1",
				"https://drpem3xzef3kf.cloudfront.net/photos/pets/34599481/3/?bust=1457574231&width=632&no_scale_up=1"
			];
			
			let fakePetNames = [
				"Sunny & Eliza",
				"Grumpy",
				"Athena",
				"Kuda",
				"Skye"
			];
			
			let fakePetAttributeConcat = [
				"Cat - Male & Female - 4 Months - Ocelot",
				"Cat - Female - 1yr - Mixed",
				"Cat - Male - 2yr - Mixed",
				"Dog - Female - Baby - Shepherd Mix",
				"Dog - Female - Baby - Shepherd Mix"
			];
			
			var fakePetImageIndex = 0;
			for _ in 0..<10 {
				let pet = Pet();
				pet.petName = fakePetNames[fakePetImageIndex];
				pet.petAttributeText = fakePetAttributeConcat[fakePetImageIndex];
				pet.petImageUrls = [
					fakePetImages[fakePetImageIndex],
					fakePetImages[fakePetImageIndex],
					fakePetImages[fakePetImageIndex],
					fakePetImages[fakePetImageIndex]
				];
				pet.petAttributes = [
					PetAttribute(title: "Breed", value: "Mixed"),
					PetAttribute(title: "Sex", value: "Male"),
					PetAttribute(title: "Age", value: "1 year"),
					PetAttribute(title: "Contact Name", value: "Marco Ledesma"),
					PetAttribute(title: "Contact Phone", value: "555-555-5555"),
					PetAttribute(title: "Location", value: "33 Real Address, Orlando FL"),
				];
				
				fakePetImageIndex += 1;
				
				if (fakePetImageIndex >= fakePetImages.count)
				{
					fakePetImageIndex = 0;
				}
				
				result.petsFound.append(pet);
			}
			//end test data
			
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				success(result);
			});
		};
		
	}
	
}
