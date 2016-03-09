//
//  FindPetsQuery.swift
//  PetAdoption-iOS
//
//  Created by Greg Barr on 3/5/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import Foundation

class FindPetsQuery : NSObject {
    var petSpecies : String?
    var petBreed : String?
    var petSize : String?
    var petDateOfArrival: NSDate?
    var distanceFromShelter: NSNumber?
}

extension FindPetsQuery {
    static func petQueryFromFormValues(formValues: Dictionary<NSObject,AnyObject>) -> FindPetsQuery {
        func formValueForTag<T>(fieldName: String) -> T? {
            return formValues[fieldName] is NSNull ?
                nil :
                formValues[fieldName as NSObject] as! T
        }
        let petQuery = FindPetsQuery()
        petQuery.petSpecies = formValueForTag(Pet.Tag.petSpecies)
        petQuery.petBreed = formValueForTag(Pet.Tag.petBreed)
        petQuery.petSize = formValueForTag(Pet.Tag.petSize)
        petQuery.petDateOfArrival = formValueForTag(Pet.Tag.petDateOfArrival)
        petQuery.distanceFromShelter = formValueForTag(Pet.Tag.distanceFromShelter)
        return petQuery
    }
}

extension FindPetsQuery {
    
    // for "real" query support converting query object to JSON
    //func asJSON() -> String {
    
    func asPredicate() -> NSPredicate {
        var predicateParts: [String] = []
        var predicateValues: [AnyObject] = []
        func addPredicatePartForName(name: String) {
            let candidateValue: Optional = self.valueForKey(name)
            if let value = candidateValue {
                predicateParts.append("\(name) = %@")
                predicateValues.append(value)
            }
        }
        addPredicatePartForName(Pet.Tag.petSpecies)
        addPredicatePartForName(Pet.Tag.petBreed)
        addPredicatePartForName(Pet.Tag.petSize)
        addPredicatePartForName(Pet.Tag.petDateOfArrival)
        addPredicatePartForName(Pet.Tag.distanceFromShelter)
        let predicateFormat = (predicateParts as NSArray).componentsJoinedByString(" and ")
        //print("predicate format: \(predicateFormat)")
        let predicate = predicateFormat.isEmpty ?
            NSPredicate(value: true) :
            NSPredicate(format: predicateFormat, argumentArray: predicateValues)
        return predicate
    }
}