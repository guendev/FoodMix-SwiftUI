//
//  DoubleExtention.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//
import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
