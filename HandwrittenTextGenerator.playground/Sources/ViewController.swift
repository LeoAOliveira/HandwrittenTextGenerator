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
    
    private lazy var blueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var redView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = [
        self.collageView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 80),
        self.collageView.heightAnchor.constraint(equalToConstant: self.view.frame.width - 80),
        self.collageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.collageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ]
    
    private lazy var viewsConstraints: [NSLayoutConstraint] = [
        self.blueView.widthAnchor.constraint(equalToConstant: 50),
        self.blueView.heightAnchor.constraint(equalTo: self.blueView.widthAnchor),
        self.blueView.centerYAnchor.constraint(equalTo: self.collageView.centerYAnchor, constant: 50),
        self.blueView.centerXAnchor.constraint(equalTo: self.collageView.centerXAnchor, constant: 20),
        
        self.redView.widthAnchor.constraint(equalToConstant: 70),
        self.redView.heightAnchor.constraint(equalTo: self.redView.widthAnchor),
        self.redView.centerYAnchor.constraint(equalTo: self.collageView.centerYAnchor, constant: 0),
        self.redView.centerXAnchor.constraint(equalTo: self.collageView.centerXAnchor, constant: 0),
        
        self.greenView.widthAnchor.constraint(equalToConstant: 30),
        self.greenView.heightAnchor.constraint(equalTo: self.greenView.widthAnchor),
        self.greenView.centerYAnchor.constraint(equalTo: self.collageView.centerYAnchor, constant: -10),
        self.greenView.centerXAnchor.constraint(equalTo: self.collageView.centerXAnchor, constant: -40)
    ]
    
    // MARK: - Override functions

    public override func viewDidLoad() {
        view.backgroundColor = .lightGray
        view.addSubview(collageView)
        
        collageView.addSubview(blueView)
        collageView.addSubview(redView)
        collageView.addSubview(greenView)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        imageGenerator()
    }
    
    public override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(viewsConstraints)
    }
    
    // MARK: - Functions
    
    private func imageGenerator() {
        
        UIGraphicsBeginImageContext(collageView.frame.size)
        
        collageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(),
           let data = image.pngData() {
            
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
