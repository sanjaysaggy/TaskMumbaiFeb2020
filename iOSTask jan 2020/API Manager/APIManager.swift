//
//  APIManager.swift
//  episode 22
//
//  Created by apple on 20/08/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire




class APIManager{
    
    
    static let sharedInstance   =   APIManager()
    
   private init(){
        
    }
    
    func getUsersFromUrl(onCompletion:(JSON)-> Void) {
 
         let url =   NSURL(string: Base_URL)
        let request =   NSMutableURLRequest(url: url! as URL)
        request.httpMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
           
            Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    print(swiftyJsonVar)
                }
            }
             
        }
        
       
        func string (_ dict:NSDictionary, _ key:String) -> String {
            if let title = dict[key] as? String {
                return "\(title)"
            } else if let title = dict[key] as? NSNumber {
                return "\(title)"
            } else {
                return ""
            }
        }
        
    }
    
 
        
    
    

