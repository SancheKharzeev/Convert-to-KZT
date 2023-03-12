//
//  ViewController.swift
//  Convert to KZT
//
//  Created by Александр Х on 10.03.2023.
//

import UIKit

class ViewController: UIViewController, CurrencyManagerDelegate {
    
    @IBOutlet weak var usdCurrentPriceLabel: UILabel!
    @IBOutlet weak var usdPreviousPriceLabel: UILabel!
    @IBOutlet weak var kztCurrentPriceLabel: UILabel!
    @IBOutlet weak var kztPreviousPriceLabel: UILabel!
    @IBOutlet weak var cnyCurrentPriceLabel: UILabel!
    @IBOutlet weak var cnyPreviousPriceLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    @IBOutlet weak var inTengeCurrentPriceLabel: UILabel!
    @IBOutlet weak var inTengePreviousPriceLabel: UILabel!
    
    var currencyManager = CurrencyManager()
    
    @IBAction func updateDataButton(_ sender: UIButton) {
        currencyManager.fetchCurrency()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyManager.delegate = self
      
    }
    
    func didUpdateCurrency(currency: CurrencyModel) {
        DispatchQueue.main.async {
            print("1")
            self.usdCurrentPriceLabel.text = currency.valueStringUSD
            self.usdPreviousPriceLabel.text = currency.previousStringUSD
            self.kztCurrentPriceLabel.text = currency.valueStringKZT
            self.kztPreviousPriceLabel.text = currency.previousStringKZT
            self.cnyCurrentPriceLabel.text = currency.valueStringCNY
            self.cnyPreviousPriceLabel.text = currency.previousStringCNY
            self.currentDateLabel.text = currency.date
            self.inTengeCurrentPriceLabel.text = currency.valueStringTenge
            self.inTengePreviousPriceLabel.text = currency.preStringTenge
           
            

        }
    }
    
    func didFailWithError(error: Error) {
        print("didFailWithError")
    }

}


    
    
    

