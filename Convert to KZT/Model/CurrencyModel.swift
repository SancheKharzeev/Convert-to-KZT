//
//  CurrencyModel.swift
//  Convert to KZT
//
//  Created by Александр Х on 10.03.2023.
//

import Foundation

struct CurrencyModel {
    
 
    let date: String
    let valueUSD: Double
    let previousUSD: Double
    let valueKZT: Double
    let previousKZT: Double
    var valueCNY: Double
    var previousCNY: Double
    
    var valueStringUSD: String {
        return String(format: "%.2f", valueUSD)
    }
    var previousStringUSD: String {
        return String(format: "%.2f", previousUSD)
    }
    var valueStringKZT: String {
        return String(format: "%.2f", valueKZT)
    }
    var previousStringKZT: String {
        return String(format: "%.2f", previousKZT)
    }
    var valueStringCNY: String {
        return String(format: "%.2f", valueCNY)
    }
    var previousStringCNY: String {
        return String(format: "%.2f", previousCNY)
    }
    
    var valueStringTenge: String {
        let inTenge = 100 / valueKZT
        return String(format: "%.2f", inTenge)
    }
    
    var preStringTenge: String {
        let inTenge = 100 / previousKZT
        return String(format: "%.2f", inTenge)
    }
    
}
