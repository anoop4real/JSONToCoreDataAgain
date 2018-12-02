//
//  ViewFactory.swift
//  UIProgramatically
//
//  Created by anoop on 2018-11-28.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory: NSObject {

    // Prepare param
    class func createTextField(with font: UIFont = UIFont.boldSystemFont(ofSize: 10.0), textColor color: UIColor = UIColor.black, align alignment: NSTextAlignment = NSTextAlignment.natural, border style: UITextField.BorderStyle = .roundedRect, password iSSecure: Bool = false ) -> UITextField {

        let textField = UITextField()
        textField.font = font
        textField.textColor = color
        textField.textAlignment = alignment
        textField.borderStyle = style
        textField.isSecureTextEntry = iSSecure
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField

    }

    class func createButton(with backgroundColor: UIColor = UIColor.white, tintColor: UIColor = UIColor.blue, cornerRadius: CGFloat = 5.0, font: UIFont = UIFont.boldSystemFont(ofSize: 10.0), textColor color: UIColor = UIColor.black) -> UIButton {

        let btn = UIButton(type: .system)
        btn.backgroundColor = backgroundColor
        btn.tintColor = tintColor
        btn.layer.cornerRadius = cornerRadius
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = font
        btn.titleLabel?.textColor = color
        return btn
    }

    class func createAView(with backgroundColor: UIColor = UIColor.white, tintColor: UIColor = UIColor.blue) -> UIView {

        let newView = UIView()
        newView.backgroundColor = backgroundColor
        newView.tintColor = tintColor
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView
    }

    class func createUILabel(with font: UIFont = UIFont.boldSystemFont(ofSize: 10.0), textColor color: UIColor = UIColor.black, align alignment: NSTextAlignment = NSTextAlignment.natural ) -> UILabel {

        let textLabel = UILabel()
        textLabel.font = font
        textLabel.textColor = color
        textLabel.textAlignment = alignment
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0

        return textLabel

    }
}
