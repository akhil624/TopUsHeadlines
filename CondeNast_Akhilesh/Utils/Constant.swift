//
//  Constant.swift
//  News
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import Foundation

let APIKEY = "83c5711033514ddaba2950cc274e7aff"

struct APIs {
    static let topBusinessUsHeadlines = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=" + APIKEY
    static let headlineDescription = "https://newsapi.org/v2/top-headlines?" // sources=techcrunch&apiKey=83c5711033514ddaba2950cc274e7aff
    static let likes = "https://cn-news-info-api.herokuapp.com/likes/"
    static let comments = "https://cn-news-info-api.herokuapp.com/comments/"
}
