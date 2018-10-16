import CoreGraphics

public struct Cross: MutableTransformable {
  public var center: CGPoint
  public var radius: CGFloat
  public var transform: CGAffineTransform = .identity

  public init(center: CGPoint, radius: CGFloat) {
    self.center = center
    self.radius = radius
  }
}

extension Cross: Drawable {
  public var path: CGPath {
    let path = CGMutablePath()
    path.move(to: CGPoint(angle: -.pi*3/4, distance: radius, from: center))
    path.addLine(to: CGPoint(angle: .pi/4, distance: radius, from: center))
    path.move(to: CGPoint(angle: -.pi/4, distance: radius, from: center))
    path.addLine(to: CGPoint(angle: .pi*3/4, distance: radius, from: center))
    return path.transforming(using: self.transform)
  }
}
