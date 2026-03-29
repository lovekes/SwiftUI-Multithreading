//
//  StockDetailScreen.swift
//  MoneyBaseProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI

struct StockDetailScreen: View {
    
    let symbol: String
    @StateObject private var viewModel = StockViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header - Price & Change
                priceHeaderSection
                
                // Key Statistics
                keyStatisticsSection
                
                // Analyst Recommendations
                analystSection
                
                // Company Info
                companyInfoSection
            }
            .padding()
        }
        .navigationTitle(symbol)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.startAutoRefreshForSummary(symbol: symbol)
        }
        .onDisappear {
            viewModel.stopAutoRefresh()
        }
    }
    
    // MARK: - Price Header Section
    private var priceHeaderSection: some View {
        VStack(spacing: 8) {
            if let price = viewModel.stock?.price {
                // Stock Name
                Text(price.shortName ?? price.longName ?? symbol)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                // Current Price
                Text(formatPrice(price.regularMarketPrice))
                    .font(.system(size: 48, weight: .bold))
                
                // Price Change
                HStack(spacing: 8) {
                    if let change = price.regularMarketChange {
                        Text(formatChange(change))
                            .font(.headline)
                    }
                    
                    if let changePercent = price.regularMarketChangePercent {
                        Text(formatPercent(changePercent))
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(changePercent >= 0 ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                            .foregroundColor(changePercent >= 0 ? .green : .red)
                            .cornerRadius(8)
                    }
                }
                
                // Market Info
                HStack {
                    Text("Market Cap")
                    Spacer()
                    Text(formatMarketCap(price.marketCap))
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // MARK: - Key Statistics Section
    private var keyStatisticsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Key Statistics")
                .font(.headline)
                .padding(.bottom, 8)
            
            if let keyStatistics = viewModel.stock?.defaultKeyStatistics {
                Group {
                    statisticRow("52 Week High", value: formatPrice(keyStatistics.weekChange))
                    statisticRow("52 Week Low", value: formatPrice(keyStatistics.sandP52WeekChange))
                    statisticRow("P/E Ratio", value: keyStatistics.shortRatio.map { String(format: "%.2f", $0) } ?? "--")
                    statisticRow("EPS (TTM)", value: keyStatistics.forwardPE.map { String(format: "%.2f", $0) } ?? "--")
                    statisticRow("Dividend Yield", value: keyStatistics.lastDividendValue.map { String(format: "%.2f%%", $0 * 100) } ?? "--")
                    statisticRow("Beta", value: keyStatistics.beta.map { String(format: "%.2f", $0) } ?? "--")
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // MARK: - Analyst Section
    private var analystSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Analyst Ratings")
                .font(.headline)
                .padding(.bottom, 8)
            
            if let summary = viewModel.stock?.financialData {
                Group {
                    analystRow("Recommendation", value: summary.recommendationKey?.capitalized ?? "--")
                    analystRow("Target Low", value: formatPrice(summary.targetLowPrice))
                    analystRow("Target Mean", value: formatPrice(summary.targetMeanPrice))
                    analystRow("Target High", value: formatPrice(summary.targetHighPrice))
                    analystRow("Target Median", value: formatPrice(summary.targetMedianPrice))
                    analystRow("Analyst Count", value: summary.numberOfAnalystOpinions.map { "\($0)" } ?? "--")
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // MARK: - Company Info Section
    private var companyInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Company Info")
                .font(.headline)
                .padding(.bottom, 8)
            
            if let summary = viewModel.stock?.summaryProfile {
                Group {
                    companyRow("Sector", value: summary.sector ?? "--")
                    companyRow("Industry", value: summary.industry ?? "--")
                    companyRow("Website", value: summary.website ?? "--")
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    
    // MARK: - Helper Views
    private func statisticRow(_ title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
    
    private func analystRow(_ title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
    }
    
    private func companyRow(_ title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
    }
    
    // MARK: - Formatting Helpers
    private func formatPrice(_ price: Double?) -> String {
        guard let price = price else { return "--" }
        return String(format: "$%.2f", price)
    }
    
    private func formatChange(_ change: Double?) -> String {
        guard let change = change else { return "--" }
        let sign = change >= 0 ? "+" : ""
        return String(format: "%@%.2f", sign, change)
    }
    
    private func formatPercent(_ percent: Double?) -> String {
        guard let percent = percent else { return "--" }
        let sign = percent >= 0 ? "+" : ""
        return String(format: "%@%.2f%%", sign, percent)
    }
    
    private func formatMarketCap(_ marketCap: Int?) -> String {
        guard let marketCap = marketCap else { return "--" }
        
        if marketCap >= 1_000_000_000_000 {
            return String(format: "$%.2fT", Double(marketCap) / 1_000_000_000_000)
        } else if marketCap >= 1_000_000_000 {
            return String(format: "$%.2fB", Double(marketCap) / 1_000_000_000)
        } else if marketCap >= 1_000_000 {
            return String(format: "$%.2fM", Double(marketCap) / 1_000_000)
        } else {
            return "$\(marketCap)"
        }
    }
    
    private func formatVolume(_ volume: Int?) -> String {
        guard let volume = volume else { return "--" }
        
        if volume >= 1_000_000_000 {
            return String(format: "%.2fB", Double(volume) / 1_000_000_000)
        } else if volume >= 1_000_000 {
            return String(format: "%.2fM", Double(volume) / 1_000_000)
        } else if volume >= 1_000 {
            return String(format: "%.2fK", Double(volume) / 1_000)
        } else {
            return "\(volume)"
        }
    }
}

#Preview {
    NavigationStack {
        StockDetailScreen(symbol: "AAPL")
    }
}
