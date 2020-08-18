//
//  SimpleMessageDialog.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit

public class SimpleMessageDialog {
  public static var appearance = Appearance()

  public init() {}

  public func show(title: String?, message: String?, cancelButtonTitle: String?, confirmButtonTitle: String?, completion: @escaping (_ buttonType: AlertButtonType) -> Void) -> SimpleMessageDialogController {
    let alert = SimpleMessageDialogController();
    alert.modalTransitionStyle = .crossDissolve;
    alert.modalPresentationStyle = .overFullScreen;
    alert._title = title;
    alert._message = message;
    alert._cancelTitle = cancelButtonTitle;
    alert._confirmTitle = confirmButtonTitle;
    alert.buttonAction = completion;

    return alert;
  }
}

extension SimpleMessageDialog {
  public struct Appearance {
    // The basic configuration
    public var basic = Configuration()
    
    public struct Configuration {
      public var blurEffectColor: UIColor = UIColor.black.withAlphaComponent(0.3);
      
      public var dialogView: UIView?;
      public var dialogViewColor: UIColor = .gray;
      public var dialogViewCornerRadius: CGFloat = 0.0;
      
      public var titleLabel: UILabel?;
      public var titleLabelColor: UIColor = .white;
      public var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold);
      
      public var messageLabel: UILabel?;
      public var messageLabelColor: UIColor = .white;
      public var messageLabelFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
      
      public var separateHLineColor: UIColor = .white;
      public var separateVLineColor: UIColor = .white;
      
      public var cancelButton: UIButton?;
      public var cancelButtonColor: UIColor?;
      public var cancelButtonTitleColor: UIColor = .white;
      public var cancelButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
      
      public var confirmButton: UIButton?;
      public var confirmButtonColor: UIColor?;
      public var confirmButtonTitleColor: UIColor = .white;
      public var confirmButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
    }
  }
}

