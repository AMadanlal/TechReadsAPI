//
//  TextModel.swift
//  App
//
//  Created by Akshar Madanlal on 2020/04/07.
//

import Vapor
import Foundation

struct FormattedText: Content {
  let text: String
}

struct Article: Content {
  let source: Source
  let author: String?
  let title: String?
  let description: String?
  let url: URL?
  let urlToImage: URL?
  let publishedAt: Date

  struct Source: Content {
    let id: String?
    let name: String?
  }
}

