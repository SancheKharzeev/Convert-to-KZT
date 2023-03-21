//
//  ViewController.swift
//  Convert to KZT
//
//  Created by Александр Х on 10.03.2023.
//

import UIKit

class ViewController: UIViewController, CurrencyManagerDelegate {
    
    

    @IBOutlet weak var currentDateLabel: UILabel!
    
 
    
    var currencyManager = CurrencyManager()
    
    let usdCurrentPriceLabel1 = SetText()
    let usdPreviousPriceLabel = SetText()
    let kztCurrentPriceLabel = SetText()
    let kztPreviousPriceLabel = SetText()
    let cnyCurrentPriceLabel = SetText()
    let cnyPreviousPriceLabel = SetText()
    let inTengeCurrentPriceLabel = SetText()
    let inTengePreviousPriceLabel = SetText()
    
    
    
   
    
    @IBAction func updateDataButton(_ sender: UIButton) {
        currencyManager.fetchCurrency()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyManager.delegate = self
        view.backgroundColor = .black
        viewLighterCorner()
        positionUSDLabel()
        positionUSD_Change_Label()
        positionKZTLabel()
        positionKZT_Change_Label()
        positionCNYLabel()
        positionCNY_Change_Label()
        positionRUBKZTLabel()
        positionRUBKZT_Change_Label()
        usdTitle()
        kztTitle()
        cnyTitle()
        viewBlackCube()
        
        
        
    }
    
    func didUpdateCurrency(currency: CurrencyModel) {
        DispatchQueue.main.async {
            
            self.usdCurrentPriceLabel1.text = currency.valueStringUSD
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
    
    func positionUSDLabel() {
        view.addSubview(usdCurrentPriceLabel1)
        usdCurrentPriceLabel1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usdCurrentPriceLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            usdCurrentPriceLabel1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -194)
        ])
    }
    
    func positionUSD_Change_Label() {
        view.addSubview(usdPreviousPriceLabel)
        usdPreviousPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usdPreviousPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            usdPreviousPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -162)
        ])
        usdPreviousPriceLabel.textColor = .systemMint
       
    }
    
    func positionKZTLabel() {
        view.addSubview(kztCurrentPriceLabel)
        kztCurrentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kztCurrentPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            kztCurrentPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
    }
    
    func positionKZT_Change_Label() {
        view.addSubview(kztPreviousPriceLabel)
        kztPreviousPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kztPreviousPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            kztPreviousPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30)
        ])
        kztPreviousPriceLabel.textColor = .systemMint
    }
    
    func positionCNYLabel() {
        view.addSubview(cnyCurrentPriceLabel)
        cnyCurrentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cnyCurrentPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            cnyCurrentPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65)
        ])
    }
    
    func positionCNY_Change_Label() {
        view.addSubview(cnyPreviousPriceLabel)
        cnyPreviousPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cnyPreviousPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            cnyPreviousPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
        cnyPreviousPriceLabel.textColor = .systemMint
    }
    
    func positionRUBKZTLabel() {
        view.addSubview(inTengeCurrentPriceLabel)
        inTengeCurrentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inTengeCurrentPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            inTengeCurrentPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70)
        ])
    }
    
    func positionRUBKZT_Change_Label() {
        view.addSubview(inTengePreviousPriceLabel)
        inTengePreviousPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inTengePreviousPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            inTengePreviousPriceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        inTengePreviousPriceLabel.textColor = .systemMint
    }
    
    func usdTitle() {
        let usdTitle = UILabel()
        usdTitle.text = "USD / RUB"
        usdTitle.textColor = .systemYellow
        usdTitle.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
        usdTitle.backgroundColor = .darkGray
        view.addSubview(usdTitle)
        
        usdTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usdTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            usdTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230)
        ])
    }
    
    func kztTitle() {
        let kztTitle = UILabel()
        kztTitle.text = "KZT / RUB"
        kztTitle.textColor = .systemYellow
        kztTitle.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
        kztTitle.backgroundColor = .darkGray
        view.addSubview(kztTitle)
        
        kztTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kztTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            kztTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130)
        ])
    }
    
    func cnyTitle() {
        let cnyTitle = UILabel()
        view.addSubview(cnyTitle)
        cnyTitle.text = "CNY / RUB"
        cnyTitle.textColor = .systemYellow
        cnyTitle.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
        cnyTitle.backgroundColor = .darkGray

        cnyTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cnyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            cnyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32)
        ])
    }
    
    func viewLighterCorner() {
        let viewCorner = UIView()
        view.addSubview(viewCorner)
        viewCorner.layer.borderWidth = 2
        viewCorner.layer.borderColor = UIColor.systemYellow.cgColor
        
        viewCorner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewCorner.widthAnchor.constraint(equalToConstant: 350),
            viewCorner.heightAnchor.constraint(equalToConstant: 400),
            viewCorner.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            viewCorner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
            ])
    }
    
    func viewBlackCube() {
        let viewBlackCube = UIView()
        view.addSubview(viewBlackCube)
        viewBlackCube.backgroundColor = .black
        
        viewBlackCube.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewBlackCube.widthAnchor.constraint(equalToConstant: 150),
            viewBlackCube.heightAnchor.constraint(equalToConstant: 20),
            viewBlackCube.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 87),
            viewBlackCube.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -262)
            ])
    }
}


