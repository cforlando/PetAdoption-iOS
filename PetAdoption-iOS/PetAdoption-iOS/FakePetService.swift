//
//  FakePetService.swift
//  PetAdoption-iOS
//
//  Created by Greg Barr on 3/5/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import Foundation

class FakePetService : PetService {
    var species: [String] {
        return ["Cat", "Dog", "Error"]
    }
    
    var sizes: [String] {
        return ["S", "M", "L"]
    }
    
    func findAllPets() -> FindPetsResult {
        let result = FindPetsResult();
        let fakePetImages = FakePetService.petImages()
        
        for i in (0..<10) {
            let fakePetImageIndex = (i % fakePetImages.count)
            let pet = Pet()
            pet.petName = "Nice Cat \(i)"
            pet.petImageUrls = [
                fakePetImages[fakePetImageIndex],
                fakePetImages[fakePetImageIndex]
            ]
            result.petsFound.append(pet)
        }
        
        return result
    }
    
    func findPetsSearchingBy(query: FindPetsQuery, success: (FindPetsResult) -> Void, error: () -> Void, always: (() -> Void)?) -> Void {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            // simulate network latency
            //NSThread.sleepForTimeInterval(4)
            // simulate an error
            if query.petSpecies == "Error" {
                dispatch_async(dispatch_get_main_queue(), {
                    error()
                    always?()    // need to do in a try block in case error block throws
                })
            } else {
                // build query predicate string from query object
                let predicate = query.asPredicate()
                let matchingPets = (self.fakePetData as NSArray).filteredArrayUsingPredicate(predicate)
                let result = FindPetsResult()
                result.petsFound = matchingPets as! [Pet]
                dispatch_async(dispatch_get_main_queue(), {
                    success(result)
                    always?()    // need to do in a try block in case success block throws
                })
            }
        }
    }
    
    static func petImages() -> [String] {
        let fakePetImages = [
            "http://a.dilcdn.com/bl/wp-content/uploads/sites/8/2012/09/02-11.jpg",
            "https://pbs.twimg.com/profile_images/378800000532546226/dbe5f0727b69487016ffd67a6689e75a.jpeg",
            "http://dailytekkcom.c.presscdn.com/wp-content/uploads/2015/07/Grumpy_Cat_Endorsement-017d7-ULFU.jpg",
            "https://s-media-cache-ak0.pinimg.com/originals/5b/f0/7e/5bf07e12df991f3c01d73110b131a5fa.jpg"
        ]
        return fakePetImages
    }
    
    let fakePetData: [Pet] = {
        let basicPetData : [(String, String, String)] = [
            ("Mittens", "Cat", "S"),
            ("Lil' Smokey", "Dog", "M"),
            ("Patches", "Cat", "M"),
            ("Ruff", "Dog", "M"),
            ("Brutus", "Dog", "L")
        ]
        let fakePetImages = FakePetService.petImages()
        var petCount = 0
        let pets : [Pet] = basicPetData.map { (petName, petSpecies, petSize) in
            let pet = Pet()
            pet.petName = petName
            pet.petSpecies = petSpecies
            pet.petSize = petSize
            let fakePetImageIndex = petCount % fakePetImages.count
            pet.petImageUrls = [
                fakePetImages[fakePetImageIndex],
                fakePetImages[fakePetImageIndex]
            ]
            petCount += 1
            return pet
        }
        return pets
    }()
    
}
