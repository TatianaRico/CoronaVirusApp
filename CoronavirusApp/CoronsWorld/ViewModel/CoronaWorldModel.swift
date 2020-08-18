//
//  CoronaWorldModel.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 25/06/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

// MARK: - CoronaWorld
struct CoronaWorldModel: Codable {
    let global: Global?
    let countries: [Country]?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

// MARK: - Country
struct Country: Codable {
    let country, countryCode, slug: String?
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}

// MARK: - Global
struct Global: Codable {
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
