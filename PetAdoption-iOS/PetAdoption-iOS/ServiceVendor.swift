//
//  ServiceVendor.swift
//  PetAdoption-iOS
//
//  Created by Greg Barr on 3/5/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import Foundation

class ServiceVendor {
    static var petService: PetService = FakePetService()
    //    static var petService: PetService = RealPetService()
}
