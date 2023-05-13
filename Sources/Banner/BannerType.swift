//
//  BannerType.swift
//  
//
//  Created by Margad on 2023.05.14.
//

import SwiftUI

@available(macOS 10.15, *)
enum BannerType {
  case normal(message: String)
  
  var backgroundColor: Color {
    switch self {
      case .normal: return Color.gray
    }
  }
  
  var message: String {
    switch self {
      case let .normal(message):
        return message
    }
  }
}
