//
//  CurrencyData.swift
//  Convert to KZT
//
//  Created by Александр Х on 10.03.2023.
//

import Foundation

struct CurrencyData: Codable {
    let Valute: Valute
    let Date: String
    
}

struct Valute: Codable {
    let USD: USD
    let KZT: KZT
    let CNY: CNY
}
struct KZT: Codable {
    let Nominal: Int
    let Value: Double
    let Previous: Double
}

struct USD: Codable {
    let Nominal: Int
    let Value: Double
    let Previous: Double
}

struct CNY: Codable {
    let Nominal: Int
    let Value: Double
    let Previous: Double
}


