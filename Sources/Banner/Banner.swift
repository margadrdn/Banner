//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Air on 2023.05.14.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Banner<Content> : View where Content : View {
  
  private let content: Content
  
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
    VStack {
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
              if abs(heightOffset) > 20 {
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
    .transition(.move(edge: edge == .top ? .top : .bottom))
  }
  
  public enum BannerEdge {
    case top
    case bottom
  }
}


@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct Banner_Previews: PreviewProvider {
  static var previews: some View {
    Banner {
      DefaultBannerView(.normal(message: "Hellooo"))
    }
  }
}
