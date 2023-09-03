//
//  TransferTopBar.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

struct TransferTopBar: View {
    var buttonColor: Color
    var backgroundColor: Color
    var body: some View {
        HStack {
            Text(L10n.TransferScreen.from)
                .foregroundColor(buttonColor)
                .padding(.leading, 16)
            Spacer()
            Text(L10n.TransferScreen.to)
                .foregroundColor(buttonColor)
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 20,
            maxHeight: 20
        )
        .background(backgroundColor)
    }
}

struct TransferTopBar_Previews: PreviewProvider {
    static var previews: some View {
        TransferTopBar(buttonColor: .white, backgroundColor: .indigo)
    }
}
