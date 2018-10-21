//
//  Session.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

public let baseURL = "http://35.237.90.250"

public let accountCreateURL = baseURL + "/account/register/"
public let loginURL = baseURL + "/account/login/"
public let logoutURL = baseURL + ""

public let userURL = baseURL + ""
public let poolURL = baseURL + ""

public let poolsForUserURL = baseURL + ""
public let usersForPoolURL = baseURL + ""

public class Session {
    public static var user: User? = nil
    public static var authToken: String? = nil
    
    public static func performLogin(username: String, password: String,
        success: @escaping (_ response: [String: Any]) -> Void,
        failure: @escaping (_ error: String) -> Void
        ) {

        Http.postRequest(url: loginURL, parameters: [
            "username": username,
            "password": password
            ],
        resolve: { data, response in
            DispatchQueue.main.async {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                let object = json as? [String: Any]
                success(object ?? [:])
            }
        }, reject: { error in
            DispatchQueue.main.async { failure("Connection") }
        })
    }
    
    public static func createAccount(username: String, password: String,
                                              email: String, firstName: String, lastName: String,
                                              success: @escaping (_ response: [String: Any]) -> Void,
                                              failure: @escaping (_ error: String) -> Void) {
        Http.postRequest(url: accountCreateURL, parameters: [
            "username": username,
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password1": password,
            "password2": password
            ],
        resolve: { data, response in
            DispatchQueue.main.async {
                var string = String(data: data, encoding: .utf8)!
                print("====")
                print(string)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                let object = json as? [String: Any]
                success(object ?? [:])
            }
        }, reject: { error in
            DispatchQueue.main.async { failure("Connection") }
        })
    }
}
