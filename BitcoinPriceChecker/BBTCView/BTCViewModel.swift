//
//  BTCViewModel.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import Foundation

final class BTCViewModel {
    var currencyData: ObservableObject<[String:Double]?> = ObservableObject(value: nil)
    
    func getPrice(){
        let prices = NetworkService.shared.getPrice()
        currencyData.value = prices
    }
}
