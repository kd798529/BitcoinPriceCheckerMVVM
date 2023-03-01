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
    
    private let currencyViewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyViewModel.delegate = self
        currencyViewModel.refresh()

    }
    
    @IBAction func refreshButton(_ sender: Any) {
        currencyViewModel.refresh()
    }
}

extension BTCViewController: CurrencyViewModelDelegate {
    func receiveUSD(currencyText: String?) {
        Task { @MainActor in
            guard let text = currencyText else { return }
            self.usdLabel.text = text
        }
    }
    
    func receiveEUR(currencyText: String?) {
        Task { @MainActor in
            guard let text = currencyText else { return }
            self.eurLabel.text = text
        }
    }
    
    func receiveJPY(currencyText: String?) {
        Task { @MainActor in
            guard let text = currencyText else { return }
            self.jpnLabel.text = text
        }
    }
}
