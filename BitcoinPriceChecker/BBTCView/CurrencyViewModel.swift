//
//  CurrencyViewModel.swift
//  BitcoinPriceChecker
//
//  Created by Leng Trang on 2/27/23.
//

import Foundation

class CurrencyViewModel {
    weak var delegate: CurrencyViewModelDelegate?
    
    let networkManager = NetworkManager()
    
    init(){
        networkManager.delegate = self
    }
    
    func refresh(){
        networkManager.getServiceData()
    }
}

extension CurrencyViewModel: CurrencyDataDelegate {
    func receiveCurrencyData(currencyInfo: [String: Double]?) {
        guard let currency = currencyInfo else { return }
        
        var usdText: String? {
            guard currency[CurrencyConst.usd.rawValue] != nil else { return nil }
            let usdFormatted = CurrencyUtility.formattedCurrency(currencyType: .usd, currencyData: currency)
            delegate?.receiveUSD(currencyText: usdFormatted)
            return usdFormatted
        }
        var eurText: String? {
            guard currency[CurrencyConst.eur.rawValue] != nil else { return nil }
            let eurFormatted = CurrencyUtility.formattedCurrency(currencyType: .eur, currencyData: currency)
            delegate?.receiveEUR(currencyText: eurFormatted)
            return eurFormatted
        }
        var jpyText: String? {
            guard currency[CurrencyConst.jpy.rawValue] != nil else { return nil }
            let jpyFormatted = CurrencyUtility.formattedCurrency(currencyType: .jpy, currencyData: currency)
            delegate?.receiveJPY(currencyText: jpyFormatted)
            return jpyFormatted
        }
        delegate?.receiveAll(usd: usdText, eur: eurText, jpy: jpyText)
    }
}

protocol CurrencyViewModelDelegate: AnyObject {
    func receiveUSD(currencyText: String?)
    func receiveEUR(currencyText: String?)
    func receiveJPY(currencyText: String?)
    func receiveAll(usd: String?, eur: String?, jpy: String?)
}
