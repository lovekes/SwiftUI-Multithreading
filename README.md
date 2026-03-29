# StockMarkete - SwiftUI Multithreading Demo

A SwiftUI iOS application demonstrating modern multithreading patterns and Swift Concurrency (async/await) for real-time financial data fetching and display.

## 📱 Demo

https://github.com/user-attachments/assets/df8e94dd-72b0-49ad-bd7a-94d663268799

## 📱 Features

- **Market Summary**: View real-time market data with auto-refresh functionality
- **Stock Details**: Search and view detailed stock information for popular symbols
- **Real-time Updates**: Automatic data refresh every 8 seconds
- **Search Functionality**: Filter markets and stocks by name or symbol
- **Error Handling**: Graceful error handling with retry functionality
- **Responsive UI**: Smooth, non-blocking UI with background data fetching

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

```
StockMarketProject/
├── Screens/
│   ├── Market/
│   │   ├── MarketListScreen.swift      # Market list view
│   │   ├── MarketDetailScreen.swift    # Market detail view
│   │   └── Model/
│   │       ├── MarketDataModel.swift   # Market data models
│   │       └── MarketViewModel.swift   # Market business logic
│   └── Stock/
│       ├── StockListScreen.swift       # Stock list view
│       ├── StockDetailScreen.swift     # Stock detail view
│       └── Model/
│           ├── StockDataModel.swift    # Stock data models
│           └── StockViewModel.swift    # Stock business logic
├── NetworkManager/
│   ├── NetworkManager.swift            # Singleton network manager
│   └── APIRouter.swift                 # API endpoint definitions
└── StockMarketProjectApp.swift           # Main app entry point
```

## 🚀 Multithreading Implementation

This project showcases modern Swift Concurrency patterns for efficient multithreading:

### 1. **Async/Await Pattern**
All network requests use Swift's modern `async/await` syntax for clean, readable asynchronous code:

```swift
func fetchMarketData() async {
    isLoading = true
    errorMessage = nil
    
    do {
        let data = try await NetworkManager.shared.request(
            APIRouter.getMarketSummary,
            responseType: MarketDataModel.self
        )
        self.marketData = data
    } catch {
        errorMessage = error.localizedDescription
    }
    
    isLoading = false
}
```

### 2. **NetworkManager with URLSession**
The [`NetworkManager`](StockMarketProject/NetworkManager/NetworkManager.swift:17) class uses URLSession's async/await API for efficient network requests:

```swift
func request<T: Decodable>(
    _ route: APIRouter,
    responseType: T.Type
) async throws -> T {
    guard let request = route.asURLRequest() else {
        throw NetworkError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(for: request)
    // ... handle response
}
```

### 3. **Task Management**
ViewModels use `Task` blocks to execute async operations from synchronous contexts:

```swift
Task {
    await fetchMarketData()
}
```

### 4. **Timer-based Auto-Refresh**
Periodic data updates are handled using `Timer` with weak self references to prevent memory leaks:

```swift
refreshTimer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { [weak self] _ in
    Task { [weak self] in
        await self?.fetchMarketData()
    }
}
```

### 5. **Main Thread Safety**
UI updates are automatically handled on the main thread through SwiftUI's `@Published` properties and `@StateObject` wrappers.

## 🔌 API Integration

The app integrates with the **Yahoo Finance Real-Time API** via RapidAPI:

- **Base URL**: `https://yahoo-finance-real-time1.p.rapidapi.com`
- **Endpoints**:
  - `/market/get-summary` - Fetch market summary data
  - `/stock/get-summary` - Fetch individual stock details

### API Configuration

To use your own API key, update the [`APIRouter.swift`](StockMarketProject/NetworkManager/APIRouter.swift:52) file:

```swift
"x-rapidapi-key": "your_api_key_here"
```

## 📦 Dependencies

This project uses only native iOS frameworks:

- **SwiftUI** - Declarative UI framework
- **Foundation** - Core Swift library
- **Combine** - Reactive programming (for `@Published` and `@StateObject`)
- **URLSession** - Network requests with async/await

## 🛠️ Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## 📲 Installation

1. Clone the repository:
```bash
git clone <repository-url>
```

2. Open the project in Xcode:
```bash
open StockMarketProject.xcodeproj
```

3. Configure your API key in [`APIRouter.swift`](StockMarketProject/NetworkManager/APIRouter.swift:52)

4. Build and run the project on a simulator or device

## 🧪 Testing

The project includes unit tests for ViewModels:

- [`MarketViewModelTest.swift`](StockMarketProjectTests/MarketViewModelTest.swift:1) - Tests for market data fetching
- [`StockViewModelTest.swift`](StockMarketProjectTests/StockViewModelTest.swift:1) - Tests for stock data fetching

Run tests using:
```bash
Cmd + U in Xcode
```

## 🎯 Key Learning Points

This project demonstrates:

1. **Swift Concurrency**: Modern async/await pattern for asynchronous operations
2. **MVVM Architecture**: Clean separation of concerns
3. **Network Layer Design**: Singleton pattern with type-safe API routing
4. **State Management**: Using `@StateObject`, `@Published`, and `@State` effectively
5. **Memory Management**: Proper use of `[weak self]` in closures
6. **Error Handling**: Comprehensive error handling with user feedback
7. **Auto-Refresh**: Timer-based periodic data updates
8. **Search & Filter**: Real-time filtering of data

## 👨‍💻 Author

**Lokesh Kumawat**
- Created: March 23, 2026

## 📄 License

This project is available for educational purposes.

---

*Built with ❤️ using SwiftUI and Swift Concurrency*
