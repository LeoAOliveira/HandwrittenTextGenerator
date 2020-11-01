//
//  ViewController.swift
//  HandwrittenTextDatasetGenerator
//
//  Created by Leonardo Amorim de Oliveira on 31/10/20.
//

import UIKit

public class ViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var collageView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = [
        self.collageView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
        self.collageView.heightAnchor.constraint(equalToConstant: self.view.frame.width),
        self.collageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.collageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ]
    
    // MARK: - Override functions

    public override func viewDidLoad() {
        view.backgroundColor = .lightGray
        view.addSubview(collageView)
        NSLayoutConstraint.activate(constraints)
    }
}
