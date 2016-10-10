//
//  LinkViewVC.swift
//  My-fav-movies
//
//  Created by Kacper Kowalski on 03.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit
import WebKit

class LinkViewVC: UIViewController {
    
    @IBOutlet weak var cointaner: UIView!
    var webView: WKWebView!
    var link: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        cointaner.addSubview(webView)
        loadrequest(link)
        
     
        }
    
    func loadrequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    
    
    
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, cointaner.bounds.width, cointaner.bounds.height)
        webView.frame = frame
        
    }


    
    
    

   
    }

// OTHER OPTION
//  webView = WKWebView()
//cointaner.addSubview(webView)
//if let lnk = link, url = NSURL(string: lnk) {
  //  let request = NSURLRequest(URL: url)
   // webView.loadRequest(request)
// } else {
   // print("not found")
