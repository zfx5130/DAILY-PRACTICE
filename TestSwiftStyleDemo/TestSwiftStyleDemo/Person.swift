//
//  Person.swift
//  TestSwiftStyleDemo
//
//  Created by admin on 2017/12/7.
//  Copyright © 2017年 fuxing. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var numbers: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        
        func test() -> String {
            
            switch self {
            case .ace:
                return "adsf"
            case .eight:
                return "asdf"
            case .five:
                return "3435"
            default:
                 return String(self.rawValue)
            }
        }
    }
    
}
