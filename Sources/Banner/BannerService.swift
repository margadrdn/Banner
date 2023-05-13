import Foundation
import SwiftUI

@available(macOS 10.15, *)
public class BannerService: ObservableObject {
  static let shared = BannerService()
  private init() {}
  
  @Published var banner: BannerType? = nil
  
  func showBanner(banner: BannerType) {
    withAnimation {
      self.banner = banner
    }
  }
  
  func hideBanner() {
    
  }
}
