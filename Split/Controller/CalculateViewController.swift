//
//  ViewController.swift
//  Split
//
//  Created by Gustavo Isidio on 15/09/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
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
        
    }
    
    func watchTapsOutOfKeyboard() {
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultsVC = segue.destination as! ResultViewController
            resultsVC.splits = splits
            resultsVC.tip = tip * 100
            resultsVC.totalResult = splitResult
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func makeActions() {
        contentView.calculateButton.addTarget(self, action: #selector(calculateButton), for: .touchUpInside)
        contentView.zeroButton.addTarget(self, action: #selector(zeroButton), for: .touchUpInside)
        contentView.tenButton.addTarget(self, action: #selector(tenButton), for: .touchUpInside)
        contentView.twentyButton.addTarget(self, action: #selector(twentyButton), for: .touchUpInside)
        contentView.splitStepper.addTarget(self, action: #selector(splitStepper), for: .valueChanged)
        
    }
    
    @objc func splitStepper(sender: UIStepper){
        splits = Int(sender.value)
        contentView.splitValueTextView.text = String(splits)
    }
    
    @objc func calculateButton(sender: UIButton!) {
        buttonAnimation(sender: sender)
        let bilReaded = contentView.enterBilTextField.text
        print(bilReaded ?? "Bill value error")
        bill = Float(bilReaded ?? "0.0") ?? 0.0
        
        splitResult = (bill + (bill * tip)) / Float(splits)
        
        print("bill:\(bill) tip:\(tip) splits:\(splits) result:\(splitResult)")
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    @objc func zeroButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = true
        contentView.zeroButton.isEnabled = false
        contentView.twentyButton.isEnabled = true
        
        contentView.zeroButton.backgroundColor = .systemBlue
        contentView.tenButton.backgroundColor = .white
        contentView.twentyButton.backgroundColor = .white
        
        tip = 0
    }
    
    @objc func tenButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = false
        contentView.zeroButton.isEnabled = true
        contentView.twentyButton.isEnabled = true
        
        contentView.zeroButton.backgroundColor = .white
        contentView.tenButton.backgroundColor = .systemBlue
        contentView.twentyButton.backgroundColor = .white
        
        tip = 0.1
    }
    
    @objc func twentyButton(sender: UIButton!) {
        contentView.tenButton.isEnabled = true
        contentView.zeroButton.isEnabled = true
        contentView.twentyButton.isEnabled = false
        
        contentView.zeroButton.backgroundColor = .white
        contentView.tenButton.backgroundColor = .white
        contentView.twentyButton.backgroundColor = .systemBlue
        
        tip = 0.2
    }
    
    func buttonAnimation(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.alpha = 1
        }
    }
    
    

}

