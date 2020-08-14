//
//  SimpleMessageDialog.swift
//  SimpleMessageDialog
//
//  Created by Elmo Lee on 14/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

public class SimpleMessageDialog {
  func show(title: String?, message: String?, cancelButtonTitle: String?, confirmButtonTitle: String?, completion: @escaping (_ buttonType: AlertButtonType) -> Void) -> SimpleMessageDialogController {
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
