//
//  TransferScreenView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

struct TransferScreenView: View {
    @State var canTransfer: Bool = false
    var buttonColor: Color = Color.blue

    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle(L10n.TransferScreen.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        CancelButton(buttonColor: buttonColor)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        TransferButton(canTransfer: $canTransfer, buttonColor: buttonColor)
                    }
                }
        }
    }
}

struct TransferScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TransferScreenView()
    }
}
