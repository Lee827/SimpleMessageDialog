# SimpleMessageDialog

This is a Simple Message Dialog.

![image](https://github.com/Lee827/SimpleMessageDialog/blob/master/Sample%20Picture/p1.png)
![image](https://github.com/Lee827/SimpleMessageDialog/blob/master/Sample%20Picture/p2.png)![image](https://github.com/Lee827/SimpleMessageDialog/blob/master/Sample%20Picture/p3.png)
![image](https://github.com/Lee827/SimpleMessageDialog/blob/master/Sample%20Picture/p4.png)![image](https://github.com/Lee827/SimpleMessageDialog/blob/master/Sample%20Picture/p5.png)

# Requirements
- iOS 12.0+

- Xcode 10.0+

- Swift 5.0+

# Installation
Just add the Source folder to your project.

or use CocoaPods with Podfile:

	pod 'SimpleMessageDialog', '~> 1.2.2'
	
# Usage
```js
import SimpleMessageDialog
```
In AppDelegate.swift, set the basic appearance.

```js
SimpleMessageDialog.appearance.basic.blurEffectColor = UIColor.black.withAlphaComponent(0.5);
SimpleMessageDialog.appearance.basic.dialogViewColor = .darkGray;
SimpleMessageDialog.appearance.basic.dialogViewCornerRadius = 8.0;

SimpleMessageDialog.appearance.basic.messageLabel = {
  let this = UILabel()
  this.font = UIFont.systemFont(ofSize: 22, weight: .semibold);
  this.textColor = .black;
  this.textAlignment = .center;
  this.numberOfLines = 0;

  return this
}()
    
SimpleMessageDialog.appearance.basic.confirmButton = {
  let this = UIButton()
  this.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium);
  this.backgroundColor = .red;
      
  return this
}()
```		
Create the dialog in your function.
```js
let attributedString = NSMutableAttributedString(string: "Cancel");
attributedString.addAttribute(NSAttributedString.Key.kern, value: 2.15, range: NSRange(location: 0, length: attributedString.length - 1));
      
// Support String and AttributedString
let alert = SimpleMessageDialog().alert(title: nil, message: "Message!!!", cancelButtonTitle: attributedString, confirmButtonTitle: "OK") { buttonType in
	//Button Handle
	switch (buttonType) {
	case .confirm:
	 break;
	case .cancel:
	 break;
	case .background:
	 break;
	}
 }

SimpleMessageDialog().show(topController: self, alert: alert, animated: true, presentationStyle: AnimationOptions.crossDissolve);
```
AnimationOptions:
```js
public enum AnimationOptions {
  case coverVertical
  case flipHorizontal
  case crossDissolve
  case transform
}
```
Default Values:
```js
public var blurEffectColor: UIColor = UIColor.black.withAlphaComponent(0.3);
public var blurEffectTapEnable: Bool = true;

public var dialogView: UIView?; // Priority use
public var dialogViewColor: UIColor = .gray;
public var dialogViewCornerRadius: CGFloat = 0.0;
public var dialogViewHeight: CGFloat = 200;
public var dialogViewWidth: CGFloat = UIScreen.main.bounds.width-24*2;

public var titleLabel: UILabel?; // Priority use
public var titleLabelColor: UIColor = .white;
public var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .bold);
public var titleLabelHeight: CGFloat = 26;
public var titleLabelLeftRightInset: CGFloat = 20;
public var titleLabelTopInset: CGFloat = 32;

public var spaceBetweenTitleAndMessage: CGFloat = 15;

public var messageLabel: UILabel?; // Priority use
public var messageLabelColor: UIColor = .white;
public var messageLabelFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
public var messageLabelHeight: CGFloat = 40;
public var messageLabelLeftRightInset: CGFloat = 20;
public var messageLabelBottomInset: CGFloat = 55;

public var separateHLineColor: UIColor = .clear;
public var separateVLineColor: UIColor = .clear;

public var cancelButton: UIButton?; // Priority use
public var cancelButtonColor: UIColor = .lightGray;
public var cancelButtonTitleColor: UIColor = .white;
public var cancelButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);

public var confirmButton: UIButton?; // Priority use
public var confirmButtonColor: UIColor = .lightGray;
public var confirmButtonTitleColor: UIColor = .white;
public var confirmButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);

public var buttonViewHeight: CGFloat = 72;
public var buttonSpacing: CGFloat = 11.0;
public var buttonViewLeftInset: CGFloat = 32.0;
public var buttonViewRightInset: CGFloat = 32.0;
public var buttonViewTopInset: CGFloat = 0.0;
public var buttonViewBottomInset: CGFloat = 24.0;
```
# License
SimpleMessageDialog is released under the MIT license. See LICENSE for details.
