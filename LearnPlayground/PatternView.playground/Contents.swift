//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

enum PatternDirection: CaseIterable{
  case left
  case right
  case top
  case bottom
}

extension UIBezierPath{
  convenience init(triangleIn react: CGRect){
    self.init()
    let topOfTriangle = CGPoint(x: react.width / 2, y: 0)
    let bottomLeftOfTriangle = CGPoint(x: 0, y: react.height)
    let bottomRightOfTriangle = CGPoint(x: react.width, y: react.height)
    
    self.move(to: topOfTriangle)
    self.addLine(to: bottomLeftOfTriangle)
    self.addLine(to: bottomRightOfTriangle)
    self.close()
    
  }
}

public struct Constants{
  static let patternSize: CGFloat = 30.0
  static let patternRepeatCount = 2
}

class PatternView: UIView{
  
  var fillColor: [CGFloat] = [0.0, 1.0, 1.0, 1.0]
  var direction: PatternDirection = .top
  
  init(fillColor: [CGFloat], direction: PatternDirection = .top){
    self.fillColor = fillColor
    self.direction = direction
    super.init(frame: CGRect.zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  let drawTriangle: CGPatternDrawPatternCallback = {_, context in
    let trianglePath = UIBezierPath(triangleIn: CGRect(x: 0, y: 0, width: Constants.patternSize, height: Constants.patternSize))
    context.addPath(trianglePath.cgPath)
    context.fillPath()
  }
  
  let drawPattern: CGPatternDrawPatternCallback = { _, context in
    context.addArc(center: CGPoint(x: 10, y: 10), radius: 10, startAngle: 0, endAngle: CGFloat(2 * .pi as CGFloat), clockwise: false)
//    context.setFillColor(UIColor.yellow.cgColor)
    context.setStrokeColor(UIColor.darkGray.cgColor)
    context.drawPath(using: .fillStroke)
//    context.fillPath()
    
  }
  
  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    UIColor.white.setFill()
    context?.fill(rect)
    
    var callbacks = CGPatternCallbacks(version: 0, drawPattern: drawTriangle, releaseInfo: nil)
    
    let patternStepX: CGFloat = rect.width / CGFloat(Constants.patternRepeatCount)
    let patternStepY: CGFloat = rect.height / CGFloat(Constants.patternRepeatCount)
    let patternOffSetX: CGFloat = (patternStepX - Constants.patternSize) / 2
    let patternOffSetY: CGFloat = (patternStepY - Constants.patternSize) / 2
    var transform: CGAffineTransform
    
    switch direction {
    case .top:
      transform = .identity
    case .right:
      transform = CGAffineTransform(rotationAngle: 0.5 * .pi)
    case .bottom:
      transform = CGAffineTransform(rotationAngle: 1.0 * .pi)
    case .left:
      transform = CGAffineTransform(rotationAngle: 1.5 * .pi)
    }
    transform = transform.translatedBy(x: patternOffSetX, y: patternOffSetY)
    
    let pattern = CGPattern(info: nil,
                            bounds: CGRect(x: 0, y: 0, width: Constants.patternSize, height: Constants.patternSize),
                            matrix: transform,
                            xStep: patternStepX,
                            yStep: patternStepY,
                            tiling: .constantSpacing,
                            isColored: false,
                            callbacks: &callbacks)
    var alpha: CGFloat = 1.0
    let baseSpace = CGColorSpaceCreateDeviceRGB()
    let patternSpace = CGColorSpace(patternBaseSpace: baseSpace)!
    context?.setFillColorSpace(patternSpace)
    
    context?.setShadow(offset: CGSize(width: 5, height: 5), blur: 0)
    
    context?.setFillPattern(pattern!, colorComponents: fillColor)
    context?.fill(rect)
  }
}

class MyViewController : UIViewController {
  
  override func loadView() {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray
    self.view = view
    
    let patternView = PatternView(fillColor: [0.0, 1.0, 0.0, 1.0], direction: .right)
    patternView.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
    view.addSubview(patternView)
  }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
