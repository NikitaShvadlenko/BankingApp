//
//  AccountView.swift
//  BankingApp
//
//  Created by Nikita Shvad on 03.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import SwiftUI

struct AccountInfoView: View {
    var image: UIImage
    var accountName: String
    var amountText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .clipped()
                .background(Color(.red))

            VStack(alignment: .leading) {
                Text(accountName)
                    .font(.subheadline)

                Text(amountText)
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView(image: Asset.placeholder.image, accountName: "Flat and Charity", amountText: "$923.04")
    }
}
