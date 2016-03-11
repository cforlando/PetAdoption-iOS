//
//  SearchForPetService.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 3/11/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class SearchForPetRequest: NSObject {
	var petSpecies : String?
	var petBreed : String?
	var petSize : String?
	var petDateOfArrival: NSDate?
	var distanceFromShelter: NSNumber?
}

class SearchForPetService: NSObject {
	
	func executeWithRequest(request: SearchForPetRequest,
		success: (SearchForPetResult) -> Void) {
		
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			let result = SearchForPetResult();
			
			// simulate an error
			if request.petSpecies == "Error" {
				result.code = .Error;
			} else {
				//This part should do an API request, no need to do any predicate stuff, we just have to build the query string
			}
			
			dispatch_async(dispatch_get_main_queue(), {
				success(result);
			});
		}
	}
}
