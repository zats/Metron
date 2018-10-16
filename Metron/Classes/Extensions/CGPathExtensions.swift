import CoreGraphics

public extension CGPath {
  func transforming(using transform: CGAffineTransform) -> CGPath {
    if transform == .identity {
      return self
    }
    var transform = transform
    return self.copy(using: &transform) ?? self
  }
}
