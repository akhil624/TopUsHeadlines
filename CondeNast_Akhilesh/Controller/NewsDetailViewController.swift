//
//  NewsDetailViewController.swift
//  CondeNast_Akhilesh
//
//  Created by Akhilesh Kumar Singh on 09/02/22.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var webViewNews: WKWebView!
    
    var urlNews = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load complete news
        if let url = URL.init(string: urlNews) {
            let urlReq = URLRequest.init(url: url)
                self.webViewNews.load(urlReq)
        }
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
