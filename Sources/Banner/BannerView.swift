//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Air on 2023.05.14.
//

import SwiftUI

@available(macOS 10.15, *)
struct BannerView: View {
  let banner: BannerType
  var body: some View {
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
