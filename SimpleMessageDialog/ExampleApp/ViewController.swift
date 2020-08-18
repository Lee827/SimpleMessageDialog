//
//  ViewController.swift
//  ExampleApp
//
//  Created by Elmo Lee on 17/8/2020.
//  Copyright © 2020 ElmoLee. All rights reserved.
//

import UIKit
import SimpleMessageDialog

class ViewController: UIViewController {
  lazy var mainView: UIView = {
    let v = UIView(frame: self.view.frame);
    v.backgroundColor = .white;
    
    return v;
  }();
  
  let alertButton: UIButton = {
    let this = UIButton()
    this.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium);
    this.setTitle("Show Alert", for: .normal);
    this.backgroundColor = .black;
    return this
  }()
  
  override func loadView() {
    super.loadView();
    self.view = self.mainView;
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(alertButton);
    alertButton.frame = CGRect(x: 0,y: 0,width: 100,height: 100);
    alertButton.center = self.view.center;
    alertButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
    
  }

  @objc func buttonDidTapped(sender: UIButton) {
    let alert = SimpleMessageDialog().show(title: "Title", message: "Random Color!!!\nRandom Color!!!\nRandom Color!!!\nRandom Color!!!\nRandom Color!!!", cancelButtonTitle: "Cancel", confirmButtonTitle: "OK") { buttonType in
      switch (buttonType) {
      case .confirm:
        self.view.backgroundColor = .random();
        self.alertButton.backgroundColor = .random();
        self.alertButton.setTitleColor(.random(), for: .normal);
        break;
      case .cancel:
        break;
      }
    }
    self.present(alert, animated: false, completion: nil);
  }
}

extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}
