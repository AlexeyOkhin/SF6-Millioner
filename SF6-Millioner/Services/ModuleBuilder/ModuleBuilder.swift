//
//  ModuleBuilder.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 06.02.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createRegistrerModule() -> UIViewController
    static func createGameModule() -> UIViewController
    static func createResultModule() -> UIViewController
    static func createRulesModule() -> UIViewController
    static func createFinishModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        return view
    }

    static func createRegistrerModule() -> UIViewController {
        let view = RegisterViewController()
        return view
    }

    //FIXME: - прописать свои контроллеры
    
    static func createGameModule() -> UIViewController {
        return UIViewController()
    }

    static func createResultModule() -> UIViewController {
        return UIViewController()
    }

    static func createRulesModule() -> UIViewController {
        return UIViewController()
    }

    static func createFinishModule() -> UIViewController {
        return UIViewController()
    }


}
