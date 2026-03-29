//
//  MarketDataModel.swift
//  MoneyBaseProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import Foundation
struct MarketDataModel : Codable {
    let marketSummaryResponse : MarketSummaryResponse?

    enum CodingKeys: String, CodingKey {

        case marketSummaryResponse = "marketSummaryResponse"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        marketSummaryResponse = try values.decodeIfPresent(MarketSummaryResponse.self, forKey: .marketSummaryResponse)
    }

}

struct MarketSummaryResponse : Codable {
    let result : [Result]?
    let marketCategoryLongName : String?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case marketCategoryLongName = "marketCategoryLongName"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([Result].self, forKey: .result)
        marketCategoryLongName = try values.decodeIfPresent(String.self, forKey: .marketCategoryLongName)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct RegularMarketChange : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketDayHigh : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketDayLow : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketDayRange : Codable {
    let raw : String?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(String.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketOpen : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketPreviousClose : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketPrice : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketTime : Codable {
    let raw : Int?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct RegularMarketVolume : Codable {
    let raw : Int?
    let fmt : String?
    let longFmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
        case longFmt = "longFmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
        longFmt = try values.decodeIfPresent(String.self, forKey: .longFmt)
    }

}

struct Result : Codable {
    let symbol : String?
    let twoHundredDayAverageChangePercent : TwoHundredDayAverageChangePercent?
    let fiftyTwoWeekLowChangePercent : FiftyTwoWeekLowChangePercent?
    let language : String?
    let regularMarketDayRange : RegularMarketDayRange?
    let regularMarketDayHigh : RegularMarketDayHigh?
    let twoHundredDayAverageChange : TwoHundredDayAverageChange?
    let askSize : AskSize?
    let twoHundredDayAverage : TwoHundredDayAverage?
    let fiftyTwoWeekHighChange : FiftyTwoWeekHighChange?
    let fiftyTwoWeekRange : FiftyTwoWeekRange?
    let fiftyDayAverageChange : FiftyDayAverageChange?
    let exchangeDataDelayedBy : Int?
    let averageDailyVolume3Month : AverageDailyVolume3Month?
    let firstTradeDateMilliseconds : Int?
    let fiftyTwoWeekChangePercent : FiftyTwoWeekChangePercent?
    let hasPrePostMarketData : Bool?
    let fiftyTwoWeekLow : FiftyTwoWeekLow?
    let regularMarketVolume : RegularMarketVolume?
    let market : String?
    let quoteSourceName : String?
    let messageBoardId : String?
    let priceHint : Int?
    let sourceInterval : Int?
    let regularMarketDayLow : RegularMarketDayLow?
    let exchange : String?
    let region : String?
    let shortName : String?
    let fiftyDayAverageChangePercent : FiftyDayAverageChangePercent?
    let fullExchangeName : String?
    let gmtOffSetMilliseconds : Int?
    let regularMarketOpen : RegularMarketOpen?
    let regularMarketTime : RegularMarketTime?
    let regularMarketChangePercent : RegularMarketChangePercent?
    let quoteType : String?
    let averageDailyVolume10Day : AverageDailyVolume10Day?
    let fiftyTwoWeekLowChange : FiftyTwoWeekLowChange?
    let fiftyTwoWeekHighChangePercent : FiftyTwoWeekHighChangePercent?
    let typeDisp : String?
    let tradeable : Bool?
    let currency : String?
    let regularMarketPreviousClose : RegularMarketPreviousClose?
    let fiftyTwoWeekHigh : FiftyTwoWeekHigh?
    let exchangeTimezoneName : String?
    let regularMarketChange : RegularMarketChange?
    let bidSize : BidSize?
    let cryptoTradeable : Bool?
    let fiftyDayAverage : FiftyDayAverage?
    let exchangeTimezoneShortName : String?
    let regularMarketPrice : RegularMarketPrice?
    let customPriceAlertConfidence : String?
    let marketState : String?
    let ask : Ask?
    let bid : Bid?
    let triggerable : Bool?
    let corporateActions : [String]?
    let longName : String?

    enum CodingKeys: String, CodingKey {

        case symbol = "symbol"
        case twoHundredDayAverageChangePercent = "twoHundredDayAverageChangePercent"
        case fiftyTwoWeekLowChangePercent = "fiftyTwoWeekLowChangePercent"
        case language = "language"
        case regularMarketDayRange = "regularMarketDayRange"
        case regularMarketDayHigh = "regularMarketDayHigh"
        case twoHundredDayAverageChange = "twoHundredDayAverageChange"
        case askSize = "askSize"
        case twoHundredDayAverage = "twoHundredDayAverage"
        case fiftyTwoWeekHighChange = "fiftyTwoWeekHighChange"
        case fiftyTwoWeekRange = "fiftyTwoWeekRange"
        case fiftyDayAverageChange = "fiftyDayAverageChange"
        case exchangeDataDelayedBy = "exchangeDataDelayedBy"
        case averageDailyVolume3Month = "averageDailyVolume3Month"
        case firstTradeDateMilliseconds = "firstTradeDateMilliseconds"
        case fiftyTwoWeekChangePercent = "fiftyTwoWeekChangePercent"
        case hasPrePostMarketData = "hasPrePostMarketData"
        case fiftyTwoWeekLow = "fiftyTwoWeekLow"
        case regularMarketVolume = "regularMarketVolume"
        case market = "market"
        case quoteSourceName = "quoteSourceName"
        case messageBoardId = "messageBoardId"
        case priceHint = "priceHint"
        case sourceInterval = "sourceInterval"
        case regularMarketDayLow = "regularMarketDayLow"
        case exchange = "exchange"
        case region = "region"
        case shortName = "shortName"
        case fiftyDayAverageChangePercent = "fiftyDayAverageChangePercent"
        case fullExchangeName = "fullExchangeName"
        case gmtOffSetMilliseconds = "gmtOffSetMilliseconds"
        case regularMarketOpen = "regularMarketOpen"
        case regularMarketTime = "regularMarketTime"
        case regularMarketChangePercent = "regularMarketChangePercent"
        case quoteType = "quoteType"
        case averageDailyVolume10Day = "averageDailyVolume10Day"
        case fiftyTwoWeekLowChange = "fiftyTwoWeekLowChange"
        case fiftyTwoWeekHighChangePercent = "fiftyTwoWeekHighChangePercent"
        case typeDisp = "typeDisp"
        case tradeable = "tradeable"
        case currency = "currency"
        case regularMarketPreviousClose = "regularMarketPreviousClose"
        case fiftyTwoWeekHigh = "fiftyTwoWeekHigh"
        case exchangeTimezoneName = "exchangeTimezoneName"
        case regularMarketChange = "regularMarketChange"
        case bidSize = "bidSize"
        case cryptoTradeable = "cryptoTradeable"
        case fiftyDayAverage = "fiftyDayAverage"
        case exchangeTimezoneShortName = "exchangeTimezoneShortName"
        case regularMarketPrice = "regularMarketPrice"
        case customPriceAlertConfidence = "customPriceAlertConfidence"
        case marketState = "marketState"
        case ask = "ask"
        case bid = "bid"
        case triggerable = "triggerable"
        case corporateActions = "corporateActions"
        case longName = "longName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        twoHundredDayAverageChangePercent = try values.decodeIfPresent(TwoHundredDayAverageChangePercent.self, forKey: .twoHundredDayAverageChangePercent)
        fiftyTwoWeekLowChangePercent = try values.decodeIfPresent(FiftyTwoWeekLowChangePercent.self, forKey: .fiftyTwoWeekLowChangePercent)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        regularMarketDayRange = try values.decodeIfPresent(RegularMarketDayRange.self, forKey: .regularMarketDayRange)
        regularMarketDayHigh = try values.decodeIfPresent(RegularMarketDayHigh.self, forKey: .regularMarketDayHigh)
        twoHundredDayAverageChange = try values.decodeIfPresent(TwoHundredDayAverageChange.self, forKey: .twoHundredDayAverageChange)
        askSize = try values.decodeIfPresent(AskSize.self, forKey: .askSize)
        twoHundredDayAverage = try values.decodeIfPresent(TwoHundredDayAverage.self, forKey: .twoHundredDayAverage)
        fiftyTwoWeekHighChange = try values.decodeIfPresent(FiftyTwoWeekHighChange.self, forKey: .fiftyTwoWeekHighChange)
        fiftyTwoWeekRange = try values.decodeIfPresent(FiftyTwoWeekRange.self, forKey: .fiftyTwoWeekRange)
        fiftyDayAverageChange = try values.decodeIfPresent(FiftyDayAverageChange.self, forKey: .fiftyDayAverageChange)
        exchangeDataDelayedBy = try values.decodeIfPresent(Int.self, forKey: .exchangeDataDelayedBy)
        averageDailyVolume3Month = try values.decodeIfPresent(AverageDailyVolume3Month.self, forKey: .averageDailyVolume3Month)
        firstTradeDateMilliseconds = try values.decodeIfPresent(Int.self, forKey: .firstTradeDateMilliseconds)
        fiftyTwoWeekChangePercent = try values.decodeIfPresent(FiftyTwoWeekChangePercent.self, forKey: .fiftyTwoWeekChangePercent)
        hasPrePostMarketData = try values.decodeIfPresent(Bool.self, forKey: .hasPrePostMarketData)
        fiftyTwoWeekLow = try values.decodeIfPresent(FiftyTwoWeekLow.self, forKey: .fiftyTwoWeekLow)
        regularMarketVolume = try values.decodeIfPresent(RegularMarketVolume.self, forKey: .regularMarketVolume)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        quoteSourceName = try values.decodeIfPresent(String.self, forKey: .quoteSourceName)
        messageBoardId = try values.decodeIfPresent(String.self, forKey: .messageBoardId)
        priceHint = try values.decodeIfPresent(Int.self, forKey: .priceHint)
        sourceInterval = try values.decodeIfPresent(Int.self, forKey: .sourceInterval)
        regularMarketDayLow = try values.decodeIfPresent(RegularMarketDayLow.self, forKey: .regularMarketDayLow)
        exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        fiftyDayAverageChangePercent = try values.decodeIfPresent(FiftyDayAverageChangePercent.self, forKey: .fiftyDayAverageChangePercent)
        fullExchangeName = try values.decodeIfPresent(String.self, forKey: .fullExchangeName)
        gmtOffSetMilliseconds = try values.decodeIfPresent(Int.self, forKey: .gmtOffSetMilliseconds)
        regularMarketOpen = try values.decodeIfPresent(RegularMarketOpen.self, forKey: .regularMarketOpen)
        regularMarketTime = try values.decodeIfPresent(RegularMarketTime.self, forKey: .regularMarketTime)
        regularMarketChangePercent = try values.decodeIfPresent(RegularMarketChangePercent.self, forKey: .regularMarketChangePercent)
        quoteType = try values.decodeIfPresent(String.self, forKey: .quoteType)
        averageDailyVolume10Day = try values.decodeIfPresent(AverageDailyVolume10Day.self, forKey: .averageDailyVolume10Day)
        fiftyTwoWeekLowChange = try values.decodeIfPresent(FiftyTwoWeekLowChange.self, forKey: .fiftyTwoWeekLowChange)
        fiftyTwoWeekHighChangePercent = try values.decodeIfPresent(FiftyTwoWeekHighChangePercent.self, forKey: .fiftyTwoWeekHighChangePercent)
        typeDisp = try values.decodeIfPresent(String.self, forKey: .typeDisp)
        tradeable = try values.decodeIfPresent(Bool.self, forKey: .tradeable)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        regularMarketPreviousClose = try values.decodeIfPresent(RegularMarketPreviousClose.self, forKey: .regularMarketPreviousClose)
        fiftyTwoWeekHigh = try values.decodeIfPresent(FiftyTwoWeekHigh.self, forKey: .fiftyTwoWeekHigh)
        exchangeTimezoneName = try values.decodeIfPresent(String.self, forKey: .exchangeTimezoneName)
        regularMarketChange = try values.decodeIfPresent(RegularMarketChange.self, forKey: .regularMarketChange)
        bidSize = try values.decodeIfPresent(BidSize.self, forKey: .bidSize)
        cryptoTradeable = try values.decodeIfPresent(Bool.self, forKey: .cryptoTradeable)
        fiftyDayAverage = try values.decodeIfPresent(FiftyDayAverage.self, forKey: .fiftyDayAverage)
        exchangeTimezoneShortName = try values.decodeIfPresent(String.self, forKey: .exchangeTimezoneShortName)
        regularMarketPrice = try values.decodeIfPresent(RegularMarketPrice.self, forKey: .regularMarketPrice)
        customPriceAlertConfidence = try values.decodeIfPresent(String.self, forKey: .customPriceAlertConfidence)
        marketState = try values.decodeIfPresent(String.self, forKey: .marketState)
        ask = try values.decodeIfPresent(Ask.self, forKey: .ask)
        bid = try values.decodeIfPresent(Bid.self, forKey: .bid)
        triggerable = try values.decodeIfPresent(Bool.self, forKey: .triggerable)
        corporateActions = try values.decodeIfPresent([String].self, forKey: .corporateActions)
        longName = try values.decodeIfPresent(String.self, forKey: .longName)
    }

}

struct TwoHundredDayAverage : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct TwoHundredDayAverageChange : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct TwoHundredDayAverageChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct Ask : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct AskSize : Codable {
    let raw : Int?
    let fmt : String?
    let longFmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
        case longFmt = "longFmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
        longFmt = try values.decodeIfPresent(String.self, forKey: .longFmt)
    }

}

struct AverageDailyVolume3Month : Codable {
    let raw : Int?
    let fmt : String?
    let longFmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
        case longFmt = "longFmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
        longFmt = try values.decodeIfPresent(String.self, forKey: .longFmt)
    }

}

struct AverageDailyVolume10Day : Codable {
    let raw : Int?
    let fmt : String?
    let longFmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
        case longFmt = "longFmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
        longFmt = try values.decodeIfPresent(String.self, forKey: .longFmt)
    }

}

struct Bid : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct BidSize : Codable {
    let raw : Int?
    let fmt : String?
    let longFmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
        case longFmt = "longFmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Int.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
        longFmt = try values.decodeIfPresent(String.self, forKey: .longFmt)
    }

}

struct FiftyDayAverage : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyDayAverageChange : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyDayAverageChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekHigh : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekHighChange : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekHighChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekLow : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekLowChange : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekLowChangePercent : Codable {
    let raw : Double?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(Double.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}

struct FiftyTwoWeekRange : Codable {
    let raw : String?
    let fmt : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case fmt = "fmt"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(String.self, forKey: .raw)
        fmt = try values.decodeIfPresent(String.self, forKey: .fmt)
    }

}
