//
//  LikeCommentLoader.swift
//  CondeNast_Akhilesh
//
//  Created by Akhilesh Kumar Singh on 09/02/22.
//

import Foundation
import UIKit

let labelCache = NSCache<AnyObject, AnyObject>()

class LabelLoader: UILabel {
    
    // Likes
    func loadLikeWithID(_ id: String) {

        let urls = APIs.likes + id
        guard let url = URL.init(string: urls) else { return}

        self.text = ""

        // retrieves image if already available in cache
        if let likes = labelCache.object(forKey: url as AnyObject) {
            let likeCount = likes.object(forKey: "likes") as? Int ?? 0
            self.text = "\(likeCount)" + " Likes"
            return
        }

        // image does not available in cache.. so retrieving it from url...
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                print(error as Any)
                return
            }

            DispatchQueue.main.async(execute: {
                
                do {
                    let response = try JSONSerialization.jsonObject(with: data ?? Data(), options: []) as AnyObject
                    if let like = response.object(forKey: "likes") as? Int {
                        self.text = "\(like) Likes"
                    }
                    labelCache.setObject(response, forKey: url as AnyObject)
                } catch let error {
                    print(error.localizedDescription)
                }
            })
        }).resume()
    }
    
    // Comments
    func loadCommentsWithID(_ id: String) {
        
        let urls = APIs.comments + id
        guard let url = URL.init(string: urls) else { return}

        self.text = ""

        // retrieves image if already available in cache
        if let comments = labelCache.object(forKey: url as AnyObject) {
            let commentCount = comments.object(forKey: "comments") as? Int ?? 0
            self.text = "\(commentCount) Comments"
            return
        }

        // image does not available in cache.. so retrieving it from url...
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                print(error as Any)
                return
            }

            DispatchQueue.main.async(execute: {
                
                do {
                    let response = try JSONSerialization.jsonObject(with: data ?? Data(), options: []) as AnyObject
                    if let comment = response.object(forKey: "comments") as? Int {
                        self.text = "\(comment) Comments"
                    }
                    labelCache.setObject(response, forKey: url as AnyObject)
                } catch let error {
                    print(error.localizedDescription)
                }
            })
        }).resume()
    }
}
