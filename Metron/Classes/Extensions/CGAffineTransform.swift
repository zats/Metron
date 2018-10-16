import CoreGraphics


/// Mutating extensions
public extension CGAffineTransform {
  public mutating func translateBy(x: CGFloat, y: CGFloat) {
    self = self.translatedBy(x: x, y: y)
  }

  public mutating func rotate(by angle: CGFloat) {
    self = self.rotated(by: angle)
  }
}

public extension CGAffineTransform {
  init(angle: Angle, around anchor: CGPoint) {
    self.init(rotationAngle: angle.radians, around: anchor)
  }

  init(rotationAngle: CGFloat, around anchor: CGPoint) {
    self.init(translationX: anchor.x, y: anchor.y)
    self.rotate(by: rotationAngle)
    self.translateBy(x: -anchor.x, y: -anchor.y)
  }
}

//  Native conformance
extension CGPoint : Transformable {}
extension CGSize : Transformable {}
extension CGRect : Transformable {}

