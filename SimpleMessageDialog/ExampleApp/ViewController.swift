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
  
  let alertButton1: UIButton = {
    let this = UIButton()
    this.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium);
    this.setTitle("Show Alert1", for: .normal);
    this.backgroundColor = .black;
    this.tag = 0;
    return this
  }()
  
  let alertButton2: UIButton = {
    let this = UIButton()
    this.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium);
    this.setTitle("Show Alert2", for: .normal);
    this.backgroundColor = .black;
    this.tag = 1;
    return this
  }()
  
  override func loadView() {
    super.loadView();
    self.view = self.mainView;
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(alertButton1);
    view.addSubview(alertButton2);

    alertButton1.frame = CGRect(x: self.view.frame.width/2-50,y: self.view.frame.height/4*1,width: 100,height: 100);
    alertButton1.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
    
    alertButton2.frame = CGRect(x: self.view.frame.width/2-50,y: self.view.frame.height/4*2,width: 100,height: 100);
    alertButton2.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside);
  }

  @objc func buttonDidTapped(sender: UIButton) {
    if (sender.tag == 0) {
      let attributedString = NSMutableAttributedString(string: "Cancel");
      attributedString.addAttribute(NSAttributedString.Key.kern, value: 2.15, range: NSRange(location: 0, length: attributedString.length - 1));
      
      let attributedString1 = NSMutableAttributedString(string: "Title");
      attributedString1.addAttributes([.backgroundColor: UIColor.green, NSAttributedString.Key.kern: 10], range: NSRange(location: 0, length: attributedString1.length))
      
      let alert = SimpleMessageDialog().alert(title: attributedString1, message: "Random Color!!!\nRandom Color!!!\nRandom Color!!!\nRandom Color!!!", cancelButtonTitle: attributedString, confirmButtonTitle: "OK") { buttonType in
        switch (buttonType) {
        case .confirm:
          self.view.backgroundColor = .random();
          self.alertButton1.backgroundColor = .random();
          self.alertButton1.setTitleColor(.random(), for: .normal);
          print("confirm")
          break;
        case .cancel:
          print("cancel")
          break;
        case .background:
          print("background")
          break;
        }
      }
            
      SimpleMessageDialog().show(topController: self, alert: alert, animated: true, presentationStyle: AnimationOptions.crossDissolve);
      
    } else if (sender.tag == 1) {
      
      let alert = SimpleMessageDialog().alert(title: nil, message: "Message", cancelButtonTitle: "Cancel", confirmButtonTitle: nil) { buttonType in
        switch (buttonType) {
        case .confirm:
          print("confirm")
          break;
        case .cancel:
          print("cancel")
          break;
        case .background:
          print("background")
          break;
        }
      }
      
      SimpleMessageDialog().show(topController: self, alert: alert, animated: true, presentationStyle: AnimationOptions.transform);
    }
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
