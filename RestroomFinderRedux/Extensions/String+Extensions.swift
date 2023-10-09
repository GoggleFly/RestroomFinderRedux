//
//  String+Extensions.swift
//  ReduxIntro
//
//  Created by David Ash on 08/10/2023.
//

import Foundation

extension String {
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
}
