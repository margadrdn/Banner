//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Air on 2023.05.14.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Banner<Content> : View where Content : View {
  
  let content: Content
  
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  public var body: some View {
    VStack {
      content
        .transition(AnyTransition.move(edge: .top))
      Spacer()
      Spacer()
      Spacer()
      Spacer()
    }
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
