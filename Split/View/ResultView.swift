//
//  ResultView.swift
//  Split
//
//  Created by Gustavo Isidio on 16/09/21.
//

import UIKit

class ResultView: UIView {
    
    // MARK: - Initializers
    init(){
        super.init(frame: .zero)
        
        addSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    let totalPerPersonTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Total per person"
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.textAlignment = .center
        textView.alpha = 0.4
        textView.isEditable = false
        return textView
    }()
    
    let resultValueTextView: UITextView = {
        let textView = UITextView()
        textView.text = "0.0"
        textView.font = UIFont.boldSystemFont(ofSize: 50)
        textView.textAlignment = .center
        textView.alpha = 1.0
        textView.textColor = #colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1)
        textView.isEditable = false
        return textView
    }()
    
    let descriptionSplitTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Description here"
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.textAlignment = .center
        textView.alpha = 0.4
        textView.isEditable = false
        return textView
    }()
    
    let recalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recalculate", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitleShadowColor(#colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 10

        return button
    }()

    private func addSubviews() {
        [totalPerPersonTextView,
        resultValueTextView,
        descriptionSplitTextView,
        recalculateButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
         }
    }
    
    // MARK: - Autolayout
    private func setupAutoLayout() {
        let totalPerPersonTextViewConstraints = [
            totalPerPersonTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            totalPerPersonTextView.leftAnchor.constraint(equalTo: self.leftAnchor),
            totalPerPersonTextView.rightAnchor.constraint(equalTo: self.rightAnchor),
            totalPerPersonTextView.heightAnchor.constraint(equalToConstant: 50)
        ]

        let resultValueTextViewConstraints = [
            resultValueTextView.topAnchor.constraint(equalTo: totalPerPersonTextView.bottomAnchor, constant: 7),
            resultValueTextView.leftAnchor.constraint(equalTo: self.leftAnchor),
            resultValueTextView.rightAnchor.constraint(equalTo: self.rightAnchor),
            resultValueTextView.heightAnchor.constraint(equalToConstant: 60)
        ]
         
        let descriptionSplitTextViewConstraints = [
            descriptionSplitTextView.topAnchor.constraint(equalTo: resultValueTextView.bottomAnchor, constant: 60),
            descriptionSplitTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34),
            descriptionSplitTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -34),
            descriptionSplitTextView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let recalculateButtonConstraints = [
            recalculateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.widthAnchor.constraint(equalToConstant: 175),
            recalculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ]
        
        [totalPerPersonTextViewConstraints,
        resultValueTextViewConstraints,
        descriptionSplitTextViewConstraints,
        recalculateButtonConstraints].forEach(NSLayoutConstraint.activate(_:))
    }
}
