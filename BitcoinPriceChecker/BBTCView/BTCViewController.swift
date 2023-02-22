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
        viewModel.getPrice()
        setupBinders()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        viewModel.getPrice()
    }
    
    
    private func setupBinders() {
        viewModel.currencyData.bind { [weak self] currency in
            // create a weak self refrence to avoid a memory issues.
            guard let self = self else { return }
            
            self.usdLabel.text = self.doubleToStringMoney(price: currency?["USD"] ?? 00.00, currencyCode: "USD")
            self.eurLabel.text = self.doubleToStringMoney(price: currency?["EUR"] ?? 00.00, currencyCode: "EUR")
            self.jpnLabel.text = self.doubleToStringMoney(price: currency?["JPY"] ?? 00.00, currencyCode: "JPY")
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





