//
//  JsonExtention.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import Foundation

func loadJson(forFilename fileName: String) -> NSDictionary? {

    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        if let data = NSData(contentsOf: url) {
            do {
                let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary

                return dictionary
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        print("Error!! Unable to load  \(fileName).json")
    }

    return nil
}


