//
//  DeepLinkOption.swift
//  MyLifeAssistant
//
//  Created by Антон Захарченко on 01.03.2020.
//  Copyright © 2020 Антон Захарченко. All rights reserved.
//

import Foundation

struct DeepLinkURLConstants {
    static let Authorization = "authorization"
    static let Onboarding = "onboarding"
    static let HomePage = "homePage"
    static let MainNews = "mainNews"
    static let MyAccount = "myAccount"
}

enum DeepLinkOption {
    case authorization
    case onboarding
    case homePage
    case mainNews
    case myAccount
    
    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let url = userActivity.webpageURL,
            let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            //TODO: extract string and match with DeepLinkURLConstants
        }
        return nil
    }
  
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        
        switch id {
        case DeepLinkURLConstants.Authorization: return .authorization
        case DeepLinkURLConstants.Onboarding: return .onboarding
        case DeepLinkURLConstants.HomePage: return .homePage
        case DeepLinkURLConstants.MainNews: return .mainNews
        case DeepLinkURLConstants.MyAccount: return .myAccount
        default: return nil
        }
    }
}
