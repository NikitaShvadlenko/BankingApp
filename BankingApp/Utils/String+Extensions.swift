//
//  String+Extensions.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit.UIFont
import Foundation

extension String {

    func formattedAsAcount() -> String {
        var result = ""

        let chunkLengths = [2, 4, 7, 2]
        var currentIndex = 0

        for chunkLength in chunkLengths {

            let start = self.index(self.startIndex, offsetBy: currentIndex)
            let end = self.index(
                start, offsetBy: chunkLength,
                limitedBy: self.endIndex
            ) ?? self.endIndex
            let chunk = String(self[start..<end])

            result += chunk

            if end != self.endIndex {
                result += "-"
            }
            currentIndex += chunkLength
        }
        return result
    }

    func bulletPointStyle(bulletPointFont: UIFont, textFont: UIFont) -> NSAttributedString {
        let bulletPointAttributes: [NSAttributedString.Key: Any] = [
            .font: bulletPointFont
        ]
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: textFont
        ]
        let bulletPointString = NSMutableAttributedString()
        let bulletPoints = self.split(separator: "\n")
        for bullet in bulletPoints {
            let bulletAttributedString = NSMutableAttributedString(string: "• ", attributes: bulletPointAttributes)
            let textAttributedString = NSAttributedString(string: String(bullet) + "\n", attributes: textAttributes)

            bulletAttributedString.append(textAttributedString)
            bulletPointString.append(bulletAttributedString)
        }

        return bulletPointString
    }
}
