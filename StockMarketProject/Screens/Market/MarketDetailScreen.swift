//
//  MarketDetailScreen.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI

struct MarketDetailScreen: View {
    let result: Result
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header Section
                headerSection
                
                // Price Section
                priceSection
                
                // Market Info Section
                marketInfoSection
                
                // Day Range Section
                dayRangeSection
                
                // Volume Section
                volumeSection
                
                // 52 Week Range Section
                fiftyTwoWeekRangeSection
            }
            .padding()
        }
        .navigationTitle(result.shortName ?? result.symbol ?? "Market Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text(result.shortName ?? result.symbol ?? "Unknown")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            if let longName = result.longName {
                Text(longName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            if let quoteType = result.quoteType {
                Text(quoteType)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Price Section
    private var priceSection: some View {
        VStack(spacing: 12) {
            Text("Price")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Current Price")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    if let price = result.regularMarketPrice {
                        Text(formatMarketPrice(price))
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                
                Spacer()
                
                if let change = result.regularMarketChange {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Change")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(formatChange(change))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(change.raw ?? 0 >= 0 ? .green : .red)
                    }
                }
            }
            
            if let changePercent = result.regularMarketChangePercent {
                HStack {
                    Text("Change Percent:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(formatPercent(changePercent))
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(changePercent.raw ?? 0 >= 0 ? .green : .red)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Market Info Section
    private var marketInfoSection: some View {
        VStack(spacing: 12) {
            Text("Market Information")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                if let market = result.market {
                    InfoItemView(title: "Market", value: market)
                }
                
                if let exchange = result.exchange {
                    InfoItemView(title: "Exchange", value: exchange)
                }
                
                if let region = result.region {
                    InfoItemView(title: "Region", value: region)
                }
                
                if let currency = result.currency {
                    InfoItemView(title: "Currency", value: currency)
                }
                
                if let fullExchangeName = result.fullExchangeName {
                    InfoItemView(title: "Full Exchange", value: fullExchangeName)
                }
                
                if let quoteSourceName = result.quoteSourceName {
                    InfoItemView(title: "Quote Source", value: quoteSourceName)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Day Range Section
    private var dayRangeSection: some View {
        VStack(spacing: 12) {
            Text("Day Range")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                if let dayHigh = result.regularMarketDayHigh {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("High")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(formatPrice(dayHigh))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
                
                if let dayLow = result.regularMarketDayLow {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Low")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(formatPriceLow(dayLow))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
            }
            
            if let dayRange = result.regularMarketDayRange {
                HStack {
                    Text("Day Range:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(dayRange.fmt ?? dayRange.raw ?? "N/A")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Volume Section
    private var volumeSection: some View {
        VStack(spacing: 12) {
            Text("Volume")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                if let volume = result.regularMarketVolume {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Volume")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(volume.longFmt ?? volume.fmt ?? "\(volume.raw ?? 0)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
                
                if let avgVolume = result.averageDailyVolume3Month {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Avg Volume (3M)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(avgVolume.longFmt ?? avgVolume.fmt ?? "\(avgVolume.raw ?? 0)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - 52 Week Range Section
    private var fiftyTwoWeekRangeSection: some View {
        VStack(spacing: 12) {
            Text("52 Week Range")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let range = result.fiftyTwoWeekRange {
                HStack {
                    Text("Range:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(range.fmt ?? range.raw ?? "N/A")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack {
                if let low = result.fiftyTwoWeekLow {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("52W Low")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(formatFiftyTwoWeekLow(low))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
                
                if let high = result.fiftyTwoWeekHigh {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("52W High")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(formatFiftyTwoWeekHigh(high))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
            }
            
            if let changePercent = result.fiftyTwoWeekChangePercent {
                HStack {
                    Text("52W Change:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(formatFiftyTwoWeekChangePercent(changePercent))
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(changePercent.raw ?? 0 >= 0 ? .green : .red)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    // MARK: - Helper Functions
    private func formatPrice(_ price: RegularMarketDayHigh?) -> String {
        if let fmt = price?.fmt {
            return fmt
        }
        if let raw = price?.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatMarketPrice(_ price: RegularMarketPrice?) -> String {
        if let fmt = price?.fmt {
            return fmt
        }
        if let raw = price?.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatPriceLow(_ price: RegularMarketDayLow) -> String {
        if let fmt = price.fmt {
            return fmt
        }
        if let raw = price.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatFiftyTwoWeekLow(_ price: FiftyTwoWeekLow) -> String {
        if let fmt = price.fmt {
            return fmt
        }
        if let raw = price.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatFiftyTwoWeekHigh(_ price: FiftyTwoWeekHigh) -> String {
        if let fmt = price.fmt {
            return fmt
        }
        if let raw = price.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatFiftyTwoWeekChangePercent(_ price: FiftyTwoWeekChangePercent) -> String {
        if let fmt = price.fmt {
            return fmt
        }
        if let raw = price.raw {
            return String(format: "$%.2f", raw)
        }
        return "N/A"
    }
    
    private func formatChange(_ change: RegularMarketChange?) -> String {
        if let fmt = change?.fmt {
            return fmt
        }
        if let raw = change?.raw {
            let sign = raw >= 0 ? "+" : ""
            return String(format: "%@%.2f", sign, raw)
        }
        return "N/A"
    }
    
    private func formatPercent(_ percent: RegularMarketChangePercent) -> String {
        if let fmt = percent.fmt {
            return fmt
        }
        if let raw = percent.raw {
            let sign = raw >= 0 ? "+" : ""
            return String(format: "%@%.2f%%", sign, raw)
        }
        return "N/A"
    }
}

struct InfoItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    NavigationStack {
//        MarketDetailScreen(result: Result(
//            symbol: "AAPL",
//            shortName: "Apple Inc.",
//            longName: "Apple Inc.",
//            market: "us_market",
//            exchange: "NASDAQ",
//            region: "US",
//            currency: "USD",
//            quoteType: "EQUITY",
//            regularMarketPrice: RegularMarketPrice(raw: 175.50, fmt: "$175.50"),
//            regularMarketChange: RegularMarketChange(raw: 2.35, fmt: "+$2.35"),
//            regularMarketChangePercent: RegularMarketChangePercent(raw: 1.36, fmt: "+1.36%"),
//            regularMarketDayHigh: RegularMarketPrice(raw: 176.20, fmt: "$176.20"),
//            regularMarketDayLow: RegularMarketPrice(raw: 173.50, fmt: "$173.50"),
//            regularMarketDayRange: RegularMarketDayRange(raw: "173.50 - 176.20", fmt: "173.50 - 176.20"),
//            regularMarketVolume: RegularMarketVolume(raw: 45000000, fmt: "45M", longFmt: "45,000,000"),
//            fiftyTwoWeekRange: FiftyTwoWeekRange(raw: "124.17 - 199.62", fmt: "124.17 - 199.62"),
//            fiftyTwoWeekLow: RegularMarketPrice(raw: 124.17, fmt: "$124.17"),
//            fiftyTwoWeekHigh: RegularMarketPrice(raw: 199.62, fmt: "$199.62"),
//            fiftyTwoWeekChangePercent: RegularMarketChangePercent(raw: 15.20, fmt: "+15.20%"),
//            fullExchangeName: "NASDAQ",
//            quoteSourceName: "Delayed"
//        ))
//    }
//}
