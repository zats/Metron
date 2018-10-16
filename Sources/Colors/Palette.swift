import UIKit


public func ..<(lhs: CGFloat, rhs: CGFloat) -> ColorBox.ColorBounds {
  return ColorBox.ColorBounds(first: lhs, second: rhs)
}

public struct ColorBox {
  public struct ColorBounds {
    public let first: CGFloat
    public let second: CGFloat

    public init(first: CGFloat, second: CGFloat) {
      assert((0...1).contains(first))
      assert((0...1).contains(second))
      self.first = first
      self.second = second
    }

    public func interpolate(_ t: CGFloat) -> CGFloat {
      return first + (second - first) * t
    }
  }

  public let count: Int

  public let hue: ColorBounds
  public let saturation: ColorBounds
  public let lightness: ColorBounds

  public let colors: [UIColor]

  public init(count: Int = 11,
              hue: ColorBounds = 0..<1,
              saturation: ColorBounds = 0..<1,
              lightness: ColorBounds = 0..<1) {
    self.count = count

    self.hue = hue
    self.saturation = saturation
    self.lightness = lightness

    var colors: [UIColor] = []
    for i in stride(from: 0, to: count, by: 1) {
      let t = CGFloat(i) / CGFloat(count)
      let color = UIColor(hue: hue.interpolate(t),
                          saturation: saturation.interpolate(t),
                          lightness: lightness.interpolate(t),
                          alpha: 1)
      colors.append(color)
    }
    self.colors = colors
  }
}

public extension ColorBox {
  static let lyft = ColorBox(count: 11,
                             hue: 0.875..<0.8138888889,
                             saturation: 0.04..<0.9,
                             lightness: 1..<0.54)
}
