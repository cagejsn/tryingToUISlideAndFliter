//
//  MyView.swift
//  cageWorksWithOpenGL
//
//  Created by Cage Johnson on 1/27/17.
//  Copyright © 2017 desk. All rights reserved.
//

import Foundation
import UIKit
import GLKit

class MyView: GLKView {
    
    var ciContext: CIContext!
    var startingImage: CIImage!
    var finishingImage: CIImage!
    
    
    
    
    override init(frame: CGRect,context: EAGLContext){
        super.init(frame: frame, context: context)
        EAGLContext.setCurrent(context)
        
        drawableColorFormat = .RGB565
     //   drawableDepthFormat = .format24
       drawableStencilFormat = .format8
     //   self.enableSetNeedsDisplay = true
       
  
        ciContext = CIContext(eaglContext: context)
        var uiImage = UIImage(named: "somePic")
        startingImage = CIImage(cgImage: (uiImage?.cgImage)!)
        
      // bindDrawable()
      //  self.bounds = CGRect.zero
        self.bounds = CGRect(origin: CGPoint.zero, size: (uiImage?.size)!)
        
        print(self.bounds)
        print(self.frame)
        //self.bounds.size.width = (uiImage?.size.width)!
       // self.bounds.size.height = (uiImage?.size.height)!    
      //  self.setNeedsDisplay()
        self.display()
    }
    
    override func draw(_ rect: CGRect) {
        let scale = CGAffineTransform(scaleX: self.contentScaleFactor, y: self.contentScaleFactor)
        var destRect = CGRect(x: 0, y: 0, width: self.bounds.width  , height: self.bounds.width )
        let drawingRect = rect.applying(scale)
        if(finishingImage == nil){
            ciContext.draw(startingImage, in: drawingRect, from: startingImage.extent)
        } else {
            ciContext.draw(finishingImage, in: drawingRect, from: finishingImage.extent)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(for sliderValue: Float){
        
        var filter = CIFilter(name: "CIExposureAdjust")
        filter?.setValue(startingImage, forKey: kCIInputImageKey)
        filter?.setValue(NSNumber(value: sliderValue), forKey: "inputEV")
       // finishingImage.
        
        
        ciContext.filte
        finishingImage = filter?.outputImage
        filter.
        
        self.display()
    }
    
    
}
