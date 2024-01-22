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

  public func alert(title: StringOrAttributedString?, message: StringOrAttributedString?, cancelButtonTitle: StringOrAttributedString?, confirmButtonTitle: StringOrAttributedString?, completion: @escaping (_ buttonType: AlertButtonType) -> Void) -> SimpleMessageDialogController {
    let alert = SimpleMessageDialogController();
    
    alert.modalPresentationStyle = .overFullScreen;
    alert._title = title;
    alert._message = message;
    alert._cancelTitle = cancelButtonTitle;
    alert._confirmTitle = confirmButtonTitle;
    alert.buttonAction = completion;

    return alert;
  }
  
  public func show(topController: UIViewController, alert: SimpleMessageDialogController, animated: Bool, presentationStyle: AnimationOptions = AnimationOptions.crossDissolve) {
    var _animated = animated;
    alert._AnimationOption = presentationStyle;
    alert._animated = _animated;
    switch presentationStyle {
    case .coverVertical:
      alert.modalTransitionStyle = .coverVertical;
      break
    case .flipHorizontal:
      alert.modalTransitionStyle = .flipHorizontal;
      break
    case .crossDissolve:
      alert.modalTransitionStyle = .crossDissolve;
      break
    case .transform:
      alert._animated = _animated;
      _animated = false;
      break
    }
    
    topController.present(alert, animated: _animated, completion: nil);
  }
}

public enum AlertButtonType: Int, CaseIterable {
  case cancel = 0, confirm, background;
}

public enum AnimationOptions {
    case coverVertical
    case flipHorizontal
    case crossDissolve
    case transform
}

public protocol StringOrAttributedString { }
extension NSMutableAttributedString: StringOrAttributedString { }
extension String: StringOrAttributedString { }

extension SimpleMessageDialog {  
  public struct Appearance {
    // The basic configuration
    public var basic = Configuration()
        
    public struct Configuration {
      public var blurEffectColor: UIColor = UIColor.black.withAlphaComponent(0.3);
      public var blurEffectTapEnable: Bool = true;

      public var dialogView: UIView?;
      public var dialogViewColor: UIColor = .gray;
      public var dialogViewCornerRadius: CGFloat = 0.0;
      public var dialogViewHeight: Float = 200;
      public var dialogViewWidth: Float = Float(UIScreen.main.bounds.width-24*2);

      public var titleLabel: UILabel?;
      public var titleLabelColor: UIColor = .white;
      public var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .bold);
      public var titleLabelHeight: Float = 26;
      public var titleLabelLeftRightInset: Float = 20;
      public var titleLabelTopInset: Float = 32;
      
      public var spaceBetweenTitleAndMessage:Float = 15;

      public var messageLabel: UILabel?;
      public var messageLabelColor: UIColor = .white;
      public var messageLabelFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
      public var messageLabelHeight: Float = 40;
      public var messageLabelLeftRightInset: Float = 20;
      public var messageLabelBottomInset: Float = 55;

      public var separateHLineColor: UIColor = .clear;
      public var separateVLineColor: UIColor = .clear;
      
      public var cancelButton: UIButton?;
      public var cancelButtonColor: UIColor = .lightGray;
      public var cancelButtonTitleColor: UIColor = .white;
      public var cancelButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
      
      public var confirmButton: UIButton?;
      public var confirmButtonColor: UIColor = .lightGray;
      public var confirmButtonTitleColor: UIColor = .white;
      public var confirmButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
      
      public var buttonViewHeight: Float = 72;
      public var buttonSpacing: CGFloat = 11.0;
      public var buttonViewLeftInset: Float = 32.0;
      public var buttonViewRightInset: Float = 32.0;
      public var buttonViewTopInset: Float = 0.0;
      public var buttonViewBottomInset: Float = 24.0;
    }
  }
}
