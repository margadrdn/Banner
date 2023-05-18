//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Air on 2023.05.14.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct DefaultBannerView: View {
  
  let banner: BannerType
  
  public init(_ banner: BannerType) {
    self.banner = banner
  }
  
  public var body: some View {
    HStack {
      Image(systemName: "exclamationmark.circle")
        .foregroundColor(.white)
      Text(banner.message)
        .foregroundColor(.white)
        .fontWeight(.semibold)
        .font(.headline)
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(Color.init(red: 0.25, green: 0.25, blue: 0.25))
  }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct DefaultBannerView_Previews: PreviewProvider {
  static var previews: some View {
    DefaultBannerView(.normal(message: "Banner message"))
  }
}
