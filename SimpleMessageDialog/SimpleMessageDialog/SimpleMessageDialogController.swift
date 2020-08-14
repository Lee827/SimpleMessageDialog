//
//  SimpleMessageDialogController.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit

enum AlertButtonType: Int, CaseIterable {
  case cancel = 0, confirm;
}

class SimpleMessageDialogController: UIViewController {
  lazy var mainView: SimpleMessageDialogView = {
    let v = SimpleMessageDialogView(frame: self.view.frame);

    v.cancelButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
    v.confirmButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);

    return v;
  }();

  var _title:String? = "";
  var _message:String? = "";
  var _cancelTitle:String? = "";
  var _confirmTitle:String? = "";

  var buttonAction: ((_ buttonType: AlertButtonType) -> Void)?;

  override func loadView() {
    super.loadView();
    self.view = self.mainView;
  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    self.mainView.dialogView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1);
//    self.mainView.dialogView.layer.opacity = 0;

    mainView.titleLabel.text = _title;
    mainView.messageLabel.text = _message;
    mainView.cancelButton.setTitle(_cancelTitle?.uppercased(), for: .normal);
    mainView.confirmButton.setTitle(_confirmTitle?.uppercased(), for: .normal);

    if (_title == nil || _title == "" || _message == nil || _message == "") {
      mainView.messageLabel.snp.updateConstraints { (make) in
        make.top.equalTo(mainView.titleLabel.snp.bottom).inset(0);
      }
    }

    if (_cancelTitle == nil || _cancelTitle == "") {
      mainView.cancelButton.snp.updateConstraints { (make) in
        make.width.equalTo(0);
      }
      mainView.separateVLine.isHidden = true;
    }

    if (_confirmTitle == nil || _confirmTitle == "") {
      mainView.cancelButton.snp.updateConstraints { (make) in
        make.width.equalTo(SimpleMessageDialogView.Constants.BUTTON_WIDTH);
      }
      mainView.separateVLine.isHidden = true;
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated);
//    UIView.animate(
//      withDuration: 0.2,
//      delay: 0,
//      options: .curveEaseInOut,
//      animations: {
//        self.mainView.blurEffectView.backgroundColor = UIColor.black.withAlphaComponent(0.5);
//        self.mainView.dialogView.layer.opacity = 1;
//        self.mainView.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    })
  }

  // MARK: Button Handle

  @objc func buttonDidTapped(sender: UIButton) {
//    UIView.animate(
//      withDuration: 0.2,
//      delay: 0,
//      options: .curveEaseInOut,
//      animations: {
//        self.mainView.blurEffectView.backgroundColor = UIColor.black.withAlphaComponent(0);
//        self.mainView.dialogView.layer.opacity = 0;
//
//    }) { (_) in
      self.dismiss(animated: true);
      guard let type = AlertButtonType(rawValue: sender.tag) else { return; }
      self.buttonAction?(type);
//    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
