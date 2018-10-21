//
//  Session.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

public class Session {
    public static var user: User? = nil
    
    public static func performLogin(
        success: @escaping () -> Void,
        failure: @escaping (_ error: String) -> Void
        ) {
        Session.user = User(id: 1, username: "br0ther", firstName: "Bro", lastName: "Hoe", email: "brohoe123@vro.com", karma: 100, pools: [])
        
        success()
    }
}
