//
//  AppDelegate.swift
//  ExampleApp
//
//  Created by Elmo Lee on 17/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit
import SimpleMessageDialog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
 
    SimpleMessageDialog.appearance.basic.blurEffectColor = UIColor.black.withAlphaComponent(0.5);
    SimpleMessageDialog.appearance.basic.dialogViewColor = .darkGray;
    SimpleMessageDialog.appearance.basic.dialogViewCornerRadius = 8.0;
    
    SimpleMessageDialog.appearance.basic.messageLabel = {
      let this = UILabel()
      this.font = UIFont.systemFont(ofSize: 22, weight: .semibold);
      this.textColor = .red;
      this.textAlignment = .center;
      this.numberOfLines = 0;

      return this
    }()
    
    SimpleMessageDialog.appearance.basic.confirmButton = {
      let this = UIButton()
      this.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium);
      this.backgroundColor = .red
      
      return this
    }()
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

