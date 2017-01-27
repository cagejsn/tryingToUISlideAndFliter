//
//  ViewController.swift
//  cageWorksWithOpenGL
//
//  Created by Cage Johnson on 1/27/17.
//  Copyright © 2017 desk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myView: MyView!
    var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView = MyView(frame: self.view.frame, context: EAGLContext(api: .openGLES2))
        self.view.addSubview(myView)
        
        
        mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        self.view.addSubview(mySlider)
        mySlider.addTarget(self, action: #selector(ViewController.handleSlide(sender:)), for: .valueChanged)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func handleSlide(sender: UISlider){
       myView.setImage(for: sender.value)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

