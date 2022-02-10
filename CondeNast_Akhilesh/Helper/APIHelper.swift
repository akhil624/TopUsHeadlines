//
//  APIHelper.swift
//  News
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import Foundation


final class APIHelper {
    
    class func getAction<D : Decodable>(_ url: String, _ decodeObj :D.Type, completion: @escaping((_ success: Bool, _ result: D?) -> Void)) {
        
        guard let serviceUrl = URL.init(string: url) else {
            return
        }
        var request = URLRequest.init(url: serviceUrl)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let jsonData = data {
                do {
                    let topUsHeadlineResponse = try JSONDecoder().decode(decodeObj.self, from: jsonData)
                    completion(true, topUsHeadlineResponse)
                } catch let error {
                    print(error.localizedDescription)
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
        }
        task.resume()
        
    }
}
