//
//  HiScoreStorage.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 06.02.2023.
//

import Foundation

struct HiScoreStorage {

    //MARK: - Nested Types

    private enum Error: Swift.Error {
        case storagePlistWasNotFound
    }

    //MARK: - Private Properties

    private let storage: UserDefaults
    private let keyStorage = "hiScore"
    private let suiteName = "com.HiScoreStorage"

    //MARK: -  Initialization

    init() throws {
        guard let storage = UserDefaults(suiteName: suiteName) else {
            throw Error.storagePlistWasNotFound
        }
        self.storage = storage
    }

    //MARK: - Internal Methods

    func saveHiScore(by name: String, new hiScore: Int) {
        let result = "\(name) -- \(hiScore)"
        storage.set(result, forKey: keyStorage)
    }

    func getHiScore() -> String? {
        return storage.string(forKey: keyStorage)
    }
    
    func getAmountOfStorage() -> Int {
        return storage.dictionaryRepresentation().filter {(key, value) in
            return key == self.keyStorage
        }.values.count
    }
    
    func getDataFromStorage() {
        print(storage.dictionaryRepresentation().filter {(key, value) in
            return key == self.keyStorage
        }.values)
    }

    func resetViewCounterStorage() {
        storage.removeSuite(named: suiteName)
    }
}
