//
//  Helpers.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/3/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

func openWebpage(address: String, navigationController: UINavigationController?, inAppBrowser: Bool = false) {
    if inAppBrowser && navigationController != nil {
        let svc = SFSafariViewController(url: URL(string: address)!)
        navigationController?.pushViewController(svc, animated: true)
        return
    }
    if let url = URL(string: address) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
