//
//  CoronaModel.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 31/05/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//
import Foundation

// MARK: - CoronaModel
struct CoronaModel: Codable {
    let data: [Corona]?
}

// MARK: - Corona
struct Corona: Codable {
    let uid: Int?
    let uf, state: String?
    let cases, deaths, suspects, refuses: Int?
    let datetime: String?
}



