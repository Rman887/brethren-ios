//
//  Pool.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

/* A pool that users belong to. */
public class Pool {
    public let id: Int
    
    public var users: [User]
    
    public init(id: Int, users: [User]) {
        self.id = id
        self.users = users
    }
}
