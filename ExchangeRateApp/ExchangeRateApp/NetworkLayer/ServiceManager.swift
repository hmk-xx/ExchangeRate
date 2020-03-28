//
//  ServiceManager.swift
//  FluperTest
//
//  Created by HARISH KUMAR on 24/02/20.
//  Copyright © 2020 Harish Kumar. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
    class func methodGETServerRequest(_ queryString: String, andParameters payload: [String: AnyObject], success: @escaping (_ response: AnyObject?) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        
        let formattedSearchString = queryString.replacingOccurrences(of: " ", with:"")
        let urlString = String(format:"%@",formattedSearchString)
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                    
                case .success:
                    print(response)
                    print(response.timeline)
                    
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as? AnyObject {
                            success(jsonResult )
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                    
                case .failure(let error):
                    
                    failure(error as NSError?)
                    
                }
        }
    }
    
    
    class func POSTServerRequest(_ queryString: String,andParameters payload: [String: Any], success: @escaping (_ response: AnyObject?) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        let formattedSearchString = queryString.replacingOccurrences(of: " ", with:"")
        let urlString = String(format:"%@", formattedSearchString)
        let parameters = payload
        
        Alamofire.request(urlString, method: .post, parameters: parameters,
                          encoding: JSONEncoding.default)
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                switch response.result {
                    
                case .success:
                    print(response)
                    print(response.timeline)
                    
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options: []) as? AnyObject {
                            
                            success(jsonResult )
                            
                        }
                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    
                    failure(error as NSError?)
                    
            }
        }
    }
}

