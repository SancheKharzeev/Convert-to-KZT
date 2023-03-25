//
//  PinkViewController.swift
//  Convert to KZT
//
//  Created by Александр Х on 23.03.2023.
//

import UIKit

class PinkViewController: UIViewController, UITextFieldDelegate {

    let inputField = UITextField()
    let textInputTitle = UILabel()
    let calcButton = UIButton()
    let resultLabel = UILabel()
    var usdPriceValue = Double()
    
    var receivedUSDString = ""
    var receivedCNYString = ""
    var receivedKZTString = ""
    
    let usdLabelPrice = UILabel()
    let cnyLabelPrice = UILabel()
    let kztLabelPrice = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputParameter()
        calculateButton()
        printUSD()
        printCNY()
        printKZT()
        title = "Калькулятор валют"
        view.backgroundColor = .systemPink
        inputField.delegate = self
    }
    
    // разрешает вводить только цифры в текстфилд
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let s = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
          guard !s.isEmpty else { return true }
          let numberFormatter = NumberFormatter()
          numberFormatter.numberStyle = .none
          return numberFormatter.number(from: s)?.intValue != nil
     }
    
    
    func printUSD() {
        view.addSubview(usdLabelPrice)
        
        usdLabelPrice.backgroundColor = .black
        
        usdLabelPrice.textColor = .systemYellow
        usdLabelPrice.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
      
        usdLabelPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usdLabelPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            usdLabelPrice.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
        ])
    }
    
    func printCNY() {
        view.addSubview(cnyLabelPrice)
        
        cnyLabelPrice.backgroundColor = .black
        cnyLabelPrice.textColor = .systemYellow
        cnyLabelPrice.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
      
        cnyLabelPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cnyLabelPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            cnyLabelPrice.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120)
        ])
    }
    
    func printKZT() {
        view.addSubview(kztLabelPrice)
        
        kztLabelPrice.backgroundColor = .black
        kztLabelPrice.textColor = .systemYellow
        kztLabelPrice.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 29)
        
        kztLabelPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kztLabelPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            kztLabelPrice.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90)
        ])
    }
    
  
    
    func inputParameter() {
        
        view.addSubview(textInputTitle)
        view.addSubview(inputField)
        inputField.backgroundColor = .systemYellow
        inputField.borderStyle = .roundedRect
        inputField.text = "1"
        inputField.textAlignment = .center
        inputField.placeholder = "Введите сумму"
        inputField.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 20)
        
        textInputTitle.textColor = .systemYellow
        textInputTitle.text = "Введите сумму в рублях"
        textInputTitle.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 25)
        
        textInputTitle.layer.shadowColor = UIColor.black.cgColor
        textInputTitle.layer.shadowOpacity = 1
        textInputTitle.layer.shadowOffset = .zero
        textInputTitle.layer.shadowRadius = 5

        
        
        inputField.translatesAutoresizingMaskIntoConstraints = false
        textInputTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputField.widthAnchor.constraint(equalToConstant: 250),
            inputField.heightAnchor.constraint(equalToConstant: 40),
            inputField.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            inputField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textInputTitle.heightAnchor.constraint(equalToConstant: 20),
            textInputTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            textInputTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            ])
    }

    func calculateButton() {
        calcButton.setTitle("Пересчитать", for: .normal)
        calcButton.layer.cornerRadius = 6
        calcButton.setTitleColor(.black, for: .normal)
        calcButton.backgroundColor = .systemYellow
        view.addSubview(calcButton)
        
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcButton.widthAnchor.constraint(equalToConstant: 150),
            calcButton.heightAnchor.constraint(equalToConstant: 50),
          
            calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            calcButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
            ])
        
        calcButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
    }
 
    func result() {
  
            let amountUSD = (Double(inputField.text!)!) / (Double(receivedUSDString)!)
            usdLabelPrice.text = "\(String(format: "%.2f", (amountUSD))) долларов"
            
            let amountKZT = (Double(inputField.text!)!) * (Double(receivedKZTString)!)
            kztLabelPrice.text = "\(String(format: "%.2f", (amountKZT))) тенге"
            
            let amountCNY = (Double(inputField.text!)!) / (Double(receivedCNYString)!)
            cnyLabelPrice.text = "\(String(format: "%.2f", (amountCNY))) юаней"
    }
    
   @objc func buttonAction() {
       result()
       print(inputField.text!)
       
    }
}


