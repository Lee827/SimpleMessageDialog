//
//  SimpleMessageDialogView.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import SnapKit

class SimpleMessageDialogView: UIView {
  struct Constants {
    static let TOP_BOTTOM_INSET: CGFloat = 16;
    static let LEFT_RIGHT_INSET: CGFloat = 24;
//    static let BUTTON_WIDTH: CGFloat = (GlobalConstants.SCREEN_WIDTH-LEFT_RIGHT_INSET*2);
    static let BUTTON_WIDTH: CGFloat = (UIScreen.main.bounds.width-LEFT_RIGHT_INSET*2);
    static let BUTTON_HEIGHT: CGFloat = 56;
  }
  
  let blurEffectView: UIView = {
    let this = UIView()
    this.backgroundColor = UIColor.black.withAlphaComponent(0.0);
    return this
  }()
//
  let dialogView: UIView = {
    let this = UIView()
//    $0.backgroundColor = ColorPalette.alertBackground.value;
    this.layer.cornerRadius = 2.0;
    this.layer.masksToBounds = true;
    this.clipsToBounds = false;
    return this
  }()

  let titleLabel: UILabel = {
    let this = UILabel()
    this.font = UIFont.systemFont(ofSize: 16, weight: .semibold);
//    $0.textColor = ColorPalette.alertText.value;
    this.textAlignment = .center;
    this.numberOfLines = 3;
    return this
  }()

  let messageLabel: UILabel = {
    let this = UILabel()
    this.font = UIFont.systemFont(ofSize: 13, weight: .medium);
//    $0.textColor = ColorPalette.alertText.withAlpha(0.5);
    this.textAlignment = .center;
    this.numberOfLines = 8;
    return this
  }()
  
  let separateHLine: UIView = {
    let this = UIView()
//    $0.backgroundColor = ColorPalette.alertSeparateLine.withAlpha(0.1);
    this.backgroundColor = .gray;
    return this
  }()

  let separateVLine: UIView = {
    let this = UIView()
//    $0.backgroundColor = ColorPalette.alertSeparateLine.withAlpha(0.1);
    this.backgroundColor = .gray;
    return this
  }()

  let cancelButton: UIButton = {
    let this = UIButton()
    this.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium);
//    $0.backgroundColor = ColorPalette.alertButton.value;
//    $0.setTitleColor(ColorPalette.alertText.withAlpha(0.5), for: .normal);
    this.tag = AlertButtonType.cancel.rawValue;
    return this
  }()
  
  let confirmButton: UIButton = {
    let this = UIButton()
    this.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium);
//    $0.backgroundColor = ColorPalette.alertButton.value;
//    $0.setTitleColor(ColorPalette.alertText.value, for: .normal);
    this.tag = AlertButtonType.confirm.rawValue;
    return this
  }()

  override init(frame: CGRect) {
    super.init(frame: frame);
    self.setupView();
  }

  func setupView() {
    setupViewConfiguration();
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    cancelButton.titleLabel?.addCharacterSpacing(kernValue: 1.5);
    confirmButton.titleLabel?.addCharacterSpacing(kernValue: 1.5);
  }
}

extension SimpleMessageDialogView: ViewConfiguration {
  func configureViews() {
    self.backgroundColor = .clear;
  }

  func buildViewHierarchy() {
    addSubview(blurEffectView);
    addSubview(dialogView);
    dialogView.addSubview(titleLabel);
    dialogView.addSubview(messageLabel);
    dialogView.addSubview(separateHLine);
    dialogView.addSubview(cancelButton);
    dialogView.addSubview(confirmButton);
    dialogView.addSubview(separateVLine);
  }

  func setupConstraints() {
    blurEffectView.snp.makeConstraints { (make) in
      make.edges.equalTo(self);
    }

    dialogView.snp.makeConstraints { (make) in
      make.left.right.equalTo(self).inset(Constants.LEFT_RIGHT_INSET);
      make.centerY.equalTo(self);
    }

    titleLabel.snp.makeConstraints { (make) in
      make.left.right.equalTo(dialogView).inset(40);
      make.top.equalTo(dialogView).inset(48);
    }

    messageLabel.snp.makeConstraints { (make) in
      make.left.right.equalTo(titleLabel);
      make.top.equalTo(titleLabel.snp.bottom).inset(-24);
      make.bottom.equalTo(cancelButton.snp.top).inset(-40);
    }

    separateHLine.snp.makeConstraints { (make) in
      make.left.right.equalTo(dialogView);
      make.bottom.equalTo(cancelButton.snp.top);
      make.height.equalTo(1);
    }

    cancelButton.snp.makeConstraints { (make) in
      make.left.equalTo(dialogView);
      make.bottom.equalTo(dialogView);
      make.height.equalTo(Constants.BUTTON_HEIGHT);
      make.width.equalTo(Constants.BUTTON_WIDTH/2);
    }

    confirmButton.snp.makeConstraints { (make) in
      make.right.equalTo(dialogView);
      make.bottom.equalTo(dialogView);
      make.height.equalTo(cancelButton);
      make.left.equalTo(cancelButton.snp.right);
    }

    separateVLine.snp.makeConstraints { (make) in
      make.centerX.equalTo(separateHLine);
      make.top.bottom.equalTo(cancelButton);
      make.width.equalTo(1);
    }
  }
}

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 1.15) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText);
      attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1));
      attributedText = attributedString;
    }
  }
}

protocol ViewConfiguration: class {
  func configureViews()
  func buildViewHierarchy()
  func setupConstraints()
  func setupViewConfiguration()
}

extension ViewConfiguration {
  func setupViewConfiguration() {
    configureViews();
    buildViewHierarchy();
    setupConstraints();
  }
}
