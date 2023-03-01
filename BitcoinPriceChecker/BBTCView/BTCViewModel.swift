//
//  BTCViewModel.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import Foundation

final class BTCViewModel {
    var currencyData: ObservableObject<Currency?> = ObservableObject(value: nil)
    let prices = NetworkService.shared.getPrice()
    func getPrice(){

        currencyData.value = prices
    }
}
