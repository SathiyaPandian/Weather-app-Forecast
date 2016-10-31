//
//  NetworkHandler.swift
//  Weather app
//
//  Created by SathiyaSuresh Pandian on 10/27/16.
//  Copyright © 2016 Sathiyasuresh Pandian. All rights reserved.
//

import Foundation

func data_request(data:NSString)
{
    
    let url_to_request = data
    
    let url:URL = URL(string: url_to_request as String)!
    let session = URLSession.shared
    
    let request = NSMutableURLRequest(url: url)
    request.httpMethod = "GET"
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
    request.timeoutInterval = 10
    
   /* let task = session.dataTask(with: request, completionHandler: {
        (data, response, error) in
        
        guard let _:Data = data, let _:URLResponse = response  , error == nil else {
            print("error")
            return
        }
        
        self.extract_json_data(data!)
        
    })*/
    
   // task.resume()
    
}
