//
//  ViewController.swift
//  Split
//
//  Created by Gustavo Isidio on 15/09/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // MARK: - Initializers
    lazy var contentView = CalculateView()
    var splits: Int = 1
    var tip: Float = 0.1
    var splitResult: Float = 0.0
    var bill: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        watchTapsOutOfKeyboard()
        loadUI()
        makeActions()
        view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    // MARK: - UI
    func loadUI() {
        contentView.splitValueTextView.text = String(splits)
        
        // Tip to begin with
        tenButton(sender: nil)
    }
    
    func setupView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    func makeActions() {
        contentView.calculateButton.addTarget(self, action: #selector(calculateButton), for: .touchUpInside)
        contentView.zeroButton.addTarget(self, action: #selector(zeroButton), for: .touchUpInside)
        contentView.tenButton.addTarget(self, action: #selector(tenButton), for: .touchUpInside)
        contentView.twentyButton.addTarget(self, action: #selector(twentyButton), for: .touchUpInside)
        contentView.splitStepper.addTarget(self, action: #selector(splitStepper), for: .valueChanged)
        
    }
    
    @objc func calculateButton(sender: UIButton!) {
        let bilReaded = contentView.enterBilTextField.text
        print(bilReaded ?? "Bill value error")
        
        let bilWhithoutWhiteSpaces: String? = String((bilReaded ?? "0.0").filter { !" ".contains($0) })
        
        if bilReaded == nil || bilWhithoutWhiteSpaces == "" {
            alertaError(message: "Verify the bill value.")
        } else {
            bill = Float(bilWhithoutWhiteSpaces ?? "0.0")!
            splitResult = (bill + (bill * tip)) / Float(splits)
            
            buttonAnimation(sender: sender)
            navigationController?.present(ResultViewController(splitsValue: splits, totalResultValue: splitResult, tipValue: (tip * 100)), animated: true, completion: nil)
        }

    }
    
    @objc func zeroButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = true
        contentView.zeroButton.isEnabled = false
        contentView.twentyButton.isEnabled = true
        
        contentView.zeroButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1)
        contentView.tenButton.backgroundColor = .white
        contentView.twentyButton.backgroundColor = .white
        
        tip = 0
    }
    
    @objc func tenButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = false
        contentView.zeroButton.isEnabled = true
        contentView.twentyButton.isEnabled = true
        
        contentView.zeroButton.backgroundColor = .white
        contentView.tenButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1)
        contentView.twentyButton.backgroundColor = .white
        
        tip = 0.1
    }
    
    @objc func twentyButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = true
        contentView.zeroButton.isEnabled = true
        contentView.twentyButton.isEnabled = false
        
        contentView.zeroButton.backgroundColor = .white
        contentView.tenButton.backgroundColor = .white
        contentView.twentyButton.backgroundColor = #colorLiteral(red: 0.3490196078, green: 0.5333333333, blue: 0.7215686275, alpha: 1)
        
        tip = 0.2
    }
    
    @objc func splitStepper(sender: UIStepper){
        splits = Int(sender.value)
        contentView.splitValueTextView.text = String(splits)
    }
    
    // MARK: - Extra functions
    func buttonAnimation(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.alpha = 1
        }
    }
    
    func alertaError(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func watchTapsOutOfKeyboard() {
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

}

