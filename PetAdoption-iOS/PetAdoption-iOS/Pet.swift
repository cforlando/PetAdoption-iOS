//
//  Pet.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 2/2/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

class Pet: NSObject {
    struct Tag {
        static let petSpecies = "petSpecies"
        static let petBreed = "petBreed"
        static let petSize = "petSize"
        static let petDateOfArrival = "petDateOfArrival"
        static let distanceFromShelter = "distanceFromShelter"
    }
    
    var petName : String!
	var petAttributeText: String?;
    var petImageUrls : [String]!
    
    var petSpecies : String!
    var petBreed : String!
    var petSize : String!
    var petDateOfArrival: NSDate!
    
    var petShelter: Shelter!
	
	var petAttributes : [PetAttribute]!;
}

class PetAttribute {
	let attributeTitle : String;
	let attributeValue : String;
	
	init(title: String, value: String)
	{
		self.attributeTitle = title;
		self.attributeValue = value;
	}
}