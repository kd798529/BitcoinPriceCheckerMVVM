//
//  ObservableObject.swift
//  BitcoinPriceChecker
//
//  Created by Kwaku Dapaah on 2/21/23.
//

import Foundation

final class ObservableObject<T> {
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
