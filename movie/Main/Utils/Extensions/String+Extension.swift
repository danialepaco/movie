//
//  String+Extension.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

extension String {
  func stripOutHtml() -> String? {
    do {
      guard let data = self.data(using: .unicode) else {
        return nil
      }
      let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
      return attributed.string
    } catch {
      return nil
    }
  }
}
