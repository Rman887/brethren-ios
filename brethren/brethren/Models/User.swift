//
//  User.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

/* A user of the app. Holds account information. */
public class User {
    
    public let id: Int
    
    public var username: String
    public var firstName: String
    public var lastName: String
    public var email: String
    
    public var pools: [Pool]
    
    public init(id: Int, username: String, firstName: String, lastName: String, email: String,
                pools: [Pool]) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.pools = pools
    }
}
