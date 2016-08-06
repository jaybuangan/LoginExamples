//
//  LoginButton.swift
//  Login Examples
//
//  Created by Jay on 8/5/16.
//  Copyright © 2016 Jay Buangan. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
}
