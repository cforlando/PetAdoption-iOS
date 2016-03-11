//
//  BaseResult.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 3/11/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

enum ResultCode : Int {
	case Success = 200
	case Error = 500
}

class BaseResult: NSObject {
	var code : ResultCode = ResultCode.Success;
	var message : String?;
}
