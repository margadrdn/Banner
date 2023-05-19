//
//  BannerType.swift
//  
//
//  Created by margadrdn on 2023.05.14.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum BannerType {
  case normal(message: String)
  
  public var backgroundColor: Color {
    switch self {
      case .normal: return Color.gray
    }
  }
  
  public var message: String {
    switch self {
      case let .normal(message):
        return message
    }
  }
}
