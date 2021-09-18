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
    
    init(splitsValue: Int, totalResultValue: Float, tipValue: Float) {
        splits = splitsValue
        totalResult = totalResultValue
        tip = tipValue
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadUI()
        makeActions()
        view.backgroundColor = .white
    }
    
    // MARK: - UI
    func loadUI() {
        contentView.resultValueTextView.text = String(format: "%.2f", totalResult)
        contentView.descriptionSplitTextView.text = "Split between \(splits) people, with \(Int(tip))% tip."
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
        contentView.recalculateButton.addTarget(self, action: #selector(recalculateButton), for: .touchUpInside)
    }
    
    @objc func recalculateButton(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
        buttonAnimation(sender: sender)
    }
    
    func buttonAnimation(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.alpha = 1
        }
    }
}
