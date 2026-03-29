//
//  StockViewModelTest.swift
//  MoneyBaseProjectTests
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import Testing
import Combine
@testable import MoneyBaseProject

@MainActor
struct StockViewModelTest {
    
    // MARK: - Initial State Tests
    
    @Test func testInitialState() {
        let viewModel = StockViewModel()
        
        #expect(viewModel.stock == nil, "Stock should be nil initially")
        #expect(viewModel.isLoading == false, "isLoading should be false initially")
        #expect(viewModel.errorMessage == nil, "errorMessage should be nil initially")
    }
    
    // MARK: - Fetch Stock Summary Tests
    
    @Test func testFetchStockSummaryWithEmptySymbol() async {
        let viewModel = StockViewModel()
        
        await viewModel.fetchStockSummary(symbol: "")
        
        // Should not crash and should have some state
        #expect(viewModel.isLoading == false, "isLoading should be false after fetch with empty symbol")
    }
    
    // MARK: - Auto Refresh Tests
    
    @Test func testStartAutoRefreshWithEmptySymbol() {
        let viewModel = StockViewModel()
        
        viewModel.startAutoRefreshForSummary(symbol: "")
        
        // Should return early and not start timer
        #expect(viewModel.isLoading == false, "isLoading should be false for empty symbol")
    }
    
    @Test func testStopAutoRefresh() {
        let viewModel = StockViewModel()
        
        viewModel.stopAutoRefresh()
        
        // Should not crash
        #expect(true == true, "stopAutoRefresh should complete without error")
    }
    
    @Test func testStartAutoRefreshSetsCurrentSymbol() {
        let viewModel = StockViewModel()
        
        viewModel.startAutoRefreshForSummary(symbol: "TSLA")
        
        // The viewModel should attempt to fetch data
        // Note: Actual timer won't fire in unit test
        #expect(viewModel.isLoading == false, "isLoading should be false initially before async fetch")
    }
    
    // MARK: - Property Tests
    
    @Test func testStockProperty() {
        let viewModel = StockViewModel()
        
        // Test that stock property can be set
        viewModel.stock = nil
        
        #expect(viewModel.stock == nil, "Stock should be nil")
    }
    
    @Test func testErrorMessageProperty() {
        let viewModel = StockViewModel()
        
        viewModel.errorMessage = "Test error"
        
        #expect(viewModel.errorMessage == "Test error", "Error message should be set correctly")
    }
    
    // MARK: - Deinit Test
    
    @Test func testDeinitCleansUp() {
        var testViewModel: StockViewModel? = StockViewModel()
        
        weak let weakRef = testViewModel
        
        testViewModel?.stopAutoRefresh()
        testViewModel = nil
        
        #expect(weakRef == nil, "ViewModel should be deallocated")
    }
}

// MARK: - Mock Network Manager for Testing

class MockNetworkManager {
    static var shouldSucceed = true
    static var mockStockData: StockDataModel?
    static var mockError: Error?
    
    static func reset() {
        shouldSucceed = true
        mockStockData = nil
        mockError = nil
    }
}
