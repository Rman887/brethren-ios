//
//  Session.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

public let baseURL = ""

public let accountCreateURL = baseURL + ""
public let loginURL = baseURL + ""

public class Session {
    public static var user: User? = nil
    
    public static func performLogin(username: String, password: String,
        success: @escaping (_ response: String) -> Void,
        failure: @escaping (_ error: String) -> Void
        ) {

        Http.postRequest(url: loginURL, parameters: [
            "username": username,
            "password": password
            ],
        resolve: { string, response in
            DispatchQueue.main.async { success(string) }
        }, reject: { error in
            DispatchQueue.main.async { failure("Connection") }
        })
    }
    
    public static func createAccount(username: String, password: String,
                                              email: String, firstName: String, lastName: String,
                                              success: @escaping (_ response: String) -> Void,
                                              failure: @escaping (_ error: String) -> Void) {
        Http.postRequest(url: accountCreateURL, parameters: [
            "username": username,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
            ],
        resolve: { string, response in
            DispatchQueue.main.async { success(string) }
        }, reject: { error in
            DispatchQueue.main.async { failure("Connection") }
        })
    }
}
