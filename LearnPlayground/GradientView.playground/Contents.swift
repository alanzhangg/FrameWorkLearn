//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class GradientView: UIView{
  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    UIColor.darkGray.setFill()
    context?.fill(rect)
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations: [CGFloat] = [0.0, 0.5, 1.0]
    let num_location = 3
    let components: [CGFloat] = [1.0, 0.5, 0.4, 1.0, 0.5, 0.5, 0.5, 1.0, 0.8, 0.8, 0.3, 1.0]
    let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: num_location)
    // line gradient
    /*
    let startPoint = CGPoint(x: 0, y: 0)
    let endPoint = CGPoint(x: 50.0, y: 50.0)
    context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: [])
    */
    
    print(colorSpace.numberOfComponents)
    
    // radial gradient
    let startPoint = CGPoint(x: 10, y: 10)
    let endPoint = CGPoint(x: 100, y: 100)
    let startRadio: CGFloat = 20
    let endRadio: CGFloat = 5
    context?.drawRadialGradient(gradient!,
                                startCenter: startPoint,
                                startRadius: startRadio,
                                endCenter: endPoint,
                                endRadius: endRadio,
                                options: [])
    
    context?.saveGState()
    
    context?.beginPath()
    context?.addArc(center: CGPoint(x: 150, y: 150),
                    radius: 50, startAngle: 0.0, endAngle: .pi, clockwise: true)
    context?.closePath()
    context?.clip()
    context?.setFillColor(UIColor.orange.cgColor)
    context?.fill(rect)
    
    let callback: CGFunctionEvaluateCallback = { info,iin,out in
      var v = iin
      let c: [CGFloat] = [1, 0, 0.5, 0]
      
      
    }
    
    let numComponents: CGFloat = CGFloat(1 + colorSpace.numberOfComponents)
    
//    let function = CGFunction(info: nil,
//                              domainDimension: 1,
//                              domain: [0, 1],
//                              rangeDimension: numComponents,
//                              range: [0, 1, 0, 1, 0, 1, 0, 1],
//                              callbacks: <#T##UnsafePointer<CGFunctionCallbacks>#>)
    
//    let shading = CGShading(axialSpace: colorSpace,
//                            start: CGPoint(x: 100, y: 100),
//                            end: CGPoint(x: 200, y: 200),
//                            function: <#T##CGFunction#>,
//                            extendStart: false,
//                            extendEnd: false)
    
//    context?.drawShading(shading!)
    
    context?.restoreGState()
    
    
    
  }
}

class MyViewController : UIViewController {
  override func loadView() {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray
    let graView = GradientView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
    graView.backgroundColor = UIColor.white
    view.addSubview(graView)
    self.view = view
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


