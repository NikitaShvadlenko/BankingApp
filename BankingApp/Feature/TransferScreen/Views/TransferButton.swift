//
//  TransferButton.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

struct TransferButton: View {
    @Binding var canTransfer: Bool
    var buttonColor: Color

    var body: some View {
        Button(L10n.TransferScreen.transfer) {
            print("Transfer Pressed")
        }
        .foregroundColor(canTransfer ? buttonColor : Color(asset: Asset.Colors.secondaryLabel))
    }
}

struct TransferButton_Previews: PreviewProvider {
    static var previews: some View {
        TransferButton(canTransfer: .constant(true), buttonColor: .blue)
    }
}
