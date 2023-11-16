//
//  UIFont+Extensions.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 16.11.2023.
//

import SwiftUI
import UIKit

extension UIFont {
  class func preferredFont(from font: Font) -> UIFont {
      let style: UIFont.TextStyle =
      switch font {
        case .largeTitle:   .largeTitle
        case .title:        .title1
        case .title2:       .title2
        case .title3:       .title3
        case .headline:     .headline
        case .subheadline:  .subheadline
        case .callout:      .callout
        case .caption:      .caption1
        case .caption2:     .caption2
        case .footnote:     .footnote
        default: /*.body */ .body
      }
      return  UIFont.preferredFont(forTextStyle: style)
    }
 }
