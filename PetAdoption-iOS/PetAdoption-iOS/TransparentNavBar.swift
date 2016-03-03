//
//  TransparentNavBar.swift
//  PetAdoption-iOS
//
//  Created by Keli'i Martin on 3/3/16.
//  Copyright © 2016 Code For Orlando. All rights reserved.
//

import UIKit

@IBDesignable
class TransparentNavBar: UINavigationBar
{
    override func drawRect(rect: CGRect)
    {
        self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.shadowImage = UIImage()
        self.translucent = true
    }

}
