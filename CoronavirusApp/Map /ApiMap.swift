//
//  ApiMap.swift
//  CoronavirusApp
//
//  Created by Tatiana Rico on 07/07/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import Foundation

//MARK: - CoronaMapModel
struct ApiMap: Codable {
    let country: String?
    let countryCode: String?
    let province, city, cityCode, lat: String?
    let lon: String?
    let cases: Int?
    let status: String?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case province = "Province"
        case city = "City"
        case cityCode = "CityCode"
        case lat = "Lat"
        case lon = "Lon"
        case cases = "Cases"
        case status = "Status"
        case date = "Date"
    }
}

enum County: String, Codable {
    case southAfrica = "South Africa"
}

enum CountryCode: String, Codable {
    case za = "ZA"
}

enum Status: String, Codable {
    case confirmed = "confirmed"
}
