import Foundation
import UIKit

final class NavigationBar: UIView {
    
    private static let NIB_NAME = "NavigationBar"
    @IBOutlet private var view: UIView!
    @IBOutlet  weak var leftButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var rightFirstButton: UIButton!
    @IBOutlet private weak var rightSecondButton: UIButton!
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isLeftButtonHidden: Bool {
        set {
            leftButton.isHidden = newValue
        }
        get {
            return leftButton.isHidden
        }
    }
    
    var isRightFirstButtonEnabled: Bool {
        set {
            rightFirstButton.isEnabled = newValue
        }
        get {
            return rightFirstButton.isEnabled
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [ view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),])
    }
}






extension UIView
{
   static var nib: UINib
   {
      return UINib(nibName: "\(self)", bundle: nil)
   }

   static func instantiateFromNib() -> Self?
   {
      return nib.instantiate() as? Self
   }
}

extension UINib
{
   func instantiate() -> Any?
   {
      return instantiate(withOwner: nil, options: nil).first
   }
}
