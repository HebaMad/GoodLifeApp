//
//  RatingControl.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//


import UIKit
protocol RatingControlDelegate: AnyObject {
    func categoryReviewsDidChangeRating(_ ratingControl: RatingControl, rating: Int)
}

@IBDesignable final  class RatingControl: UIStackView {
   
   //MARK: Properties
    var index:Int=0
   private var ratingButtons = [UIButton]()
    weak var delegate: RatingControlDelegate?

   var rating = 0 {
       didSet {
           updateButtonSelectionStates()
       }
   }
   
   @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
       didSet {
           setupButtons()
       }
   }
    
   
   @IBInspectable var spacingBetween: CGFloat = 10 {
       didSet {
           setupButtons()
       }
   }

   @IBInspectable var starCount: Int = 5 {
       didSet {
           setupButtons()
       }
   }
    @IBInspectable var isEnabled: Bool = true {
        didSet {
            setupButtons()
        }
    }
    
   //MARK: Initialization
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       setupButtons()
   }

   required init(coder: NSCoder) {
       super.init(coder: coder)
       setupButtons()
   }
   
   //MARK: Button Action
   
   @objc func ratingButtonTapped(button: UIButton) {
       guard let index = ratingButtons.index(of: button) else {
           fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
       }
       
       // Calculate the rating of the selected button
       let selectedRating = index + 1
       
       if selectedRating == rating {
           // If the selected star represents the current rating, reset the rating to 0.
           rating = 0
       } else {
           // Otherwise set the rating to the selected star
           rating = selectedRating
       }
       delegate?.categoryReviewsDidChangeRating(self, rating: rating)

   }
   
   
   //MARK: Private Methods
    private func setupButtons() {
        self.distribution = .fillEqually
        self.spacing = spacingBetween
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let filledStar = UIImage(systemName: "star.fill", compatibleWith: self.traitCollection)
        
        let emptyStar = UIImage(systemName:"star", compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(systemName: "star.fill", compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"

            // Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
//   private func setupButtons() {
//       self.distribution = .fillEqually
//       self.spacing = spacingBetween
//       // Clear any existing buttons
//       for button in ratingButtons {
//           removeArrangedSubview(button)
//           button.removeFromSuperview()
//       }
//       ratingButtons.removeAll()
//
//       // Load Button Images
//       let filledStar = UIImage(systemName: "star.fill", compatibleWith: self.traitCollection)
//
//       let emptyStar = UIImage(systemName:"star", compatibleWith: self.traitCollection)
//       let highlightedStar = UIImage(systemName: "star.fill", compatibleWith: self.traitCollection)
//
//       for index in 0..<starCount {
//           // Create the button
//           let button = UIButton()
//
//           // Set the button images
//           button.setImage(emptyStar, for: .normal)
//           button.setImage(filledStar, for: .selected)
//           button.setImage(highlightedStar, for: .highlighted)
//           button.setImage(highlightedStar, for: [.highlighted, .selected])
//
//           // Add constraints
//           button.translatesAutoresizingMaskIntoConstraints = false
//           button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
//           button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
//
//           // Set the accessibility label
//           button.accessibilityLabel = "Set \(index + 1) star rating"
//
//
//           // Setup the button action
//           if isEnabled{
//               button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
//
//           }
//
//           // Add the button to the stack
//           addArrangedSubview(button)
//
//           // Add the new button to the rating button array
//           ratingButtons.append(button)
//       }
//
//       updateButtonSelectionStates()
//
//   }
   
   private func updateButtonSelectionStates() {
       for (index, button) in ratingButtons.enumerated() {
           // If the index of a button is less than the rating, that button should be selected.
           button.isSelected = index < rating
           
           // Set accessibility hint and value
           let hintString: String?
           if rating == index + 1 {
               hintString = "Tap to reset the rating to zero."
           } else {
               hintString = nil
           }

           let valueString: String
           switch (rating) {
           case 0:
               valueString = "No rating set."
           case 1:
               valueString = "1 star set."
           default:
               valueString = "\(rating) stars set."
           }
           
           button.accessibilityHint = hintString
           button.accessibilityValue = valueString
       }
   }
}
