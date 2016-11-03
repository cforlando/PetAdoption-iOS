//
//  DateExtension.swift
//  PetAdoption-iOS
//
//  Created by Tom Marks on 21/08/2016.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import Foundation

extension DateFormatter {
    class func ISO8601Formatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
}
