//
//  TransactionType.swift
//  Kuleta
//
//  Created by Erblin Berisha on 10/16/17.
//  Copyright © 2017 Erblin Berisha. All rights reserved.
//

import Foundation

struct TransactionType {
    
    var incomeTypes = ["Rroga", "Dhurate"]
    var expenseTypes = ["Shendetsi", "Femije"]
    
    enum TheType {
        case income((Bool) -> Bool)
        case expenxe((Bool) -> Bool)
    }
}
