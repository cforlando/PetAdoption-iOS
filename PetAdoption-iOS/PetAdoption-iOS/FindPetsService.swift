//
//  FindPetsService.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/2/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class FindPetsService: NSObject {

	func execute() -> FindPetsResult {
		let result = FindPetsResult();
		
		let pet = Pet();
		pet.petName = "Marco";
		result.petsFound.append(pet);
		
		return result;
	}
	
}
