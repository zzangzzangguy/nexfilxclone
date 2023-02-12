//
//  Extensions.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/08.
//

import Foundation


extension String {
    func capitalizreFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
