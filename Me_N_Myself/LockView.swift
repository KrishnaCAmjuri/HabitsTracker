//
//  LockView.swift
//  Me_N_Myself
//
//  Created by KrishnaChaitanya Amjuri on 22/08/16.
//  Copyright © 2016 Krishna Chaitanya. All rights reserved.
//

import UIKit

class PaddedTextField: UITextField {
    
    var left: CGFloat = 0
    var right: CGFloat = 0
    var bottom: CGFloat = 0
    var top: CGFloat = 0
    
    required init(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        super.init(frame: CGRectMake(0, 0, 10, 10));
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var customBounds: CGRect = super.textRectForBounds(bounds)
        customBounds.origin.x += left
        customBounds.origin.y += top
        customBounds.size.width -= (left+right)
        customBounds.size.height -= (top+bottom)
        return customBounds
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        var customBounds: CGRect = super.textRectForBounds(bounds)
        customBounds.origin.x += left
        customBounds.origin.y += top
        customBounds.size.width -= (left+right)
        customBounds.size.height -= (top+bottom)
        return customBounds
    }
}

class LockView: UIScrollView, UITextFieldDelegate {

    var textField: PaddedTextField?
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        self.scrollEnabled = false
        
        label.text = "Enter Password To Unlock"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.boldSystemFontOfSize(16)
        label.textColor = UIColor.blackColor()
        self.addSubview(label)
     
        textField = PaddedTextField(left: 10, right: 10, top: 10, bottom: 10)
        textField?.delegate = self
        textField?.placeholder = "Password"
        textField?.secureTextEntry = true
        textField?.font = UIFont.systemFontOfSize(16)
        self.addSubview(textField!)
        
        label.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY).offset(-60)
            make.height.equalTo(20)
        }
        
        textField?.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY)
            make.height.equalTo(50)
        })
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        textField?.becomeFirstResponder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height*2)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let passwd:String = textField.text {
            if passwd != "" {
                if passwd == "535251" {
                    self.removeFromSuperview()
                }
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if let userInfoDict = sender.userInfo {
            if let keyboardRect = userInfoDict[UIKeyboardFrameEndUserInfoKey] {
                if let keyboardFrame: CGRect = keyboardRect.CGRectValue() {
                    let textFieldHeight: CGFloat = UIScreen.mainScreen().bounds.size.height/2 - 25
                    self.setContentOffset(CGPointMake(0, (textFieldHeight > keyboardFrame.size.height) ? 0 : (textFieldHeight - keyboardFrame.size.height)), animated: true)
                }
            }
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.setContentOffset(CGPointMake(0, 0), animated: true)
    }
}
