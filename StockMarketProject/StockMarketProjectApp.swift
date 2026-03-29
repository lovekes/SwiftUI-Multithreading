//
//  StockMarketProjectApp.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 23/03/26.
//

import SwiftUI

@main
struct StockMarketProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MarketListScreen()
                    .tabItem {
                        Label("Market", systemImage: "chart.line.uptrend.xyaxis")
                    }
                
                StockListScreen()
                    .tabItem {
                        Label("Stocks", systemImage: "chart.bar.fill")
                    }
            }
        }
    }
}
