//
//  APIModel.swift
//  APIcrud
//
//  Created by E5000848 on 12/06/24.
//

import Foundation

struct APIModel: Codable {
    let product: [info]
}

struct info: Codable {
    let id: Int
    let title: String
    let price: Float
    let category: String
    let description: String
    let image: String
}
