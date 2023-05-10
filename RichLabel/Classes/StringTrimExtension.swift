//
//  StringTrimExtension.swift
//  RichLabel
//
//  Created by fengming on 2023/5/10.
//

import Foundation

extension String {

    func trim(to maximumCharacters: Int) -> String {
        return "\(self[..<index(startIndex, offsetBy: maximumCharacters)])" + "..."
    }
}
