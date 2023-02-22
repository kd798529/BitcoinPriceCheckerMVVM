//
//  ViewController.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import UIKit

class BTCViewController: UIViewController {
    
        
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var eurLabel: UILabel!
    
    @IBOutlet weak var jpnLabel: UILabel!
    
    private let viewModel = BTCViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupBinders()
        
        viewModel.getPrice()
        
        
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        viewModel.getPrice()
    }
    
    
    private func setupBinders() {
        viewModel.currencyData.bind { [weak self] currency in
            if let nCurrency = currency {
                if let usdPrice = nCurrency["USD"] {
                    self?.usdLabel.text = self?.doubleToStringMoney(price: usdPrice, currencyCode: "USD")
                }
                if let eurPrice = nCurrency["EUR"] {
                    self?.eurLabel.text = self?.doubleToStringMoney(price: eurPrice, currencyCode: "EUR")
                }
                if let jpnPrice = nCurrency["JPY"] {
                    self?.jpnLabel.text = self?.doubleToStringMoney(price: jpnPrice, currencyCode: "JPY")
                }
            }
        }
    }
    
    func doubleToStringMoney(price: Double, currencyCode: String) -> String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        
        formatter.currencyCode = currencyCode
        
        let priceString = formatter.string(from: NSNumber(value: price))
        return priceString
    }
}





