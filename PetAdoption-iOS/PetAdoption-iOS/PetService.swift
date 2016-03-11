//
//  PetService.swift
//  PetAdoption-iOS
//
//  Created by Greg Barr on 3/5/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import Foundation

protocol PetService {
    var species: [String] { get }
    var sizes: [String] { get }
    func findAllPets() -> FindPetsResult
    func findPetsSearchingBy(query: FindPetsQuery, success: (FindPetsResult) -> Void, error: () -> Void, always: (() -> Void)? ) -> Void
}

extension PetService {
    // convenience: if caller's don't have anything to do in the "always" callback
    // they can pass only the success and error callbacks
    func findPetsSearchingBy(query: FindPetsQuery, success: (FindPetsResult) -> Void, error: () -> Void) -> Void {
        self.findPetsSearchingBy(query, success: success, error: error, always: nil)
    }
}