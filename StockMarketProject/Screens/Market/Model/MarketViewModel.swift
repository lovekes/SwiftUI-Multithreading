//
//  MarketViewModel.swift
//  StockMarketProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI
import Combine

class MarketViewModel: ObservableObject {
    
    @Published var marketData: MarketDataModel?
    @Published var marketSummaryResponse : MarketSummaryResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var refreshTimer: Timer?
    private let refreshInterval: TimeInterval = 8000000000.0
    
    deinit {
        stopAutoRefresh()
    }
    
    func fetchMarketData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let data = try await NetworkManager.shared.request(
                APIRouter.getMarketSummary,
                responseType: MarketDataModel.self
            )
            self.marketData = data
            self.marketSummaryResponse = data.marketSummaryResponse
        } catch {
            print("Error fetching market data:", error)
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func startAutoRefresh() {
        stopAutoRefresh()
        
        // Fetch immediately
        Task {
            await fetchMarketData()
        }
        
        // Schedule periodic refresh every 8 seconds
        refreshTimer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
            Task { [weak self] in
                await self?.fetchMarketData()
            }
        }
    }
    
    func stopAutoRefresh() {
        refreshTimer?.invalidate()
        refreshTimer = nil
    }
}
