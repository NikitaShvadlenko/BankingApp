//
//  CoreDataService.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import CoreData

public final class CoreDataService {
    public var context: NSManagedObjectContext
    public var container: NSPersistentContainer

    public static let shared = CoreDataService()

    private init() {
        self.container = NSPersistentContainer(name: Constants.openAccountContainer.rawValue)
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Failed to load store: \(String(describing: error))")
            }
        }
        self.context = container.viewContext
    }

    private enum Constants: String {
        case openAccountContainer = "OpenAccountDataStorage"
    }

}
