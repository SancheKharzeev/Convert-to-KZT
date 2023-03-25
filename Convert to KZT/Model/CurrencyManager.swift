//
//  CurrencyManager.swift
//  Convert to KZT
//
//  Created by Александр Х on 10.03.2023.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdateCurrency(currency: CurrencyModel)
    func didFailWithError(error: Error)
}


struct CurrencyManager {
    let currencyURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    var delegate: CurrencyManagerDelegate?
    
    func fetchCurrency() { // подготавливаем ссылку для извлечения курса валюты
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        performReques(with: urlString)
       
    }
    
    func performReques(with urlString: String) { // выполняем запрос
        
        if let url = URL(string: urlString) {
           // print(url)
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let currency = self.parseJSON(currencyData: safeData) {
                        self.delegate?.didUpdateCurrency(currency: currency)
                        
                    }
                }
                
            }
            
            task.resume()
            
        }
    }
    
    func parseJSON(currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
           // print(decodedData.Valute.CNY.Value)
            let usdCurrent = decodedData.Valute.USD.Value
            let usdPrevious = decodedData.Valute.USD.Previous
            
            let kztCurrent = decodedData.Valute.KZT.Value
            let kztPrevious = decodedData.Valute.KZT.Previous
            
            let cnyCurrent = decodedData.Valute.CNY.Value
            let cnyPrevious = decodedData.Valute.CNY.Previous
            
            let dateString = decodedData.Date
            
            let formatter = ISO8601DateFormatter()
            let yourDate = formatter.date(from: dateString)!
            let printDate = "\(yourDate)"
            
            _ = 100
            
            let currency = CurrencyModel(date: printDate, valueUSD: usdCurrent, previousUSD: usdPrevious, valueKZT: kztCurrent, previousKZT: kztPrevious, valueCNY: cnyCurrent, previousCNY: cnyPrevious)
            
            return currency
            
            
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            
            
        }
        return nil
    }
    
  
}
