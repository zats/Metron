import CoreGraphics

public protocol MutableTransformable {
  var transform: CGAffineTransform { set get }
}

public extension MutableTransformable {
  // assuiming this is a struct :/
  func transformed(using transform: CGAffineTransform) -> Self {
    var copy = self
    copy.transform = transform
    return copy
  }
}

public protocol Transformable {
  func applying(_ t: CGAffineTransform) -> Self
}
