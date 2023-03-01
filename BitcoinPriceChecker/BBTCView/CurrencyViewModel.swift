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
        
        currency[CurrencyConst.usd.rawValue] != nil ? delegate?.receiveUSD(currencyText: CurrencyUtility.formattedCurrency(currencyType: .usd, currencyData: currency) ) : nil
        
        currency[CurrencyConst.eur.rawValue] != nil ? delegate?.receiveEUR(currencyText: CurrencyUtility.formattedCurrency(currencyType: .eur, currencyData: currency) ) : nil

        currency[CurrencyConst.jpy.rawValue] != nil ? delegate?.receiveJPY(currencyText: CurrencyUtility.formattedCurrency(currencyType: .jpy, currencyData: currency) ) : nil
    }
}

protocol CurrencyViewModelDelegate: AnyObject {
    func receiveUSD(currencyText: String?)
    func receiveEUR(currencyText: String?)
    func receiveJPY(currencyText: String?)
}
