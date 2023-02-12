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

    func saveHiScore(by nameAndHiScore: [String: String]) {
        let result:[String:String] = nameAndHiScore
        storage.set(result, forKey: keyStorage)
    }

    func getHiScore() -> [String: String] {
        return storage.object(forKey: keyStorage) as? [String : String] ?? [ : ]
    }

    func resetViewCounterStorage() {
        storage.removeSuite(named: suiteName)
    }
}
