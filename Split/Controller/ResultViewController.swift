//
//  ResultViewController.swift
//  Split
//
//  Created by Gustavo Isidio on 16/09/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Initializers
    lazy var contentView = ResultView()
    var splits: Int = 0
    var totalResult: Float = 0.0
    var tip: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadUI()
        makeActions()
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
    
    func makeActions() {
        contentView.recalculateButton.addTarget(self, action: #selector(recalculateButton), for: .touchUpInside)
    }
    
    @objc func recalculateButton(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
        buttonAnimation(sender: sender)
    }
    
    func loadUI() {
        contentView.resultValueTextView.text = String(format: "%.2f", totalResult)
        contentView.descriptionSplitTextView.text = "Split between \(splits) people, with \(Int(tip))% tip."
    }
    
    func buttonAnimation(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.alpha = 1
        }
    }
}
