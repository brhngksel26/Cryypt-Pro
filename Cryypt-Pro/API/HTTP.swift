//
//  HTTP.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 16.07.2023.
//

import Foundation

enum HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        enum Key: String{
            case contentType = "Content-Type"
            case apiKey = "X-CMC_PRO_API_KEY"
        }
        
        enum Value: String {
            case apiKey = "6653219b-5028-4ace-8af5-4cc819f7b748"
        }
    }
    
}
