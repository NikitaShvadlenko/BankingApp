//
//  NSManagedObjectContext+Extensions.swift
//  BankingApp
//
//  Created by Nikita Shvad on 08.09.2023.
//  Copyright © 2023 Nikita Shvadlenko. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func insertObject<T: NSManagedObject>() -> T where T: Managed {
        guard let object = NSEntityDescription.insertNewObject(
            forEntityName: T.entityName,
            into: self
        ) as? T else {
            fatalError("Wrong object type")
        }
        return object
    }
}

extension NSManagedObjectContext {
    public func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }

    public func performChanges(block: @escaping() -> Void) {
        performAndWait {
            block()
            _ = self.saveOrRollback()
        }
    }
}
