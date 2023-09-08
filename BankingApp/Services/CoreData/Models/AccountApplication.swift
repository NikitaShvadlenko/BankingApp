//
//  AccountApplication.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import Foundation
import CoreData

public final class AccountApplication: NSManagedObject {

    @NSManaged
    fileprivate(set) var date: Date

    @NSManaged
    fileprivate(set) var accountType: String

    @NSManaged
    fileprivate(set) var monthlyFee: Double

    static func insert(
        into context: NSManagedObjectContext,
        accountType: String,
        monthlyFee: Double
    ) {
        context.performChanges {
            let accountApplication: AccountApplication = context.insertObject()
            accountApplication.accountType = accountType
            accountApplication.monthlyFee = monthlyFee
            accountApplication.date = Date()
        }
    }
}

extension AccountApplication: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(date), ascending: false)]
    }
}
