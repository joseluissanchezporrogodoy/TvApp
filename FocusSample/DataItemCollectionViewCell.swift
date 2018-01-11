/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 A `UICollectionViewCell` subclass used to display `DataItem`s within `UICollectionView`s.
 */

import UIKit

class DataItemCollectionViewCell: UICollectionViewCell {
    // MARK: Properties
    
    static let reuseIdentifier = "DataItemCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var focusUp: UIImageView!
    var focusDown: UIImageView!
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // These properties are also exposed in Interface Builder.
        imageView.adjustsImageWhenAncestorFocused = true
        imageView.clipsToBounds = false
        //Set to focus
        self.imageView.adjustsImageWhenAncestorFocused = true
        
        //Set focus images
        let focusHeight: CGFloat = 10.0
        focusUp = UIImageView()
        focusUp.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: focusHeight)
        focusUp.image = UIImage(named:"Rectangle")
        
        focusDown = UIImageView()
        focusDown.frame = CGRect(x: 0.0, y: imageView.frame.height - focusHeight, width: frame.width, height: focusHeight)
        focusDown.image = UIImage(named:"Rectangle")
        label.alpha = 0.0
    }
    
    // MARK: UICollectionReusableView
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset the label's alpha value so it's initially hidden.
        label.alpha = 0.0
    }
    
    
    // MARK: UIFocusEnvironment
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        /*
         Update the label's alpha value using the `UIFocusAnimationCoordinator`.
         This will ensure all animations run alongside each other when the focus
         changes.
         */
        coordinator.addCoordinatedAnimations({
            if self.isFocused {
                self.label.alpha = 1.0
                self.addFocusBars()
            }
            else {
                self.label.alpha = 0.0
                self.removeFocusBars()
            }
        }, completion: nil)
    }
    // MARK: Focus bar methods
    
    private func addFocusBars(){
        /// When Cell is focus add bars
        self.imageView.overlayContentView.addSubview(focusUp)
        self.imageView.overlayContentView.addSubview(focusDown)
    }
    private func removeFocusBars(){
        /// When Cell is not focus remove bars
        self.focusUp.removeFromSuperview()
        self.focusDown.removeFromSuperview()
    }
}

