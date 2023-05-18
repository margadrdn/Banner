import Foundation
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public class BannerService: ObservableObject {
  
  public static let shared = BannerService()
  private init() {}
  
  @Published public var banner: BannerType? = nil
  
  public func showBanner(banner: BannerType) {
    withAnimation {
      self.banner = banner
    }
  }
  
  public func hideBanner() {
    withAnimation {
      self.banner = nil
    }
  }
}
