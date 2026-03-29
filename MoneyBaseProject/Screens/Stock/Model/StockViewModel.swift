//
//  StockViewModel.swift
//  MoneyBaseProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import SwiftUI
import Combine

class StockViewModel: ObservableObject {
    
    @Published var stock: StockDataModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var refreshTimer: Timer?
    private let refreshInterval: TimeInterval = 8000000000.0
    private var currentSymbol: String = ""
    
    deinit {
        stopAutoRefresh()
    }
    
    func fetchStockSummary(symbol: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let data = try await NetworkManager.shared.request(
                APIRouter.getStockSummary(symbol: symbol),
                responseType: StockDataModel.self
            )
            self.stock = data
        } catch {
            print("Error fetching stock summary:", error)
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func startAutoRefreshForSummary(symbol: String) {
        if symbol.isEmpty { return }
        currentSymbol = symbol
        stopAutoRefresh()
        
        // Fetch immediately
        Task {
            await fetchStockSummary(symbol: symbol)
        }
        
        // Schedule periodic refresh every 8 seconds
        refreshTimer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.startAutoRefreshForSummary(symbol: self.currentSymbol)
        }
    }
    
    func stopAutoRefresh() {
        refreshTimer?.invalidate()
        refreshTimer = nil    }
}
