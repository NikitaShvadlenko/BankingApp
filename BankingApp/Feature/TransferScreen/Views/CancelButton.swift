//
//  CancelButton.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

struct CancelButton: View {
    @Environment(\.dismiss) var dismiss
    var buttonColor: Color

    var body: some View {
        Button(L10n.TransferScreen.cancel) {
            dismiss()
        }
        .foregroundColor(buttonColor)
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(buttonColor: Color.red)
    }
}
