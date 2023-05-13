//
//  BannerType.swift
//  
//
//  Created by Margad on 2023.05.14.
//

import SwiftUI

@available(macOS 10.15, *)
public enum BannerType {
  public case normal(message: String)
  
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
