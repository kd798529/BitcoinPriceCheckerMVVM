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
        viewModel.currencyData.bind { [weak self] currencyData in
            // create a weak self refrence to avoid a memory issues.
            guard let self = self else { return }
            guard let currency = currencyData?.currency else { return }
            
            self.usdLabel.text = CurrencyUtility.formattedCurrency(currencyType: .usd, currencyData: currency)
            self.eurLabel.text = CurrencyUtility.formattedCurrency(currencyType: .eur, currencyData: currency)
            self.jpnLabel.text = CurrencyUtility.formattedCurrency(currencyType: .jpy, currencyData: currency)
        }
    }
}
