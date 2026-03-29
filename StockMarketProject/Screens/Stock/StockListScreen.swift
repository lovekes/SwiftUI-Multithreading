//
//  StockListScreen.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI

struct StockListScreen: View {
    
    @State private var searchText = ""
    @State private var stockSymbols = ["AAPL", "GOOGL", "MSFT", "AMZN", "TSLA", "META", "NVDA", "WOOF", "AMD", "NFLX"]
    
    var filteredSymbols: [String] {
        if searchText.isEmpty {
            return stockSymbols
        }
        return stockSymbols.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredSymbols, id: \.self) { symbol in
                    NavigationLink(destination: StockDetailScreen(symbol: symbol)) {
                        StockRowView(symbol: symbol)
                    }
                }
                // Show search result if not in list and has text
            }
            .searchable(text: $searchText, prompt: "Search or add stock (default: AAPL)")
            .navigationTitle("Stocks")
            .onAppear {
                // Default to AAPL if search is empty
                if searchText.isEmpty {
                    searchText = "AAPL"
                }
            }
        }
    }
}

struct StockRowView: View {
    let symbol: String
    @StateObject private var viewModel = StockViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(symbol)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                if let summary = viewModel.stock?.price {
                    Text(summary.shortName ?? summary.longName ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                if let price = viewModel.stock?.price {
                    Text(formatPrice(price.regularMarketPrice))
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    if let changePercent = price.regularMarketChange {
                        Text(formatPercent(changePercent))
                            .font(.caption)
                            .foregroundColor(changePercent >= 0 ? .green : .red)
                    }
                } else {
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 4)
        .onAppear {
            viewModel.startAutoRefreshForSummary(symbol: symbol)
        }
    }
    
    private func formatPrice(_ price: Double?) -> String {
        guard let price = price else { return "--" }
        return String(format: "$%.2f", price)
    }
    
    private func formatPercent(_ percent: Double?) -> String {
        guard let percent = percent else { return "--" }
        let sign = percent >= 0 ? "+" : ""
        return String(format: "%@%.2f%%", sign, percent)
    }
}

#Preview {
    StockListScreen()
}
