//
//  String.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/25.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import Foundation

protocol StringOptionalProtocol {}

extension String: StringOptionalProtocol {}

extension Optional where Wrapped: StringOptionalProtocol {

    /// nilまたは空文字の場合はtrueを返す
    var isNilOrEmpty: Bool {
        if let str = self as? String {
            return str.isEmpty
        }
        return true
    }

    /// nilでない且つ空文字でない場合はtrueを返す
    var isNotNilAndNotEmpty: Bool {
        return !isNilOrEmpty
    }
}
