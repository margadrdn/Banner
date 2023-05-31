//
//  Banner.swift
//  
//
//  Created by margadrdn on 2023.05.14.
//

import SwiftUI

/// A view that displays its subview like a local notification.
///
/// When initiated, this view will display its subview from the specified edge using transition.
/// The user is able to dismiss the view with drag gesture.
/// 
/// The following example shows a simple banner using the 'DefaultBannerView'
///
///     Banner {
///       DefaultBannerView(.normal(message: "Hello"))
///     }
///
/// The following example shows a simple banner with custom view.
///
///     Banner {
///       CustomBannerView()
///     }
///
@available(iOS 13.0, macOS 11, tvOS 13.0, watchOS 6.0, *)
public struct Banner<Content> : View where Content : View {
  
  private let content: Content
  
  /// Creates an instance with edge specified.
  /// - Parameters:
  ///   - edge: The transition edge of its subview.
  ///   - content: A view builder that creates the content of this banner.
  public init(edge: BannerEdge = .top, @ViewBuilder content: () -> Content) {
    self.content = content()
    self.edge = edge
  }
  
  @State private var dragOffset: CGSize = .zero
  @EnvironmentObject private var bannerService: BannerService
  
  private let edge: BannerEdge
  
  private var heightOffset: CGFloat {
    switch edge {
      case .top: return min(dragOffset.height, 0)
      case .bottom: return max(dragOffset.height, 0)
    }
  }
  
  public var body: some View {
    VStack(alignment: .leading) {
      if edge == .bottom {
        Spacer()
      }
      content
        .offset(y: heightOffset)
        .gesture(
          DragGesture()
            .onChanged { value in
              withAnimation {
                dragOffset = value.translation
              }
            }
            .onEnded { _ in
              if abs(heightOffset) > 25 {
                bannerService.hideBanner()
              } else {
                withAnimation {
                  dragOffset = .zero
                }
              }
            }
        )
      if edge == .top {
        Spacer()
      }
    }
    .zIndex(1)
    .transition(.move(edge: edge == .top ? .top : .bottom))
    .onAppear {
      guard let banner = bannerService.banner else { return }
      
      if !banner.isPersistent {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
          bannerService.hideBanner()
        }
      }
    }
  }
  
  public enum BannerEdge {
    case top
    case bottom
  }
}


@available(iOS 13.0, macOS 11, tvOS 13.0, watchOS 6.0, *)
struct Banner_Previews: PreviewProvider {
  static let bannerService = BannerService.shared
  static var previews: some View {
    Banner {
      DefaultBannerView(.normal(message: "This is a very long banner text. If fact this text is three lines long on the iPhone SE."))
    }
    .environmentObject(bannerService)
  }
}
