import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public class BannerService: ObservableObject {
  public static let shared = BannerService()
  private init() {}
  
  @Published var banner: BannerType? = nil
  
  public func showBanner(banner: BannerType) {
    withAnimation {
      self.banner = banner
    }
  }
  
  public func hideBanner() {
    
  }
}
