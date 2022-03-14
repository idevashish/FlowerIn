//
//  UIView+Helpers.swift
//  FlowerIn
//
//  Created by Ashish Shukla on 14/03/22.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addView(_ view: UIView, toTop: Bool, withHeight height: CGFloat = 1.0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let leadingConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        
        let topOrBottomConstraint: NSLayoutConstraint
        if toTop {
            topOrBottomConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        } else {
            topOrBottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        }
        
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        addConstraints([leadingConstraint, trailingConstraint, topOrBottomConstraint, heightConstraint])
    }
    
    func makeCircular() {
        self.layer.cornerRadius = self.bounds.width/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.0
        self.clipsToBounds = true
    }
}

@IBDesignable extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UIView {
    func rotate(degrees: CGFloat, clockwise: Bool = false) {
        let x = CGFloat(180 / degrees)
        if (clockwise) {
            self.transform = CGAffineTransform(rotationAngle: CGFloat.pi / x)
        } else {
            self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / x)
        }
    }
}

extension UIView {
    
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            frame.origin.x = newValue - frame.width
        }
    }
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            frame.origin.y = newValue - frame.height
        }
    }
    
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center.y = newValue
        }
    }
}


