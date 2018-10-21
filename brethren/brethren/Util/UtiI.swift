//
//  Util.swift
//  brethren
//
//  Created by Arman Siddique on 10/21/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import Foundation

public func isOnlyLetters(str: String) -> Bool {
    for c in str {
        if c < "A" || (c > "Z" && c < "a") || c > "z" {
            return false
        }
    }
    
    return true
}
