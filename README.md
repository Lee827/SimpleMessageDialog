# SimpleMessageDialog

This is a Simple Message Dialog.

# Requirements
- iOS 10.0+

- Xcode 10.0+

- Swift 5.0+

# Installation
Just add the Source folder to your project.

or use CocoaPods with Podfile:

	pod 'SimpleMessageDialog', '~> 1.1.0'
	
# Usage

	import SimpleMessageDialog

In AppDelegate.swift, set the basic appearance.

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
		
Create the dialog in your function.

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
	
AnimationOptions:

	public enum AnimationOptions {
	  case coverVertical
	  case flipHorizontal
	  case crossDissolve
	  case transform
	}
	
Default Values:

	public var blurEffectColor: UIColor = UIColor.black.withAlphaComponent(0.3);
	public var blurEffectTapEnable: Bool = true;

	public var dialogView: UIView?;
	public var dialogViewColor: UIColor = .gray;
	public var dialogViewCornerRadius: CGFloat = 0.0;
	public var dialogViewHeight:Float = 200;
	public var dialogViewWidth:Float = Float(UIScreen.main.bounds.width-24*2);

	public var titleLabel: UILabel?;
	public var titleLabelColor: UIColor = .white;
	public var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold);
	public var titleLabelHeight:Float = 20;
	public var titleLabelLeftRightInset:Float = 40;
	public var titleLabelTopInset:Float = 48;

	public var spaceBetweenTitleAndMessage:Float = 40;

	public var messageLabel: UILabel?;
	public var messageLabelColor: UIColor = .white;
	public var messageLabelFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);
	public var messageLabelHeight:Float = 40;
	public var messageLabelLeftRightInset:Float = 40;
	public var messageLabelBottomInset:Float = 48;

	public var separateHLineColor: UIColor = .white;
	public var separateVLineColor: UIColor = .white;

	public var cancelButton: UIButton?;
	public var cancelButtonColor: UIColor?;
	public var cancelButtonTitleColor: UIColor = .white;
	public var cancelButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);

	public var confirmButton: UIButton?;
	public var confirmButtonColor: UIColor?;
	public var confirmButtonTitleColor: UIColor = .white;
	public var confirmButtonFont: UIFont = UIFont.systemFont(ofSize: 13, weight: .medium);

	public var buttonHeight:Float = 56;

# License
SimpleMessageDialog is released under the MIT license. See LICENSE for details.
