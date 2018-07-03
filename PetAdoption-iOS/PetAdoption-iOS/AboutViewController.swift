//
//  AboutViewController.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/3/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func codeForOrlandoTapped(_ sender: UIButton) {
        openWebpage(address: "http://www.codefororlando.com")
    }
    
    @IBAction func sourceCodeTapped(_ sender: Any) {
    }
    
    private func openWebpage(address: String) {
        if let url = URL(string: address) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
