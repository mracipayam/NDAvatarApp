//
//  AvatarViewController.swift
//  AvatarImageView
//
//  Created by Dave Glassco on 1/5/20.
//

import UIKit

@IBDesignable
public class AvatarViewController: UIView {
    
    var currentCorner: CGFloat = 0
    
    //    @IBOutlet var avatarView: UIView!
    //    @IBOutlet var avatarFrame: UIViewX!
    //    @IBOutlet public var avatarImageView: AvatarImageView!
    
    var avatarView: UIView!
    var avatarFrame: UIViewX!
    public var avatarImageView: AvatarImageView!
    
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound == true {
                setToRound()
            } else {
                setToDefault()
            }
        }
    }
    
    @IBInspectable public var cornerRoundness: CGFloat = 0 {
        didSet {
            avatarFrame.cornerRadius = cornerRoundness
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            avatarFrame.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.white {
        didSet {
            avatarFrame.borderColor = borderColor
        }
    }
    
    //MARK: - Initializers and Overrides
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        avatarView = AvatarViewController(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        self.addSubview(avatarView)
        avatarView.frame = self.bounds
        avatarView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        avatarFrame =  UIViewX(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        avatarView.addSubview(avatarFrame)
        avatarFrame.frame = self.bounds
        avatarFrame.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        avatarFrame.borderColor = UIColor.white
        avatarFrame.borderWidth = 2
        avatarFrame.cornerRadius = 30
        avatarFrame.maskToBounds = true
        
        avatarImageView =  AvatarImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        avatarFrame.addSubview(avatarImageView)
        avatarImageView.frame = self.bounds
        avatarImageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        if isRound == true {
            setToRound()
        }
        
    }
    
    public func setToRound() {
        currentCorner = avatarFrame.cornerRadius
        avatarFrame.cornerRadius = avatarView.frame.width/2
        configureRoundAvatar()
    }
    
    public func setToDefault() {
        avatarFrame.cornerRadius = 0
        configureDefaultAvatar()
    }
    
    fileprivate func configureRoundAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .circle }
        avatarImageView.configuration = Config()
    }
    
    fileprivate func configureDefaultAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .square }
        avatarImageView.configuration = Config()
    }
}
