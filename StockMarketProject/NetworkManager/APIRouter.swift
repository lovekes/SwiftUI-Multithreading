//
//  APIRouter.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import Foundation

enum APIRouter {
    
    case getStockSummary(symbol: String)
    case getMarketSummary   // 👈 NEW
    
    var baseURL: String {
        return "https://yahoo-finance-real-time1.p.rapidapi.com"
    }
    
    var path: String {
        switch self {
        case .getStockSummary:
            return "/stock/get-summary"
        case .getMarketSummary:
            return "/market/get-summary" // 👈 NEW
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getStockSummary(let symbol):
            return [
                URLQueryItem(name: "lang", value: "en-US"),
                URLQueryItem(name: "symbol", value: symbol),
                URLQueryItem(name: "region", value: "US")
            ]
            
        case .getMarketSummary:
            return [
                URLQueryItem(name: "region", value: "US")
            ]
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "x-rapidapi-host": "yahoo-finance-real-time1.p.rapidapi.com",
            "x-rapidapi-key": "replace_with_your_api_key" // ⚠️ replace
        ]
    }
    
    func asURLRequest() -> URLRequest? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = queryItems
        
        guard let url = components?.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
}
