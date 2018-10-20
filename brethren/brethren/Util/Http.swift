//
//  Http.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation


class Http {
    
    public static func join(parameters: [String: String]) -> String {
        if parameters.isEmpty { return "" }
        var items = [String]()
        for (key, value) in parameters { items.append("\(key)=\(value)") }
        return items.joined(separator: "&")
    }
    
    /** Generate a POST request to a URL. */
    public static func post(url: String, parameters: [String: String]=[:]) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = Http.join(parameters: parameters).data(using: .utf8)
        return request
    }
    
    /** Generate a GET request to a URL. */
    public static func get(url: String, parameters: [String: String]=[:]) -> URLRequest {
        let get = Http.join(parameters: parameters)
        var request = URLRequest(url: URL(string: url + "?" + get)!)
        request.httpMethod = "GET"
        return request
    }
    
}


/* The core manager for making asynchronous web requests. */
public class Requests {
    
    private static var session: URLSession = URLSession(configuration: .default)
    
    /* Reset the session. */
    public class func reset() {
        self.session.finishTasksAndInvalidate()
        self.session = URLSession(configuration: .default)
    }
    
    /* Make an HTTP request expecting a plaintext response. */
    public class func make(
        with request: URLRequest,
        resolve: @escaping (_ string: String, _ response: HTTPURLResponse) -> Void,
        reject: @escaping (_ error: Error?) -> Void) {
        
        // Make the data request
        self.session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response as? HTTPURLResponse, let data = data {
                let string = String(data: data, encoding: .utf8)!
                resolve(string, response)
            } else { reject(error) }
        }).resume()
    }
    
}
