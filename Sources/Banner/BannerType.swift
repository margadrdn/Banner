//
//  BannerType.swift
//  
//
//  Created by margadrdn on 2023.05.14.
//

import SwiftUI

@available(iOS 13.0, macOS 11, tvOS 13.0, watchOS 6.0, *)
public enum BannerType {
  case normal(message: String, isPersistent: Bool = false)
  
  public var isPersistent: Bool {
    switch self {
    case let .normal(_, isPersistent):
      return isPersistent
    }
  }
  
  public var message: String {
    switch self {
      case let .normal(message, _):
        return message
    }
  }
  
  public var backgroundColor: Color {
    switch self {
      case .normal: return Color.gray
    }
  }
}
