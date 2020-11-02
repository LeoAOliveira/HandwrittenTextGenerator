//
//  ViewController.swift
//  HandwrittenTextDatasetGenerator
//
//  Created by Leonardo Amorim de Oliveira on 31/10/20.
//

import UIKit
import PlaygroundSupport

public class ViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var collageView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = [
        self.collageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.collageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ]
    
    ]
    
    // MARK: - Override functions

    public override func viewDidLoad() {
        view.backgroundColor = .lightGray
        view.addSubview(collageView)
        
        imageGenerator()
    }
    
    public override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Functions
    
    private func imageGenerator() {
        
        
            
            let filename = playgroundSharedDataDirectory.appendingPathComponent("generatedImage.png")
        
            do {
                try data.write(to: filename)
                print("Success")
            } catch {
                print("Fail 3")
                print(error.localizedDescription)
            }
            
            // Uncomment de line below to get the path to saved image
            // print("PATH: \(filename)")
            
        } else {
            print("Fail 2: Error saving image")
        }
    }

}
