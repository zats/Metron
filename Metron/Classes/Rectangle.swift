import CoreGraphics

/**
 *  A `Rectangle` is a rectangle with edges of equal length.
 */
public struct Rectangle {
  public var origin: CGPoint
  public var size: CGSize

  public init(origin: CGPoint, size: CGSize) {
    self.origin = origin
    self.size = size
  }

  public init(in rect: CGRect) {
    self.init(origin: rect.origin, size: rect.size)
  }
}


public extension Rectangle {

  /// - returns: The `CGRect` representing this square.
  public var rect: CGRect {
    return CGRect(origin: origin, size: size)
  }
}


extension Rectangle : Drawable {
  public var path: CGPath {
    return rect.path
  }
}

extension Rectangle : Shape {

  public var area: CGFloat {
    return rect.area
  }

  public var perimeter: CGFloat {
    return rect.perimeter
  }

  public var center: CGPoint {
    return rect.center
  }

  /// Extremities:
  public var minX: CGFloat { return origin.x }
  public var maxX: CGFloat { return origin.x + size.width }
  public var minY: CGFloat { return origin.y }
  public var maxY: CGFloat { return origin.y + size.height }

  /// Midpoints:
  public var midX: CGFloat { return center.x }
  public var midY: CGFloat { return center.y }

  public var width: CGFloat { return size.width }
  public var height: CGFloat { return size.height }

  public var boundingRect: CGRect { return rect }

  public func contains(_ point: CGPoint) -> Bool {
    return rect.contains(point)
  }
}

extension Rectangle : PolygonType {
  public var edgeCount: Int {
    return 4
  }
  public var points: [CGPoint] {
    let rect = self.rect
    return CoordinateSystem.default.corners.map { rect.corner($0) }
  }
  public var lineSegments: [LineSegment] {
    return rect.lineSegments
  }
}

// MARK: CustomDebugStringConvertible

extension Rectangle : CustomDebugStringConvertible {
  public var debugDescription: String {
    return "Rectangle {origin: \(origin), size: \(size)}"
  }
}
