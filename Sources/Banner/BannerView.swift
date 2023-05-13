//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Air on 2023.05.14.
//

import SwiftUI

@available(macOS 10.15, *)
public struct BannerView: View {
  let banner: BannerType
  public var body: some View {
    ZStack {
      VStack {
        Text(banner.message)
          .background(banner.backgroundColor)
        Spacer()
      }
      .padding()
    }
  }
}
