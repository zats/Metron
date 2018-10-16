import UIKit

public extension UIColor {
  public static func random(hue: Range<CGFloat>,
                            saturation: Range<CGFloat> = 0..<1,
                            brightness: Range<CGFloat> = 0..<1,
                            alpha: Range<CGFloat> = 0..<1) -> UIColor {
    return UIColor(hue: .random(in: hue),
                   saturation: .random(in: saturation),
                   brightness: .random(in: brightness),
                   alpha: .random(in: alpha))
  }
}
