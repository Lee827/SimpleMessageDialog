//
//  SimpleMessageDialogController.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit

public enum AlertButtonType: Int, CaseIterable {
  case cancel = 0, confirm;
}

public class SimpleMessageDialogController: UIViewController {
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

  public override func loadView() {
    super.loadView();
    self.view = self.mainView;
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.mainView.blurEffectView.layer.opacity = 0;
    self.mainView.dialogView.layer.opacity = 0;

    mainView.titleLabel.text = _title;
    mainView.messageLabel.text = _message;
    mainView.cancelButton.setTitle(_cancelTitle, for: .normal);
    mainView.confirmButton.setTitle(_confirmTitle, for: .normal);
    
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

  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated);
    UIView.animate(
      withDuration: 0.1,
      delay: 0,
      options: .curveEaseInOut,
      animations: {
        self.mainView.blurEffectView.layer.opacity = 1;
        self.mainView.dialogView.layer.opacity = 1;
    })
  }

  // MARK: Button Handle

  @objc func buttonDidTapped(sender: UIButton) {
    self.mainView.blurEffectView.layer.opacity = 0;
    self.dismiss(animated: true);
    guard let type = AlertButtonType(rawValue: sender.tag) else { return; }
    self.buttonAction?(type);
  }

  public override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
