//
//  DecimalUtils.swift
//  Bankey
//
//  Created by justin on 2022/5/20.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
