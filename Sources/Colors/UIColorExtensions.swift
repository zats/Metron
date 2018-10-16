import UIKit

public extension UIColor {
  public convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat) {
    guard saturation > 0 else {
      self.init(red: lightness, green: lightness, blue: lightness, alpha: 1)
      return
    }

    let hue2rgb: (CGFloat, CGFloat, CGFloat) -> CGFloat = { p, q, t in
      var t = t
      if (t < 0) {t += 1}
      if (t > 1) {t -= 1}
      if (t < 1/6) {return p + (q - p) * 6 * t}
      if (t < 1/2) {return q}
      if (t < 2/3) {return p + (q - p) * (2/3 - t) * 6}
      return p;
    }

    let q = lightness < 0.5 ? lightness * (1 + saturation) : lightness + saturation - lightness * saturation
    let p = 2 * lightness - q

    self.init(red: hue2rgb(p, q, hue + 1/3),
              green: hue2rgb(p, q, hue),
              blue: hue2rgb(p, q, hue - 1/3),
              alpha: alpha)
  }

  public func hsla() -> (hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat) {
    let rgba = self.rgba()

    let chMax = max(rgba.red, max(rgba.green, rgba.blue))
    let chMin = min(rgba.red, min(rgba.green, rgba.blue))
    let lightness = (chMax + chMin) * 0.5
    let delta = chMax - chMin
    if delta == 0 {
      // monochromatic
      return (hue: 0, saturation: 0, lightness: lightness, alpha: rgba.alpha)
    } else {
      let saturation = lightness > 0.5 ? delta / (2 - chMax - chMin) : delta / (chMax + chMin);
      var hue: CGFloat
      switch chMax {
      case rgba.red:
        hue = (rgba.green - rgba.blue) / delta + (rgba.green < rgba.blue ? 6 : 0)
      case rgba.green:
        hue = (rgba.blue - rgba.red) / delta + 2;
      case rgba.blue:
        hue = (rgba.red - rgba.green) / delta + 4;
      default:
        fatalError()
      }
      hue /= 6
      return (hue: hue,
              saturation: saturation,
              lightness: lightness,
              alpha: rgba.alpha)
    }
  }

  public func rgba() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return (red: red, green: green, blue: blue, alpha: alpha)
  }
}
