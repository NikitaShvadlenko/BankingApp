//
//  PlaceholderStore.swift
//  BankingApp
//
//  Created by Nikita Shvad on 28.08.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class PlaceholderStore: StoresPlaceholders {
    func placeholderImageData() -> Data {
        guard let data = Asset.placeholder.image.pngData() else {
            fatalError("Placeholder image does not exist")
        }
        return data
    }
}
