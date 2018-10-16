import CoreGraphics

public extension CGPoint {
  /// Random point in a given rectangle
  public static func random(in rect: CGRect) -> CGPoint {
    return CGPoint(x: .random(in: rect.minX..<rect.maxX),
                   y: .random(in: rect.minY..<rect.maxY))
  }

  /// This allows to pick a random point in a circle or hollow donut
  public static func random(around point: CGPoint,
                            randomRange: Range<CGFloat>) -> CGPoint {
    return CGPoint(angle: .random(in: -.pi ..< .pi),
                   distance: .random(in: randomRange),
                   from: point)
  }
}
