import CoreGraphics

/**
 *  An `Arc` represented by a center, radius and 2 angles.
 */
public struct Arc {

  /// The center of the circle.
  public var center: CGPoint

  /// The radius of the circle, i.e. the distance
  /// from the center to the edge of the circle.
  public var radius: CGFloat

  public var angle1: Angle

  public var angle2: Angle

  public init(angle1: Angle, angle2: Angle, center: CGPoint, radius: CGFloat) {
    self.center = center
    self.radius = radius
    self.angle1 = angle1
    self.angle2 = angle2
  }
}

// MARK: Drawable

extension Arc : Drawable {
  public var path: CGPath? {
    let path = CGMutablePath()
    path.addArc(center: center, radius: radius, startAngle: angle1.radians, endAngle: angle2.radians, clockwise: false)
    return path
  }
}
