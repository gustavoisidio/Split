//
//  CalculateView.swift
//  Split
//
//  Created by Gustavo Isidio on 15/09/21.
//

import UIKit

class CalculateView: UIView {
    
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
    let enterBilTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Enter bill total"
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.textAlignment = .left
        textView.alpha = 0.4
        textView.isEditable = false
        return textView
    }()
    
    let enterBilTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e.g 123.56"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 40)
        textField.textColor = .systemBlue
        textField.keyboardType = UIKeyboardType.decimalPad
        return textField
    }()
    
    let selectTipTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Select tip"
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.textAlignment = .left
        textView.alpha = 0.4
        textView.isEditable = false
        return textView
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton()
        button.setTitle("0%", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.isEnabled = true
        button.setTitleColor(.white, for: .disabled)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let tenButton: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.isEnabled = true
        button.setTitleColor(.white, for: .disabled)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let twentyButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.isEnabled = true
        button.setTitleColor(.white, for: .disabled)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let chooseSplitTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Choose Split"
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.textAlignment = .left
        textView.alpha = 0.4
        textView.isEditable = false
        return textView
    }()
    
    let splitValueTextView: UITextView = {
        let textView = UITextView()
        textView.text = "0"
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.textAlignment = .center
        textView.alpha = 1.0
        textView.textColor = .systemBlue
        textView.isEditable = false
        return textView
    }()
    
    let splitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        return stepper
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.setTitleShadowColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 10

        return button
    }()
    
    private func addSubviews() {
        [enterBilTextView,
         enterBilTextField,
         selectTipTextView,
         zeroButton,
         tenButton,
         twentyButton,
         chooseSplitTextView,
         splitValueTextView,
         splitStepper,
         calculateButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
         }
    }
    
    private func setupAutoLayout() {
        let enterBilTextViewConstraints = [
            enterBilTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            enterBilTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34),
            enterBilTextView.rightAnchor.constraint(equalTo: self.rightAnchor),
            enterBilTextView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let enterBilTextFieldConstraints = [
            enterBilTextField.topAnchor.constraint(equalTo: enterBilTextView.bottomAnchor, constant: 12),
            enterBilTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            enterBilTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            enterBilTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            enterBilTextField.heightAnchor.constraint(equalTo: enterBilTextView.heightAnchor)
        ]
        
        let selectTipTextViewConstraints = [
            selectTipTextView.topAnchor.constraint(equalTo: enterBilTextField.bottomAnchor, constant: 30),
            selectTipTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34),
            selectTipTextView.rightAnchor.constraint(equalTo: self.rightAnchor),
            selectTipTextView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let zeroButtonConstraints = [
            zeroButton.topAnchor.constraint(equalTo: selectTipTextView.bottomAnchor, constant: 20),
            zeroButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34),
            zeroButton.heightAnchor.constraint(equalTo: enterBilTextView.heightAnchor),
            zeroButton.widthAnchor.constraint(equalToConstant: 90)
        ]
        
        let tenButtonConstraints = [
            tenButton.topAnchor.constraint(equalTo: selectTipTextView.bottomAnchor, constant: 20),
            tenButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tenButton.heightAnchor.constraint(equalTo: enterBilTextView.heightAnchor),
            tenButton.widthAnchor.constraint(equalToConstant: 90)
        ]
        
        let twentyButtonConstraints = [
            twentyButton.topAnchor.constraint(equalTo: selectTipTextView.bottomAnchor, constant: 20),
            twentyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -34),
            twentyButton.heightAnchor.constraint(equalTo: enterBilTextView.heightAnchor),
            twentyButton.widthAnchor.constraint(equalToConstant: 90)
        ]
        
        let chooseSplitTextViewConstraints = [
            chooseSplitTextView.topAnchor.constraint(equalTo: twentyButton.bottomAnchor, constant: 30),
            chooseSplitTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 34),
            chooseSplitTextView.rightAnchor.constraint(equalTo: self.rightAnchor),
            chooseSplitTextView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let splitValueTextViewConstraints = [
            splitValueTextView.topAnchor.constraint(equalTo: chooseSplitTextView.bottomAnchor, constant: 10),
            splitValueTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 110),
            splitValueTextView.heightAnchor.constraint(equalToConstant: 50),
            splitValueTextView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let splitStepperConstraints = [
            splitStepper.leftAnchor.constraint(equalTo: splitValueTextView.rightAnchor, constant: 35),
            splitStepper.centerYAnchor.constraint(equalTo: splitValueTextView.centerYAnchor),
            splitStepper.heightAnchor.constraint(equalToConstant: 30),
            splitStepper.widthAnchor.constraint(equalToConstant: 90)
        ]
        
        let calculateButtonConstraints = [
            calculateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(equalToConstant: 175),
            calculateButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ]
        
        [enterBilTextViewConstraints,
         enterBilTextFieldConstraints,
         selectTipTextViewConstraints,
         zeroButtonConstraints,
         tenButtonConstraints,
         twentyButtonConstraints,
         chooseSplitTextViewConstraints,
         splitValueTextViewConstraints,
         splitStepperConstraints,
         calculateButtonConstraints].forEach(NSLayoutConstraint.activate(_:))
        
    }
}
