import CoreGraphics

public protocol Transformable {
  func applying(_ t: CGAffineTransform) -> Self
}

