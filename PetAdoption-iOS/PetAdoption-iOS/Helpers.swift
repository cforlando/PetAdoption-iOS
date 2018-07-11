//
//  Helpers.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/3/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import UIKit

func openWebpage(address: String, navigationController: UINavigationController?, inAppBrowser: Bool = false) {
    guard let url = URL(string: address) else { return }
    if inAppBrowser && navigationController != nil {
        let webviewer = WebViewer(withURL: url)
        navigationController?.pushViewController(webviewer, animated: true)
        return
    } else { // open in external browser / app
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
