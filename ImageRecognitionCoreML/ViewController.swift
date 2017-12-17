//
//  ViewController.swift
//  ImageRecognitionCoreML
//
//  Created by Mohammad Azam on 9/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pictureImageView :UIImageView!
    @IBOutlet weak var titleLabel :UILabel!
    
    private var model :my_model = my_model()
    
    let images = ["cat.jpg","dog.jpg","rat.jpg","banana.jpg"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextButtonPressed() {
        
        if index > self.images.count - 1 {
            index = 0
        }
        
        let img = UIImage(named: images[index])
        self.pictureImageView.image = img
        
        let resizedImage = img?.resizeTo(size: CGSize(width: 224, height: 224))
        
        let buffer = resizedImage?.toBuffer()
        
        let prediction = try! self.model.prediction(input: my_modelInput(input__0: buffer!))
        
        //let prediction = try! self.model.prediction(image: buffer!)
        
        self.titleLabel.text = prediction.classLabel
        
        index = index + 1
    }

}

