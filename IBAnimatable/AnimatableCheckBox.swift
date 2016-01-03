//
//  Created by Jake Lin on 12/20/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

@IBDesignable public class AnimatableCheckBox: UIButton, CheckBoxDesignable, CornerDesignable, FillDesignable, BorderDesignable, ShadowDesignable, MaskDesignable, Animatable {
  
  // MARK: - CheckBoxDesignable
  @IBInspectable public var checked: Bool = false {
    didSet {
      configCheckBoxChecked()
    }
  }
  
  @IBInspectable public var checkedImage: UIImage? = nil {
    didSet {
      configCheckBoxCheckedImage()
    }
  }
  
  @IBInspectable public var uncheckedImage: UIImage? = nil {
    didSet {
      configCheckBoxUncheckedImage()
    }
  }
  
  // MARK: - CornerDesignable
  @IBInspectable public var cornerRadius: CGFloat = CGFloat.NaN {
    didSet {
      configCornerRadius()
    }
  }
  
  // MARK: - FillDesignable
  @IBInspectable public var fillColor: UIColor? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var opacity: CGFloat = CGFloat.NaN {
    didSet {
      configOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable public var borderColor: UIColor?
  @IBInspectable public var borderWidth: CGFloat = CGFloat.NaN
  @IBInspectable public var borderSide: String?
  
  // MARK: - ShadowDesignable
  @IBInspectable public var shadowColor: UIColor = UIColor.clearColor() {
    didSet {
      configShadowColor()
    }
  }
  
  @IBInspectable public var shadowRadius: CGFloat = 0 {
    didSet {
      configShadowRadius()
    }
  }
  
  @IBInspectable public var shadowOpacity: CGFloat = 0 {
    didSet {
      configShadowOpacity()
    }
  }
  
  @IBInspectable public var shadowOffsetX: CGFloat = 0 {
    didSet {
      configShadowOffsetX()
    }
  }
  
  @IBInspectable public var shadowOffsetY: CGFloat = 0 {
    didSet {
      configShadowOffsetY()
    }
  }
  
  // MARK: - MaksDesignable
  @IBInspectable public var maskType: String = "" {
    didSet {
      configMask()
    }
  }
  
  // MARK: - Animatable
  @IBInspectable public var animationType: String = ""
  @IBInspectable public var autoRun: Bool = true
  @IBInspectable public var duration: Double = 0.7
  @IBInspectable public var delay: Double = 0
  @IBInspectable public var damping: CGFloat = 0.7
  @IBInspectable public var velocity: CGFloat = 0.7
  @IBInspectable public var force: CGFloat = 1
  @IBInspectable public var repeatCount: Float = 1
  
  // MARK: - Lifecycle
  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    configDesignableProperties()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    configDesignableProperties()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    autoRunAnimation()
  }
  
  public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if touchInside {
      checked = !checked
      sendActionsForControlEvents(.ValueChanged)
    }
    super.touchesEnded(touches, withEvent: event)
  }
  
  // MARK: - Private
  private func setup() {
    // No title for CheckBox
    setTitle("", forState: .Normal)
    tintColor = UIColor.clearColor()
  }
  
  private func configDesignableProperties() {
    configBorder()
  }
}
