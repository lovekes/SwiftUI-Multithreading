//
//  MarketListScreen.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI

struct MarketListScreen: View {
    
    @StateObject private var viewModel = MarketViewModel()
    @State private var searchText = ""
    
    var filteredResults: [Result] {
        if searchText.isEmpty {
            return viewModel.marketSummaryResponse?.result ?? []
        }
        return viewModel.marketSummaryResponse?.result?.filter { result in
            let nameMatch = result.shortName?.localizedCaseInsensitiveContains(searchText) ?? false
            let symbolMatch = result.symbol?.localizedCaseInsensitiveContains(searchText) ?? false
            return nameMatch || symbolMatch
        } ?? []
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.marketData == nil {
                    ProgressView("Loading market data...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text("Error loading data")
                            .font(.headline)
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        Button("Retry") {
                            Task {
                                await viewModel.fetchMarketData()
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(filteredResults, id: \.symbol) { result in
                            NavigationLink(destination: MarketDetailScreen(result: result)) {
                                MarketRowView(result: result)
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search by name or symbol")
                }
            }
            .navigationTitle("Market Summary")
            .onAppear {
                 viewModel.startAutoRefresh()
            }
        }
    }
}

struct MarketRowView: View {
    let result: Result
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(result.shortName ?? result.symbol ?? "Unknown")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                if let market = result.market {
                    Text(market)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                if let price = result.regularMarketPrice {
                    Text(formatPrice(price))
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                if let change = result.regularMarketChange {
                    Text(formatChange(change))
                        .font(.caption)
                        .foregroundColor(change.raw ?? 0 >= 0 ? .green : .red)
                }
            }
        }
        .padding(.vertical, 4)
    }
    
    func formatPrice(_ price: RegularMarketPrice) -> String {
        if let fmt = price.fmt {
            return fmt
        }
        if let raw = price.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    func formatChange(_ change: RegularMarketChange) -> String {
        if let fmt = change.fmt {
            return fmt
        }
        if let raw = change.raw {
            let sign = raw >= 0 ? "+" : ""
            return String(format: "%@%.2f", sign, raw)
        }
        return "N/A"
    }
}

#Preview {
    MarketListScreen()
}
