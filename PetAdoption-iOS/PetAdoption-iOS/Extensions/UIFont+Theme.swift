//
//  FontExtension.swift
//  PetAdoption-iOS
//
//  Created by Marco Ledesma on 3/12/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

extension UIFont {
	static func themeLightFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: "OpenSans-Light", size: size)!;

	}
	
	static func themeNormalFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: "OpenSans", size: size)!;
		}
}
