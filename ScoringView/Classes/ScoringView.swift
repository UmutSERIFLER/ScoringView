//
//  ScoringView.swift
//  ScoringView
//
//  Created by Umut SERIFLER on 18/01/2021.
//

import UIKit

public class ScoringView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    private(set) var minimumValue: Int = 0
    private(set) var maximumValue: Int = 100
    private(set) var amount: Int = 5
    private(set) var space: Int = 5
    open var value: Int = 0
    
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commontInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commontInit()
    }
    
    public func generate(for: ContentType = .star, backgroundColor: UIColor = .clear, minLimitValue: Int = 0, maxLimitValue: Int = 100, amount: Int = 5, space: Int = 10, axis: NSLayoutConstraint.Axis = .vertical) {
        self.addSubview(stackView)
        self.setLimits(min: minLimitValue, max: maxLimitValue)
        self.setAmount(value: amount)
        self.stackView.spacing = CGFloat(space)
        self.stackView.backgroundColor = backgroundColor
        self.stackView.axis = (axis == .vertical) ? .vertical : .horizontal
        self.createContents()
    }
    
    private func setLimits(min: Int = 0, max: Int = 100) {
        self.minimumValue = min
        self.maximumValue = max
    }
    
    private func setAmount(value: Int = 5) {
        self.amount = value
    }
    
    private func createContents(for: ContentType = .star) {
        let calculatedButtonSize = self.calculateButtonWidthHeight()
        for order in 0...(self.amount - 1) {
            let origin = CGPoint(x: 0, y: (Int(calculatedButtonSize.width) * order))
            let buttonRect = CGRect(origin: origin, size: calculatedButtonSize)
            let button = self.buttonGenerator(tag: order, type: .star, frame: buttonRect)
            self.stackView.addArrangedSubview(button)
        }
    }
    
    private func calculateButtonWidthHeight() -> CGSize {
        let buttonWidth = Int(Double(self.frame.width - (self.stackView.spacing * CGFloat((self.amount - 1)))) / Double(self.amount))
        let buttonHeight = Int(self.frame.height)
        let widthOrHeight = (buttonWidth > buttonHeight) ? buttonHeight : buttonWidth
        return CGSize(width: widthOrHeight, height: widthOrHeight)
    }
    
    private func buttonGenerator(tag:Int, type: ContentType = .star, frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setImage(self.getImage(name: "star_1"), for: .selected)
        button.setImage(self.getImage(name: "star_2"), for: .reserved)
        button.setImage(self.getImage(name: "star_3"), for: .normal)
        button.tag = tag
        button.isSelected = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func getImage(name: String) -> UIImage {
        let image = UIImage(named: name, in: Bundle(for: type(of: self)), compatibleWith: nil)!
        return image.resized(to: self.calculateButtonWidthHeight())
    }
}

private extension ScoringView {
    private func commontInit() {
        let nib = UINib(nibName: "ScoringView", bundle: Bundle(for: ScoringView.self))
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Failed to instantiate nib \(nib)")
        }
        self.addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
