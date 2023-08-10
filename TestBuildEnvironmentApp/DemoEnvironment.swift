//
//  DemoEnvironment.swift
//  TestBuildEnvironmentApp
//
//  Created by ebpearls on 08/08/2023.
//

import Foundation

enum DemoEnvironment {
    private static let infoDict: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist is not found")
        }
        return dict
    }()
    
    static let apiKey: String = {
        guard let key = DemoEnvironment.infoDict["Api_key"] as? String else {
            fatalError("Api key is not found")
        }
        return key
    }()
}
