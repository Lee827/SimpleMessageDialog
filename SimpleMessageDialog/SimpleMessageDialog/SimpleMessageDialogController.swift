//
//  SimpleMessageDialogController.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit

public class SimpleMessageDialogController: UIViewController {
  lazy var mainView: SimpleMessageDialogView = {
    let v = SimpleMessageDialogView(frame: self.view.frame);

    v.cancelButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
    v.confirmButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)));
    v.blurEffectView.addGestureRecognizer(tap);

    return v;
  }();

  var _title:StringOrAttributedString? = nil;
  var _message:StringOrAttributedString? = nil;
  var _cancelTitle:StringOrAttributedString? = nil;
  var _confirmTitle:StringOrAttributedString? = nil;

  var buttonAction: ((_ buttonType: AlertButtonType) -> Void)?;

  var _AnimationOption:AnimationOptions = AnimationOptions.crossDissolve;
  var _animated:Bool = true;

  public override func loadView() {
    super.loadView();
    self.view = self.mainView;
  }

  public override func viewDidLoad() {
    super.viewDidLoad()

    if (self._animated) {
      switch _AnimationOption {
      case .coverVertical, .flipHorizontal:
        self.mainView.blurEffectView.layer.opacity = 0;
        break
      case .crossDissolve:
        break
      case .transform:
        self.mainView.blurEffectView.layer.opacity = 0;
        self.mainView.dialogView.layer.opacity = 0;
        self.mainView.dialogView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1);
        break
      }
    }
    
    setInfo();
  }
  
  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated);
    if (self._animated) {
      UIView.animate(
        withDuration: 0.05,
        delay: 0,
        options: .curveEaseInOut,
        animations: {
          
          switch self._AnimationOption {
          case .coverVertical, .flipHorizontal:
            self.mainView.blurEffectView.layer.opacity = 1;
            break
          case .crossDissolve:
            break
          case .transform:
            self.mainView.blurEffectView.layer.opacity = 1;
            self.mainView.dialogView.layer.opacity = 1;
            self.mainView.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
            break
          }
      })
    }
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainView.titleLabel.text = "";
    mainView.titleLabel.attributedText = nil;
    mainView.messageLabel.text = "";
    mainView.messageLabel.attributedText = nil;
    
    mainView.cancelButton.setTitle("", for: .normal);
    mainView.cancelButton.setAttributedTitle(nil, for: .normal);
    mainView.confirmButton.setTitle("", for: .normal);
    mainView.confirmButton.setAttributedTitle(nil, for: .normal);
    
    mainView.cancelButton.removeTarget(self, action: nil, for: .touchUpInside);
    mainView.confirmButton.removeTarget(self, action: nil, for: .touchUpInside);
        
    mainView.dialogView.snp.removeConstraints()
    mainView.titleLabel.snp.removeConstraints()
    mainView.messageLabel.snp.removeConstraints()
    mainView.cancelButton.snp.removeConstraints()
    mainView.confirmButton.snp.removeConstraints()
    
    mainView.dialogView.isHidden = false;
    mainView.titleLabel.isHidden = false;
    mainView.messageLabel.isHidden = false;
    mainView.cancelButton.isHidden = false;
    mainView.confirmButton.isHidden = false;
  }
  
  func setInfo() {
    if (_title == nil) {
      mainView.titleLabel.snp.updateConstraints { (make) in
        make.top.equalTo(mainView.dialogView).inset(0);
      }
      mainView.titleLabel.isHidden = true;
    } else if (_title is NSAttributedString) {
      mainView.titleLabel.attributedText = _title as? NSAttributedString ?? nil;
    } else {
      mainView.titleLabel.text = _title as? String ?? "";
    }
    
    if (_message == nil) {
      mainView.messageLabel.snp.updateConstraints { (make) in
        make.top.equalTo(mainView.titleLabel.snp.bottom).inset(0);
      }
      mainView.messageLabel.isHidden = true;
    } else if (_message is NSAttributedString) {
      mainView.messageLabel.attributedText = _message as? NSAttributedString ?? nil;
    } else {
      mainView.messageLabel.text = _message as? String ?? "";
    }
    
    if (_cancelTitle == nil) {
      mainView.cancelButton.isHidden = true;
      mainView.separateVLine.isHidden = true;
      mainView.cancelButton.snp.updateConstraints { (make) in
        make.width.equalTo(0);
      }
      
    } else if (_cancelTitle is NSMutableAttributedString) {
      mainView.cancelButton.setAttributedTitle(_cancelTitle as? NSMutableAttributedString, for: .normal);
    } else {
      mainView.cancelButton.setTitle(_cancelTitle as? String ?? "", for: .normal);
    }
    
    if (_confirmTitle == nil) {
      mainView.confirmButton.isHidden = true;
      mainView.separateVLine.isHidden = true;
      mainView.cancelButton.snp.updateConstraints { (make) in
        make.width.equalTo(SimpleMessageDialog.appearance.basic.dialogViewWidth);
      }

    } else if (_confirmTitle is NSMutableAttributedString) {
      mainView.confirmButton.setAttributedTitle(_confirmTitle as? NSMutableAttributedString ?? nil, for: .normal);
    } else {
      mainView.confirmButton.setTitle(_confirmTitle as? String ?? "", for: .normal);
    }
    
    if (_cancelTitle == nil && _confirmTitle == nil) {
      mainView.separateHLine.isHidden = true;
      mainView.cancelButton.snp.updateConstraints { (make) in
        make.height.equalTo(0);
      }
      mainView.confirmButton.snp.updateConstraints { (make) in
        make.height.equalTo(0);
      }
    }
  }
  
  // MARK: Button Handle

  @objc func buttonDidTapped(sender: UIButton) {
    dismissDialog(tag: sender.tag);
  }
  
  @objc func handleTap(_ sender: UITapGestureRecognizer) {
    guard let getTag = sender.view?.tag else { return }
    dismissDialog(tag: getTag);
  }
  
  func dismissDialog(tag: Int) {
    if (self._animated) {
      switch self._AnimationOption {
      case .coverVertical, .flipHorizontal, .crossDissolve:
        self.mainView.blurEffectView.layer.opacity = 0;
        self.dismiss(animated: true);
        guard let type = AlertButtonType(rawValue: tag) else { return; }
        self.buttonAction?(type);
        break
      case .transform:
        UIView.animate(
          withDuration: 0.2,
          delay: 0,
          options: .curveEaseInOut,
          animations: {
            self.mainView.blurEffectView.layer.opacity = 0;
            self.mainView.dialogView.layer.opacity = 0;
            self.mainView.dialogView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1);
        }) { (_) in
          self.dismiss(animated: false);
          guard let type = AlertButtonType(rawValue: tag) else { return; }
          self.buttonAction?(type);
        }
        break
      }
    } else {
      self.dismiss(animated: false);
      guard let type = AlertButtonType(rawValue: tag) else { return; }
      self.buttonAction?(type);
    }
  }

  public override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
