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
    static let BUTTON_WIDTH: CGFloat = (UIScreen.main.bounds.width-LEFT_RIGHT_INSET*2);
    static let BUTTON_HEIGHT: CGFloat = 56;
  }

  let blurEffectView: UIView = {
    let this = UIView()
    this.backgroundColor = SimpleMessageDialog.appearance.basic.blurEffectColor;
    return this
  }()

  let dialogView: UIView = SimpleMessageDialog.appearance.basic.dialogView ?? {
    let this = UIView()
    this.backgroundColor = SimpleMessageDialog.appearance.basic.dialogViewColor;
    this.layer.cornerRadius = SimpleMessageDialog.appearance.basic.dialogViewCornerRadius;
    this.layer.masksToBounds = true;
    this.clipsToBounds = true;
    return this
  }()
    
  let titleLabel: UILabel = SimpleMessageDialog.appearance.basic.titleLabel ?? {
    let this = UILabel()
    this.font = SimpleMessageDialog.appearance.basic.titleLabelFont;
    this.textColor = SimpleMessageDialog.appearance.basic.titleLabelColor;
    this.textAlignment = .center;
    this.numberOfLines = 3;
    return this
  }()

  let messageLabel: UILabel = SimpleMessageDialog.appearance.basic.messageLabel ?? {
    let this = UILabel()
    this.font = SimpleMessageDialog.appearance.basic.messageLabelFont;
    this.textColor = SimpleMessageDialog.appearance.basic.messageLabelColor;
    this.textAlignment = .center;
    this.numberOfLines = 8;
    return this
  }()
  
  let separateHLine: UIView = {
    let this = UIView()
    this.backgroundColor = SimpleMessageDialog.appearance.basic.separateHLineColor;
    return this
  }()

  let separateVLine: UIView = {
    let this = UIView()
    this.backgroundColor = SimpleMessageDialog.appearance.basic.separateVLineColor;
    return this
  }()

  let cancelButton: UIButton = SimpleMessageDialog.appearance.basic.cancelButton ?? {
    let this = UIButton()
    this.titleLabel?.font = SimpleMessageDialog.appearance.basic.cancelButtonFont;
    this.backgroundColor = SimpleMessageDialog.appearance.basic.cancelButtonColor ?? SimpleMessageDialog.appearance.basic.dialogViewColor;
    this.setTitleColor(SimpleMessageDialog.appearance.basic.cancelButtonTitleColor, for: .normal);
    return this
  }()
  
  let confirmButton: UIButton = SimpleMessageDialog.appearance.basic.confirmButton ?? {
    let this = UIButton()
    this.titleLabel?.font = SimpleMessageDialog.appearance.basic.confirmButtonFont;
    this.backgroundColor = SimpleMessageDialog.appearance.basic.confirmButtonColor ?? SimpleMessageDialog.appearance.basic.dialogViewColor;
    this.setTitleColor(SimpleMessageDialog.appearance.basic.confirmButtonTitleColor, for: .normal);
    return this
  }()

  override init(frame: CGRect) {
    super.init(frame: frame);
    self.setupView();
  }

  func setupView() {
    cancelButton.tag = AlertButtonType.cancel.rawValue;
    confirmButton.tag = AlertButtonType.confirm.rawValue;
    setupViewConfiguration();
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
