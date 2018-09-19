//
//  String+Flag.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 19/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation

extension String {
    
    /// Returns the flag for the given string. FR : 🇫🇷
    func flag() -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in self.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
