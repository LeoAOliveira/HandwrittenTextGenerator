//
//  ViewController.swift
//  HandwrittenTextDatasetGenerator
//
//  Created by Leonardo Amorim de Oliveira on 31/10/20.
//

import UIKit
import PlaygroundSupport

// MARK: - ViewController

public class ViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var collageView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = [
        self.collageView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
        self.collageView.heightAnchor.constraint(equalToConstant: self.view.frame.width),
        self.collageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.collageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ]
    
    private lazy var imagesConstraints: [NSLayoutConstraint] = [
        self.textImageView.topAnchor.constraint(equalTo: self.collageView.topAnchor, constant: 10),
        self.textImageView.leadingAnchor.constraint(equalTo: self.collageView.leadingAnchor, constant: 10),
        self.textImageView.trailingAnchor.constraint(equalTo: self.collageView.trailingAnchor, constant: -10),
        self.textImageView.bottomAnchor.constraint(equalTo: self.collageView.bottomAnchor, constant: -10)
    ]
    
    // MARK: - Override functions

    public override func viewDidLoad() {
        view.backgroundColor = .lightGray
        view.addSubview(collageView)
        
        collageView.addSubview(textImageView)
        
        guard let image = UIImage(named: "text.png") else {
            return
        }
        
        textImageView.image = image
        
        TextRecognition().boxRequest(image: image, imageView: textImageView)
        
        imageGenerator()
    }
    
    public override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
        NSLayoutConstraint.activate(imagesConstraints)
    }
    
    // MARK: - Functions
    
    private func imageGenerator() {
        
//        UIGraphicsBeginImageContext(collageView.frame.size)
//        
//        collageView.layer.render(in: UIGraphicsGetCurrentContext()!)
//        
//        if let image = UIGraphicsGetImageFromCurrentImageContext() {
//            // saveImage(image)
//        }
    }
    
    private func saveImage(_ image: UIImage) {
        
        if let data = image.pngData() {
            
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

// MARK: - TextRecognition

import Vision

public class TextRecognition {
    
    private var imageView: UIImageView = UIImageView(frame: .zero)
    
    public func boxRequest(image: UIImage, imageView: UIImageView) {
        
        guard let ciImage = CIImage(image: image)  else {
            return
        }
        
        let requestHandler = VNImageRequestHandler(ciImage: ciImage, 
                                                   options: [:])
        
        self.imageView = imageView
        
        DispatchQueue.main.async {
            
            self.imageView.layer.sublayers?.removeSubrange(1...)
            
            let request = VNDetectTextRectanglesRequest { (request, error) in
                
                guard let observations = request.results as? [VNTextObservation] else {
                    return
                }
                
                for currentObservation in observations {
                    
                    for currentCharacterBox in currentObservation.characterBoxes! {
                    }
                }
                
            }
            
            request.reportCharacterBoxes = true
            
            do {
                try requestHandler.perform([request])
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
