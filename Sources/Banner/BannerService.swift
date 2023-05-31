//
//  BannerService.swift
//
//
//  Created by margadrdn on 2023.05.14.
//

import Foundation
import SwiftUI

/// A singleton class that is used to show, hide the banner.
///
/// The following is the intended use of this class.
/// 
///     @StateObject private var bannerService = BannerService.shared
@available(iOS 13.0, macOS 11, tvOS 13.0, watchOS 6.0, *)
public class BannerService: ObservableObject {
  
  public static let shared = BannerService()
  private init() {}
  
  /// A property that holds the BannerType
  ///
  /// The following is the intended use.
  ///
  ///     if let banner = bannerService.banner {
  ///       Banner(edge: .top) {
  ///         DefaultBannerView(banner)
  ///       }
  ///     }
  @Published public private(set) var banner: BannerType? = nil
  
  /// A function to show the banner.
  ///
  /// This function sets the banner property with a given BannerType.
  ///
  ///     bannerService.showBanner(banner: .normal(message: "This is banner"))
  public func showBanner(banner: BannerType) {
    withAnimation {
      self.banner = banner
    }
  }
  
  /// A function to hide the banner.
  ///
  /// This function sets the banner property to `nil`.
  ///
  ///     bannerService.hideBanner()
  public func hideBanner() {
    withAnimation {
      self.banner = nil
    }
  }
}
