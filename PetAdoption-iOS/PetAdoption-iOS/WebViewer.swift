//
//  WebViewer.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/10/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import UIKit
import WebKit

class WebViewer: UIViewController, WKNavigationDelegate {
    let webview = WKWebView()
    let url:URL
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    init(withURL:URL) {
        self.url = withURL
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        webview.load(URLRequest(url: url))
        webview.navigationDelegate = self
        view.backgroundColor = .white
        activityIndicator.color = .darkGray
        title = "loading..."
        view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finished loading \(webview.title)")
        self.title = webview.title
        self.view = webview
        activityIndicator.stopAnimating()
    }
    
}
