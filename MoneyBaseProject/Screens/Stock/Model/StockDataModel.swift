//
//  StockDataModel.swift
//  MoneyBaseProject
//
//  Created by Lokesh Kumawat on 24/03/26.
//

import Foundation
struct StockDataModel : Codable {
    let recommendationTrend : RecommendationTrend?
    let institutionOwnership : InstitutionOwnership?
    let majorHoldersBreakdown : MajorHoldersBreakdown?
    let majorDirectHolders : MajorDirectHolders?
    let defaultKeyStatistics : DefaultKeyStatistics?
    let summaryProfile : SummaryProfile?
    let netSharePurchaseActivity : NetSharePurchaseActivity?
    let insiderTransactions : InsiderTransactions?
    let financialsTemplate : FinancialsTemplate?
    let quoteType : QuoteType?
    let fundOwnership : FundOwnership?
    let summaryDetail : SummaryDetail?
    let insiderHolders : InsiderHolders?
    let earnings : Earnings?
    let calendarEvents : CalendarEvents?
    let upgradeDowngradeHistory : UpgradeDowngradeHistory?
    let pageViews : PageViews?
    let price : Price?
    let financialData : FinancialData?
    let symbol : String?

    enum CodingKeys: String, CodingKey {

        case recommendationTrend = "recommendationTrend"
        case institutionOwnership = "institutionOwnership"
        case majorHoldersBreakdown = "majorHoldersBreakdown"
        case majorDirectHolders = "majorDirectHolders"
        case defaultKeyStatistics = "defaultKeyStatistics"
        case summaryProfile = "summaryProfile"
        case netSharePurchaseActivity = "netSharePurchaseActivity"
        case insiderTransactions = "insiderTransactions"
        case financialsTemplate = "financialsTemplate"
        case quoteType = "quoteType"
        case fundOwnership = "fundOwnership"
        case summaryDetail = "summaryDetail"
        case insiderHolders = "insiderHolders"
        case earnings = "earnings"
        case calendarEvents = "calendarEvents"
        case upgradeDowngradeHistory = "upgradeDowngradeHistory"
        case pageViews = "pageViews"
        case price = "price"
        case financialData = "financialData"
        case symbol = "symbol"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recommendationTrend = try values.decodeIfPresent(RecommendationTrend.self, forKey: .recommendationTrend)
        institutionOwnership = try values.decodeIfPresent(InstitutionOwnership.self, forKey: .institutionOwnership)
        majorHoldersBreakdown = try values.decodeIfPresent(MajorHoldersBreakdown.self, forKey: .majorHoldersBreakdown)
        majorDirectHolders = try values.decodeIfPresent(MajorDirectHolders.self, forKey: .majorDirectHolders)
        defaultKeyStatistics = try values.decodeIfPresent(DefaultKeyStatistics.self, forKey: .defaultKeyStatistics)
        summaryProfile = try values.decodeIfPresent(SummaryProfile.self, forKey: .summaryProfile)
        netSharePurchaseActivity = try values.decodeIfPresent(NetSharePurchaseActivity.self, forKey: .netSharePurchaseActivity)
        insiderTransactions = try values.decodeIfPresent(InsiderTransactions.self, forKey: .insiderTransactions)
        financialsTemplate = try values.decodeIfPresent(FinancialsTemplate.self, forKey: .financialsTemplate)
        quoteType = try values.decodeIfPresent(QuoteType.self, forKey: .quoteType)
        fundOwnership = try values.decodeIfPresent(FundOwnership.self, forKey: .fundOwnership)
        summaryDetail = try values.decodeIfPresent(SummaryDetail.self, forKey: .summaryDetail)
        insiderHolders = try values.decodeIfPresent(InsiderHolders.self, forKey: .insiderHolders)
        earnings = try values.decodeIfPresent(Earnings.self, forKey: .earnings)
        calendarEvents = try values.decodeIfPresent(CalendarEvents.self, forKey: .calendarEvents)
        upgradeDowngradeHistory = try values.decodeIfPresent(UpgradeDowngradeHistory.self, forKey: .upgradeDowngradeHistory)
        pageViews = try values.decodeIfPresent(PageViews.self, forKey: .pageViews)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
        financialData = try values.decodeIfPresent(FinancialData.self, forKey: .financialData)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
    }

}

struct RecommendationTrend : Codable {
    let trend : [Trend]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case trend = "trend"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trend = try values.decodeIfPresent([Trend].self, forKey: .trend)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct Trend : Codable {
    let period : String?
    let strongBuy : Int?
    let buy : Int?
    let hold : Int?
    let sell : Int?
    let strongSell : Int?

    enum CodingKeys: String, CodingKey {

        case period = "period"
        case strongBuy = "strongBuy"
        case buy = "buy"
        case hold = "hold"
        case sell = "sell"
        case strongSell = "strongSell"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        period = try values.decodeIfPresent(String.self, forKey: .period)
        strongBuy = try values.decodeIfPresent(Int.self, forKey: .strongBuy)
        buy = try values.decodeIfPresent(Int.self, forKey: .buy)
        hold = try values.decodeIfPresent(Int.self, forKey: .hold)
        sell = try values.decodeIfPresent(Int.self, forKey: .sell)
        strongSell = try values.decodeIfPresent(Int.self, forKey: .strongSell)
    }

}

struct CalendarEvents : Codable {
    let maxAge : Int?
    let earnings : Earnings?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case earnings = "earnings"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        earnings = try values.decodeIfPresent(Earnings.self, forKey: .earnings)
    }

}

struct DefaultKeyStatistics : Codable {
    let maxAge : Int?
    let priceHint : Int?
    let enterpriseValue : Int?
    let forwardPE : Double?
    let profitMargins : Double?
    let floatShares : Int?
    let sharesOutstanding : Int?
    let sharesShort : Int?
    let sharesShortPriorMonth : Int?
    let sharesShortPreviousMonthDate : Int?
    let dateShortInterest : Int?
    let sharesPercentSharesOut : Double?
    let heldPercentInsiders : Double?
    let heldPercentInstitutions : Double?
    let shortRatio : Double?
    let shortPercentOfFloat : Double?
    let beta : Double?
    let impliedSharesOutstanding : Int?
    let category : String?
    let bookValue : Double?
    let priceToBook : Double?
    let fundFamily : String?
    let legalType : String?
    let lastFiscalYearEnd : Int?
    let nextFiscalYearEnd : Int?
    let mostRecentQuarter : Int?
    let netIncomeToCommon : Int?
    let trailingEps : Double?
    let forwardEps : Double?
    let lastSplitFactor : String?
    let enterpriseToRevenue : Double?
    let enterpriseToEbitda : Double?
    let weekChange : Double?
    let sandP52WeekChange : Double?
    let latestShareClass : String?
    let leadInvestor : String?
    let lastDividendValue : Double?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case priceHint = "priceHint"
        case enterpriseValue = "enterpriseValue"
        case forwardPE = "forwardPE"
        case profitMargins = "profitMargins"
        case floatShares = "floatShares"
        case sharesOutstanding = "sharesOutstanding"
        case sharesShort = "sharesShort"
        case sharesShortPriorMonth = "sharesShortPriorMonth"
        case sharesShortPreviousMonthDate = "sharesShortPreviousMonthDate"
        case dateShortInterest = "dateShortInterest"
        case sharesPercentSharesOut = "sharesPercentSharesOut"
        case heldPercentInsiders = "heldPercentInsiders"
        case heldPercentInstitutions = "heldPercentInstitutions"
        case shortRatio = "shortRatio"
        case shortPercentOfFloat = "shortPercentOfFloat"
        case beta = "beta"
        case impliedSharesOutstanding = "impliedSharesOutstanding"
        case category = "category"
        case bookValue = "bookValue"
        case priceToBook = "priceToBook"
        case fundFamily = "fundFamily"
        case legalType = "legalType"
        case lastFiscalYearEnd = "lastFiscalYearEnd"
        case nextFiscalYearEnd = "nextFiscalYearEnd"
        case mostRecentQuarter = "mostRecentQuarter"
        case netIncomeToCommon = "netIncomeToCommon"
        case trailingEps = "trailingEps"
        case forwardEps = "forwardEps"
        case lastSplitFactor = "lastSplitFactor"
        case enterpriseToRevenue = "enterpriseToRevenue"
        case enterpriseToEbitda = "enterpriseToEbitda"
        case weekChange = "52WeekChange"
        case sandP52WeekChange = "SandP52WeekChange"
        case latestShareClass = "latestShareClass"
        case leadInvestor = "leadInvestor"
        case lastDividendValue = "lastDividendValue"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        priceHint = try values.decodeIfPresent(Int.self, forKey: .priceHint)
        enterpriseValue = try values.decodeIfPresent(Int.self, forKey: .enterpriseValue)
        forwardPE = try values.decodeIfPresent(Double.self, forKey: .forwardPE)
        profitMargins = try values.decodeIfPresent(Double.self, forKey: .profitMargins)
        floatShares = try values.decodeIfPresent(Int.self, forKey: .floatShares)
        sharesOutstanding = try values.decodeIfPresent(Int.self, forKey: .sharesOutstanding)
        sharesShort = try values.decodeIfPresent(Int.self, forKey: .sharesShort)
        sharesShortPriorMonth = try values.decodeIfPresent(Int.self, forKey: .sharesShortPriorMonth)
        sharesShortPreviousMonthDate = try values.decodeIfPresent(Int.self, forKey: .sharesShortPreviousMonthDate)
        dateShortInterest = try values.decodeIfPresent(Int.self, forKey: .dateShortInterest)
        sharesPercentSharesOut = try values.decodeIfPresent(Double.self, forKey: .sharesPercentSharesOut)
        heldPercentInsiders = try values.decodeIfPresent(Double.self, forKey: .heldPercentInsiders)
        heldPercentInstitutions = try values.decodeIfPresent(Double.self, forKey: .heldPercentInstitutions)
        shortRatio = try values.decodeIfPresent(Double.self, forKey: .shortRatio)
        shortPercentOfFloat = try values.decodeIfPresent(Double.self, forKey: .shortPercentOfFloat)
        beta = try values.decodeIfPresent(Double.self, forKey: .beta)
        impliedSharesOutstanding = try values.decodeIfPresent(Int.self, forKey: .impliedSharesOutstanding)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        bookValue = try values.decodeIfPresent(Double.self, forKey: .bookValue)
        priceToBook = try values.decodeIfPresent(Double.self, forKey: .priceToBook)
        fundFamily = try values.decodeIfPresent(String.self, forKey: .fundFamily)
        legalType = try values.decodeIfPresent(String.self, forKey: .legalType)
        lastFiscalYearEnd = try values.decodeIfPresent(Int.self, forKey: .lastFiscalYearEnd)
        nextFiscalYearEnd = try values.decodeIfPresent(Int.self, forKey: .nextFiscalYearEnd)
        mostRecentQuarter = try values.decodeIfPresent(Int.self, forKey: .mostRecentQuarter)
        netIncomeToCommon = try values.decodeIfPresent(Int.self, forKey: .netIncomeToCommon)
        trailingEps = try values.decodeIfPresent(Double.self, forKey: .trailingEps)
        forwardEps = try values.decodeIfPresent(Double.self, forKey: .forwardEps)
        lastSplitFactor = try values.decodeIfPresent(String.self, forKey: .lastSplitFactor)
        enterpriseToRevenue = try values.decodeIfPresent(Double.self, forKey: .enterpriseToRevenue)
        enterpriseToEbitda = try values.decodeIfPresent(Double.self, forKey: .enterpriseToEbitda)
        weekChange = try values.decodeIfPresent(Double.self, forKey: .weekChange)
        sandP52WeekChange = try values.decodeIfPresent(Double.self, forKey: .sandP52WeekChange)
        latestShareClass = try values.decodeIfPresent(String.self, forKey: .latestShareClass)
        leadInvestor = try values.decodeIfPresent(String.self, forKey: .leadInvestor)
        lastDividendValue = try values.decodeIfPresent(Double.self, forKey: .lastDividendValue)
    }

}

struct Earnings : Codable {
    let earningsDate : [Int]?
    let earningsCallDate : [Int]?
    let isEarningsDateEstimate : Bool?
    let earningsAverage : Double?
    let earningsLow : Double?
    let earningsHigh : Double?
    let revenueAverage : Int?
    let revenueLow : Int?
    let revenueHigh : Int?

    enum CodingKeys: String, CodingKey {

        case earningsDate = "earningsDate"
        case earningsCallDate = "earningsCallDate"
        case isEarningsDateEstimate = "isEarningsDateEstimate"
        case earningsAverage = "earningsAverage"
        case earningsLow = "earningsLow"
        case earningsHigh = "earningsHigh"
        case revenueAverage = "revenueAverage"
        case revenueLow = "revenueLow"
        case revenueHigh = "revenueHigh"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        earningsDate = try values.decodeIfPresent([Int].self, forKey: .earningsDate)
        earningsCallDate = try values.decodeIfPresent([Int].self, forKey: .earningsCallDate)
        isEarningsDateEstimate = try values.decodeIfPresent(Bool.self, forKey: .isEarningsDateEstimate)
        earningsAverage = try values.decodeIfPresent(Double.self, forKey: .earningsAverage)
        earningsLow = try values.decodeIfPresent(Double.self, forKey: .earningsLow)
        earningsHigh = try values.decodeIfPresent(Double.self, forKey: .earningsHigh)
        revenueAverage = try values.decodeIfPresent(Int.self, forKey: .revenueAverage)
        revenueLow = try values.decodeIfPresent(Int.self, forKey: .revenueLow)
        revenueHigh = try values.decodeIfPresent(Int.self, forKey: .revenueHigh)
    }

}

struct EarningsChart : Codable {
    let quarterly : [Quarterly]?
    let currentQuarterEstimate : Double?
    let currentQuarterEstimateDate : String?
    let currentCalendarQuarter : String?
    let currentQuarterEstimateYear : Int?
    let currentFiscalQuarter : String?
    let currentPeriodEndDate : Int?
    let earningsDate : [Int]?
    let isEarningsDateEstimate : Bool?

    enum CodingKeys: String, CodingKey {

        case quarterly = "quarterly"
        case currentQuarterEstimate = "currentQuarterEstimate"
        case currentQuarterEstimateDate = "currentQuarterEstimateDate"
        case currentCalendarQuarter = "currentCalendarQuarter"
        case currentQuarterEstimateYear = "currentQuarterEstimateYear"
        case currentFiscalQuarter = "currentFiscalQuarter"
        case currentPeriodEndDate = "currentPeriodEndDate"
        case earningsDate = "earningsDate"
        case isEarningsDateEstimate = "isEarningsDateEstimate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quarterly = try values.decodeIfPresent([Quarterly].self, forKey: .quarterly)
        currentQuarterEstimate = try values.decodeIfPresent(Double.self, forKey: .currentQuarterEstimate)
        currentQuarterEstimateDate = try values.decodeIfPresent(String.self, forKey: .currentQuarterEstimateDate)
        currentCalendarQuarter = try values.decodeIfPresent(String.self, forKey: .currentCalendarQuarter)
        currentQuarterEstimateYear = try values.decodeIfPresent(Int.self, forKey: .currentQuarterEstimateYear)
        currentFiscalQuarter = try values.decodeIfPresent(String.self, forKey: .currentFiscalQuarter)
        currentPeriodEndDate = try values.decodeIfPresent(Int.self, forKey: .currentPeriodEndDate)
        earningsDate = try values.decodeIfPresent([Int].self, forKey: .earningsDate)
        isEarningsDateEstimate = try values.decodeIfPresent(Bool.self, forKey: .isEarningsDateEstimate)
    }

}

struct FinancialData : Codable {
    let maxAge : Int?
    let currentPrice : Double?
    let targetHighPrice : Double?
    let targetLowPrice : Double?
    let targetMeanPrice : Double?
    let targetMedianPrice : Double?
    let recommendationMean : Double?
    let recommendationKey : String?
    let numberOfAnalystOpinions : Int?
    let totalCash : Int?
    let totalCashPerShare : Double?
    let ebitda : Int?
    let totalDebt : Int?
    let quickRatio : Double?
    let currentRatio : Double?
    let totalRevenue : Int?
    let debtToEquity : Double?
    let revenuePerShare : Double?
    let returnOnAssets : Double?
    let returnOnEquity : Double?
    let grossProfits : Int?
    let freeCashflow : Int?
    let operatingCashflow : Int?
    let revenueGrowth : Double?
    let grossMargins : Double?
    let ebitdaMargins : Double?
    let operatingMargins : Double?
    let profitMargins : Double?
    let financialCurrency : String?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case currentPrice = "currentPrice"
        case targetHighPrice = "targetHighPrice"
        case targetLowPrice = "targetLowPrice"
        case targetMeanPrice = "targetMeanPrice"
        case targetMedianPrice = "targetMedianPrice"
        case recommendationMean = "recommendationMean"
        case recommendationKey = "recommendationKey"
        case numberOfAnalystOpinions = "numberOfAnalystOpinions"
        case totalCash = "totalCash"
        case totalCashPerShare = "totalCashPerShare"
        case ebitda = "ebitda"
        case totalDebt = "totalDebt"
        case quickRatio = "quickRatio"
        case currentRatio = "currentRatio"
        case totalRevenue = "totalRevenue"
        case debtToEquity = "debtToEquity"
        case revenuePerShare = "revenuePerShare"
        case returnOnAssets = "returnOnAssets"
        case returnOnEquity = "returnOnEquity"
        case grossProfits = "grossProfits"
        case freeCashflow = "freeCashflow"
        case operatingCashflow = "operatingCashflow"
        case revenueGrowth = "revenueGrowth"
        case grossMargins = "grossMargins"
        case ebitdaMargins = "ebitdaMargins"
        case operatingMargins = "operatingMargins"
        case profitMargins = "profitMargins"
        case financialCurrency = "financialCurrency"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        currentPrice = try values.decodeIfPresent(Double.self, forKey: .currentPrice)
        targetHighPrice = try values.decodeIfPresent(Double.self, forKey: .targetHighPrice)
        targetLowPrice = try values.decodeIfPresent(Double.self, forKey: .targetLowPrice)
        targetMeanPrice = try values.decodeIfPresent(Double.self, forKey: .targetMeanPrice)
        targetMedianPrice = try values.decodeIfPresent(Double.self, forKey: .targetMedianPrice)
        recommendationMean = try values.decodeIfPresent(Double.self, forKey: .recommendationMean)
        recommendationKey = try values.decodeIfPresent(String.self, forKey: .recommendationKey)
        numberOfAnalystOpinions = try values.decodeIfPresent(Int.self, forKey: .numberOfAnalystOpinions)
        totalCash = try values.decodeIfPresent(Int.self, forKey: .totalCash)
        totalCashPerShare = try values.decodeIfPresent(Double.self, forKey: .totalCashPerShare)
        ebitda = try values.decodeIfPresent(Int.self, forKey: .ebitda)
        totalDebt = try values.decodeIfPresent(Int.self, forKey: .totalDebt)
        quickRatio = try values.decodeIfPresent(Double.self, forKey: .quickRatio)
        currentRatio = try values.decodeIfPresent(Double.self, forKey: .currentRatio)
        totalRevenue = try values.decodeIfPresent(Int.self, forKey: .totalRevenue)
        debtToEquity = try values.decodeIfPresent(Double.self, forKey: .debtToEquity)
        revenuePerShare = try values.decodeIfPresent(Double.self, forKey: .revenuePerShare)
        returnOnAssets = try values.decodeIfPresent(Double.self, forKey: .returnOnAssets)
        returnOnEquity = try values.decodeIfPresent(Double.self, forKey: .returnOnEquity)
        grossProfits = try values.decodeIfPresent(Int.self, forKey: .grossProfits)
        freeCashflow = try values.decodeIfPresent(Int.self, forKey: .freeCashflow)
        operatingCashflow = try values.decodeIfPresent(Int.self, forKey: .operatingCashflow)
        revenueGrowth = try values.decodeIfPresent(Double.self, forKey: .revenueGrowth)
        grossMargins = try values.decodeIfPresent(Double.self, forKey: .grossMargins)
        ebitdaMargins = try values.decodeIfPresent(Double.self, forKey: .ebitdaMargins)
        operatingMargins = try values.decodeIfPresent(Double.self, forKey: .operatingMargins)
        profitMargins = try values.decodeIfPresent(Double.self, forKey: .profitMargins)
        financialCurrency = try values.decodeIfPresent(String.self, forKey: .financialCurrency)
    }

}

struct FinancialsChart : Codable {
    let yearly : [Yearly]?
    let quarterly : [Quarterly]?

    enum CodingKeys: String, CodingKey {

        case yearly = "yearly"
        case quarterly = "quarterly"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        yearly = try values.decodeIfPresent([Yearly].self, forKey: .yearly)
        quarterly = try values.decodeIfPresent([Quarterly].self, forKey: .quarterly)
    }

}

struct FinancialsTemplate : Codable {
    let code : String?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct FundOwnership : Codable {
    let maxAge : Int?
    let ownershipList : [OwnershipList]?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case ownershipList = "ownershipList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        ownershipList = try values.decodeIfPresent([OwnershipList].self, forKey: .ownershipList)
    }

}

struct History : Codable {
    let epochGradeDate : Int?
    let firm : String?
    let toGrade : String?
    let fromGrade : String?
    let action : String?
    let priceTargetAction : String?
    let currentPriceTarget : Double?
    let priorPriceTarget : Double?

    enum CodingKeys: String, CodingKey {

        case epochGradeDate = "epochGradeDate"
        case firm = "firm"
        case toGrade = "toGrade"
        case fromGrade = "fromGrade"
        case action = "action"
        case priceTargetAction = "priceTargetAction"
        case currentPriceTarget = "currentPriceTarget"
        case priorPriceTarget = "priorPriceTarget"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        epochGradeDate = try values.decodeIfPresent(Int.self, forKey: .epochGradeDate)
        firm = try values.decodeIfPresent(String.self, forKey: .firm)
        toGrade = try values.decodeIfPresent(String.self, forKey: .toGrade)
        fromGrade = try values.decodeIfPresent(String.self, forKey: .fromGrade)
        action = try values.decodeIfPresent(String.self, forKey: .action)
        priceTargetAction = try values.decodeIfPresent(String.self, forKey: .priceTargetAction)
        currentPriceTarget = try values.decodeIfPresent(Double.self, forKey: .currentPriceTarget)
        priorPriceTarget = try values.decodeIfPresent(Double.self, forKey: .priorPriceTarget)
    }

}

struct Holders : Codable {
    let maxAge : Int?
    let name : String?
    let relation : String?
    let url : String?
    let transactionDescription : String?
    let latestTransDate : LatestTransDate?
    let positionDirect : PositionDirect?
    let positionDirectDate : PositionDirectDate?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case name = "name"
        case relation = "relation"
        case url = "url"
        case transactionDescription = "transactionDescription"
        case latestTransDate = "latestTransDate"
        case positionDirect = "positionDirect"
        case positionDirectDate = "positionDirectDate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        relation = try values.decodeIfPresent(String.self, forKey: .relation)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        transactionDescription = try values.decodeIfPresent(String.self, forKey: .transactionDescription)
        latestTransDate = try values.decodeIfPresent(LatestTransDate.self, forKey: .latestTransDate)
        positionDirect = try values.decodeIfPresent(PositionDirect.self, forKey: .positionDirect)
        positionDirectDate = try values.decodeIfPresent(PositionDirectDate.self, forKey: .positionDirectDate)
    }

}

struct InsiderHolders : Codable {
    let holders : [Holders]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case holders = "holders"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        holders = try values.decodeIfPresent([Holders].self, forKey: .holders)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct InsiderTransactions : Codable {
    let transactions : [Transactions]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case transactions = "transactions"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        transactions = try values.decodeIfPresent([Transactions].self, forKey: .transactions)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct InstitutionOwnership : Codable {
    let maxAge : Int?
    let ownershipList : [OwnershipList]?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case ownershipList = "ownershipList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        ownershipList = try values.decodeIfPresent([OwnershipList].self, forKey: .ownershipList)
    }

}

struct LatestTransDate : Codable {
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

struct MajorDirectHolders : Codable {
    let holders : [String]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case holders = "holders"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        holders = try values.decodeIfPresent([String].self, forKey: .holders)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct MajorHoldersBreakdown : Codable {
    let maxAge : Int?
    let insidersPercentHeld : Double?
    let institutionsPercentHeld : Double?
    let institutionsFloatPercentHeld : Double?
    let institutionsCount : Int?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case insidersPercentHeld = "insidersPercentHeld"
        case institutionsPercentHeld = "institutionsPercentHeld"
        case institutionsFloatPercentHeld = "institutionsFloatPercentHeld"
        case institutionsCount = "institutionsCount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        insidersPercentHeld = try values.decodeIfPresent(Double.self, forKey: .insidersPercentHeld)
        institutionsPercentHeld = try values.decodeIfPresent(Double.self, forKey: .institutionsPercentHeld)
        institutionsFloatPercentHeld = try values.decodeIfPresent(Double.self, forKey: .institutionsFloatPercentHeld)
        institutionsCount = try values.decodeIfPresent(Int.self, forKey: .institutionsCount)
    }

}

struct NetSharePurchaseActivity : Codable {
    let maxAge : Int?
    let period : String?
    let buyInfoCount : Int?
    let buyInfoShares : Int?
    let buyPercentInsiderShares : Double?
    let sellInfoCount : Int?
    let sellInfoShares : Int?
    let sellPercentInsiderShares : Double?
    let netInfoCount : Int?
    let netInfoShares : Int?
    let netPercentInsiderShares : Double?
    let totalInsiderShares : Int?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case period = "period"
        case buyInfoCount = "buyInfoCount"
        case buyInfoShares = "buyInfoShares"
        case buyPercentInsiderShares = "buyPercentInsiderShares"
        case sellInfoCount = "sellInfoCount"
        case sellInfoShares = "sellInfoShares"
        case sellPercentInsiderShares = "sellPercentInsiderShares"
        case netInfoCount = "netInfoCount"
        case netInfoShares = "netInfoShares"
        case netPercentInsiderShares = "netPercentInsiderShares"
        case totalInsiderShares = "totalInsiderShares"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        period = try values.decodeIfPresent(String.self, forKey: .period)
        buyInfoCount = try values.decodeIfPresent(Int.self, forKey: .buyInfoCount)
        buyInfoShares = try values.decodeIfPresent(Int.self, forKey: .buyInfoShares)
        buyPercentInsiderShares = try values.decodeIfPresent(Double.self, forKey: .buyPercentInsiderShares)
        sellInfoCount = try values.decodeIfPresent(Int.self, forKey: .sellInfoCount)
        sellInfoShares = try values.decodeIfPresent(Int.self, forKey: .sellInfoShares)
        sellPercentInsiderShares = try values.decodeIfPresent(Double.self, forKey: .sellPercentInsiderShares)
        netInfoCount = try values.decodeIfPresent(Int.self, forKey: .netInfoCount)
        netInfoShares = try values.decodeIfPresent(Int.self, forKey: .netInfoShares)
        netPercentInsiderShares = try values.decodeIfPresent(Double.self, forKey: .netPercentInsiderShares)
        totalInsiderShares = try values.decodeIfPresent(Int.self, forKey: .totalInsiderShares)
    }

}

struct OwnershipList : Codable {
    let maxAge : Int?
    let reportDate : ReportDate?
    let organization : String?
    let pctHeld : PctHeld?
    let position : Position?
    let value : Value?
    let pctChange : PctChange?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case reportDate = "reportDate"
        case organization = "organization"
        case pctHeld = "pctHeld"
        case position = "position"
        case value = "value"
        case pctChange = "pctChange"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        reportDate = try values.decodeIfPresent(ReportDate.self, forKey: .reportDate)
        organization = try values.decodeIfPresent(String.self, forKey: .organization)
        pctHeld = try values.decodeIfPresent(PctHeld.self, forKey: .pctHeld)
        position = try values.decodeIfPresent(Position.self, forKey: .position)
        value = try values.decodeIfPresent(Value.self, forKey: .value)
        pctChange = try values.decodeIfPresent(PctChange.self, forKey: .pctChange)
    }

}

struct PageViews : Codable {
    let shortTermTrend : String?
    let midTermTrend : String?
    let longTermTrend : String?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case shortTermTrend = "shortTermTrend"
        case midTermTrend = "midTermTrend"
        case longTermTrend = "longTermTrend"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shortTermTrend = try values.decodeIfPresent(String.self, forKey: .shortTermTrend)
        midTermTrend = try values.decodeIfPresent(String.self, forKey: .midTermTrend)
        longTermTrend = try values.decodeIfPresent(String.self, forKey: .longTermTrend)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct PctChange : Codable {
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

struct PctHeld : Codable {
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

struct Position : Codable {
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

struct PositionDirect : Codable {
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

struct PositionDirectDate : Codable {
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

struct Price : Codable {
    let maxAge : Int?
    let preMarketSource : String?
    let regularMarketChangePercent : Double?
    let regularMarketChange : Double?
    let regularMarketTime : Int?
    let priceHint : Int?
    let regularMarketPrice : Double?
    let regularMarketDayHigh : Double?
    let regularMarketDayLow : Double?
    let regularMarketVolume : Int?
    let averageDailyVolume10Day : Int?
    let averageDailyVolume3Month : Int?
    let regularMarketPreviousClose : Double?
    let regularMarketSource : String?
    let regularMarketOpen : Double?
    let exchange : String?
    let exchangeName : String?
    let exchangeDataDelayedBy : Int?
    let marketState : String?
    let quoteType : String?
    let symbol : String?
    let underlyingSymbol : String?
    let shortName : String?
    let longName : String?
    let currency : String?
    let quoteSourceName : String?
    let currencySymbol : String?
    let fromCurrency : String?
    let toCurrency : String?
    let lastMarket : String?
    let marketCap : Int?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case preMarketSource = "preMarketSource"
        case regularMarketChangePercent = "regularMarketChangePercent"
        case regularMarketChange = "regularMarketChange"
        case regularMarketTime = "regularMarketTime"
        case priceHint = "priceHint"
        case regularMarketPrice = "regularMarketPrice"
        case regularMarketDayHigh = "regularMarketDayHigh"
        case regularMarketDayLow = "regularMarketDayLow"
        case regularMarketVolume = "regularMarketVolume"
        case averageDailyVolume10Day = "averageDailyVolume10Day"
        case averageDailyVolume3Month = "averageDailyVolume3Month"
        case regularMarketPreviousClose = "regularMarketPreviousClose"
        case regularMarketSource = "regularMarketSource"
        case regularMarketOpen = "regularMarketOpen"
        case exchange = "exchange"
        case exchangeName = "exchangeName"
        case exchangeDataDelayedBy = "exchangeDataDelayedBy"
        case marketState = "marketState"
        case quoteType = "quoteType"
        case symbol = "symbol"
        case underlyingSymbol = "underlyingSymbol"
        case shortName = "shortName"
        case longName = "longName"
        case currency = "currency"
        case quoteSourceName = "quoteSourceName"
        case currencySymbol = "currencySymbol"
        case fromCurrency = "fromCurrency"
        case toCurrency = "toCurrency"
        case lastMarket = "lastMarket"
        case marketCap = "marketCap"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        preMarketSource = try values.decodeIfPresent(String.self, forKey: .preMarketSource)
        regularMarketChangePercent = try values.decodeIfPresent(Double.self, forKey: .regularMarketChangePercent)
        regularMarketChange = try values.decodeIfPresent(Double.self, forKey: .regularMarketChange)
        regularMarketTime = try values.decodeIfPresent(Int.self, forKey: .regularMarketTime)
        priceHint = try values.decodeIfPresent(Int.self, forKey: .priceHint)
        regularMarketPrice = try values.decodeIfPresent(Double.self, forKey: .regularMarketPrice)
        regularMarketDayHigh = try values.decodeIfPresent(Double.self, forKey: .regularMarketDayHigh)
        regularMarketDayLow = try values.decodeIfPresent(Double.self, forKey: .regularMarketDayLow)
        regularMarketVolume = try values.decodeIfPresent(Int.self, forKey: .regularMarketVolume)
        averageDailyVolume10Day = try values.decodeIfPresent(Int.self, forKey: .averageDailyVolume10Day)
        averageDailyVolume3Month = try values.decodeIfPresent(Int.self, forKey: .averageDailyVolume3Month)
        regularMarketPreviousClose = try values.decodeIfPresent(Double.self, forKey: .regularMarketPreviousClose)
        regularMarketSource = try values.decodeIfPresent(String.self, forKey: .regularMarketSource)
        regularMarketOpen = try values.decodeIfPresent(Double.self, forKey: .regularMarketOpen)
        exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
        exchangeName = try values.decodeIfPresent(String.self, forKey: .exchangeName)
        exchangeDataDelayedBy = try values.decodeIfPresent(Int.self, forKey: .exchangeDataDelayedBy)
        marketState = try values.decodeIfPresent(String.self, forKey: .marketState)
        quoteType = try values.decodeIfPresent(String.self, forKey: .quoteType)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        underlyingSymbol = try values.decodeIfPresent(String.self, forKey: .underlyingSymbol)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        longName = try values.decodeIfPresent(String.self, forKey: .longName)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        quoteSourceName = try values.decodeIfPresent(String.self, forKey: .quoteSourceName)
        currencySymbol = try values.decodeIfPresent(String.self, forKey: .currencySymbol)
        fromCurrency = try values.decodeIfPresent(String.self, forKey: .fromCurrency)
        toCurrency = try values.decodeIfPresent(String.self, forKey: .toCurrency)
        lastMarket = try values.decodeIfPresent(String.self, forKey: .lastMarket)
        marketCap = try values.decodeIfPresent(Int.self, forKey: .marketCap)
    }

}

struct Quarterly : Codable {
    let date : String?
    let fiscalQuarter : String?
    let revenue : Int?
    let earnings : Int?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case fiscalQuarter = "fiscalQuarter"
        case revenue = "revenue"
        case earnings = "earnings"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        fiscalQuarter = try values.decodeIfPresent(String.self, forKey: .fiscalQuarter)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        earnings = try values.decodeIfPresent(Int.self, forKey: .earnings)
    }

}

struct QuoteType : Codable {
    let exchange : String?
    let quoteType : String?
    let symbol : String?
    let underlyingSymbol : String?
    let shortName : String?
    let longName : String?
    let firstTradeDateEpochUtc : Int?
    let timeZoneFullName : String?
    let timeZoneShortName : String?
    let uuid : String?
    let messageBoardId : String?
    let gmtOffSetMilliseconds : Int?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case exchange = "exchange"
        case quoteType = "quoteType"
        case symbol = "symbol"
        case underlyingSymbol = "underlyingSymbol"
        case shortName = "shortName"
        case longName = "longName"
        case firstTradeDateEpochUtc = "firstTradeDateEpochUtc"
        case timeZoneFullName = "timeZoneFullName"
        case timeZoneShortName = "timeZoneShortName"
        case uuid = "uuid"
        case messageBoardId = "messageBoardId"
        case gmtOffSetMilliseconds = "gmtOffSetMilliseconds"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
        quoteType = try values.decodeIfPresent(String.self, forKey: .quoteType)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        underlyingSymbol = try values.decodeIfPresent(String.self, forKey: .underlyingSymbol)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        longName = try values.decodeIfPresent(String.self, forKey: .longName)
        firstTradeDateEpochUtc = try values.decodeIfPresent(Int.self, forKey: .firstTradeDateEpochUtc)
        timeZoneFullName = try values.decodeIfPresent(String.self, forKey: .timeZoneFullName)
        timeZoneShortName = try values.decodeIfPresent(String.self, forKey: .timeZoneShortName)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        messageBoardId = try values.decodeIfPresent(String.self, forKey: .messageBoardId)
        gmtOffSetMilliseconds = try values.decodeIfPresent(Int.self, forKey: .gmtOffSetMilliseconds)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct ReportDate : Codable {
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

struct Shares : Codable {
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

struct StartDate : Codable {
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

struct SummaryDetail : Codable {
    let maxAge : Int?
    let priceHint : Int?
    let previousClose : Double?
    let open : Double?
    let dayLow : Double?
    let dayHigh : Double?
    let regularMarketPreviousClose : Double?
    let regularMarketOpen : Double?
    let regularMarketDayLow : Double?
    let regularMarketDayHigh : Double?
    let payoutRatio : Double?
    let beta : Double?
    let trailingPE : Double?
    let forwardPE : Double?
    let volume : Int?
    let regularMarketVolume : Int?
    let averageVolume : Int?
    let averageVolume10days : Int?
    let averageDailyVolume10Day : Int?
    let bid : Double?
    let ask : Double?
    let bidSize : Int?
    let askSize : Int?
    let marketCap : Int?
    let nonDilutedMarketCap : Int?
    let fiftyTwoWeekLow : Double?
    let fiftyTwoWeekHigh : Double?
    let allTimeHigh : Double?
    let allTimeLow : Double?
    let priceToSalesTrailing12Months : Double?
    let fiftyDayAverage : Double?
    let twoHundredDayAverage : Double?
    let trailingAnnualDividendRate : Double?
    let trailingAnnualDividendYield : Double?
    let currency : String?
    let fromCurrency : String?
    let toCurrency : String?
    let lastMarket : String?
    let coinMarketCapLink : String?
    let algorithm : String?
    let tradeable : Bool?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case priceHint = "priceHint"
        case previousClose = "previousClose"
        case open = "open"
        case dayLow = "dayLow"
        case dayHigh = "dayHigh"
        case regularMarketPreviousClose = "regularMarketPreviousClose"
        case regularMarketOpen = "regularMarketOpen"
        case regularMarketDayLow = "regularMarketDayLow"
        case regularMarketDayHigh = "regularMarketDayHigh"
        case payoutRatio = "payoutRatio"
        case beta = "beta"
        case trailingPE = "trailingPE"
        case forwardPE = "forwardPE"
        case volume = "volume"
        case regularMarketVolume = "regularMarketVolume"
        case averageVolume = "averageVolume"
        case averageVolume10days = "averageVolume10days"
        case averageDailyVolume10Day = "averageDailyVolume10Day"
        case bid = "bid"
        case ask = "ask"
        case bidSize = "bidSize"
        case askSize = "askSize"
        case marketCap = "marketCap"
        case nonDilutedMarketCap = "nonDilutedMarketCap"
        case fiftyTwoWeekLow = "fiftyTwoWeekLow"
        case fiftyTwoWeekHigh = "fiftyTwoWeekHigh"
        case allTimeHigh = "allTimeHigh"
        case allTimeLow = "allTimeLow"
        case priceToSalesTrailing12Months = "priceToSalesTrailing12Months"
        case fiftyDayAverage = "fiftyDayAverage"
        case twoHundredDayAverage = "twoHundredDayAverage"
        case trailingAnnualDividendRate = "trailingAnnualDividendRate"
        case trailingAnnualDividendYield = "trailingAnnualDividendYield"
        case currency = "currency"
        case fromCurrency = "fromCurrency"
        case toCurrency = "toCurrency"
        case lastMarket = "lastMarket"
        case coinMarketCapLink = "coinMarketCapLink"
        case algorithm = "algorithm"
        case tradeable = "tradeable"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        priceHint = try values.decodeIfPresent(Int.self, forKey: .priceHint)
        previousClose = try values.decodeIfPresent(Double.self, forKey: .previousClose)
        open = try values.decodeIfPresent(Double.self, forKey: .open)
        dayLow = try values.decodeIfPresent(Double.self, forKey: .dayLow)
        dayHigh = try values.decodeIfPresent(Double.self, forKey: .dayHigh)
        regularMarketPreviousClose = try values.decodeIfPresent(Double.self, forKey: .regularMarketPreviousClose)
        regularMarketOpen = try values.decodeIfPresent(Double.self, forKey: .regularMarketOpen)
        regularMarketDayLow = try values.decodeIfPresent(Double.self, forKey: .regularMarketDayLow)
        regularMarketDayHigh = try values.decodeIfPresent(Double.self, forKey: .regularMarketDayHigh)
        payoutRatio = try values.decodeIfPresent(Double.self, forKey: .payoutRatio)
        beta = try values.decodeIfPresent(Double.self, forKey: .beta)
        trailingPE = try values.decodeIfPresent(Double.self, forKey: .trailingPE)
        forwardPE = try values.decodeIfPresent(Double.self, forKey: .forwardPE)
        volume = try values.decodeIfPresent(Int.self, forKey: .volume)
        regularMarketVolume = try values.decodeIfPresent(Int.self, forKey: .regularMarketVolume)
        averageVolume = try values.decodeIfPresent(Int.self, forKey: .averageVolume)
        averageVolume10days = try values.decodeIfPresent(Int.self, forKey: .averageVolume10days)
        averageDailyVolume10Day = try values.decodeIfPresent(Int.self, forKey: .averageDailyVolume10Day)
        bid = try values.decodeIfPresent(Double.self, forKey: .bid)
        ask = try values.decodeIfPresent(Double.self, forKey: .ask)
        bidSize = try values.decodeIfPresent(Int.self, forKey: .bidSize)
        askSize = try values.decodeIfPresent(Int.self, forKey: .askSize)
        marketCap = try values.decodeIfPresent(Int.self, forKey: .marketCap)
        nonDilutedMarketCap = try values.decodeIfPresent(Int.self, forKey: .nonDilutedMarketCap)
        fiftyTwoWeekLow = try values.decodeIfPresent(Double.self, forKey: .fiftyTwoWeekLow)
        fiftyTwoWeekHigh = try values.decodeIfPresent(Double.self, forKey: .fiftyTwoWeekHigh)
        allTimeHigh = try values.decodeIfPresent(Double.self, forKey: .allTimeHigh)
        allTimeLow = try values.decodeIfPresent(Double.self, forKey: .allTimeLow)
        priceToSalesTrailing12Months = try values.decodeIfPresent(Double.self, forKey: .priceToSalesTrailing12Months)
        fiftyDayAverage = try values.decodeIfPresent(Double.self, forKey: .fiftyDayAverage)
        twoHundredDayAverage = try values.decodeIfPresent(Double.self, forKey: .twoHundredDayAverage)
        trailingAnnualDividendRate = try values.decodeIfPresent(Double.self, forKey: .trailingAnnualDividendRate)
        trailingAnnualDividendYield = try values.decodeIfPresent(Double.self, forKey: .trailingAnnualDividendYield)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        fromCurrency = try values.decodeIfPresent(String.self, forKey: .fromCurrency)
        toCurrency = try values.decodeIfPresent(String.self, forKey: .toCurrency)
        lastMarket = try values.decodeIfPresent(String.self, forKey: .lastMarket)
        coinMarketCapLink = try values.decodeIfPresent(String.self, forKey: .coinMarketCapLink)
        algorithm = try values.decodeIfPresent(String.self, forKey: .algorithm)
        tradeable = try values.decodeIfPresent(Bool.self, forKey: .tradeable)
    }

}

struct SummaryProfile : Codable {
    let address1 : String?
    let city : String?
    let state : String?
    let zip : String?
    let country : String?
    let phone : String?
    let website : String?
    let industry : String?
    let industryKey : String?
    let industryDisp : String?
    let sector : String?
    let sectorKey : String?
    let sectorDisp : String?
    let longBusinessSummary : String?
    let fullTimeEmployees : Int?
    let companyOfficers : [String]?
    let executiveTeam : [String]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case address1 = "address1"
        case city = "city"
        case state = "state"
        case zip = "zip"
        case country = "country"
        case phone = "phone"
        case website = "website"
        case industry = "industry"
        case industryKey = "industryKey"
        case industryDisp = "industryDisp"
        case sector = "sector"
        case sectorKey = "sectorKey"
        case sectorDisp = "sectorDisp"
        case longBusinessSummary = "longBusinessSummary"
        case fullTimeEmployees = "fullTimeEmployees"
        case companyOfficers = "companyOfficers"
        case executiveTeam = "executiveTeam"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address1 = try values.decodeIfPresent(String.self, forKey: .address1)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        industry = try values.decodeIfPresent(String.self, forKey: .industry)
        industryKey = try values.decodeIfPresent(String.self, forKey: .industryKey)
        industryDisp = try values.decodeIfPresent(String.self, forKey: .industryDisp)
        sector = try values.decodeIfPresent(String.self, forKey: .sector)
        sectorKey = try values.decodeIfPresent(String.self, forKey: .sectorKey)
        sectorDisp = try values.decodeIfPresent(String.self, forKey: .sectorDisp)
        longBusinessSummary = try values.decodeIfPresent(String.self, forKey: .longBusinessSummary)
        fullTimeEmployees = try values.decodeIfPresent(Int.self, forKey: .fullTimeEmployees)
        companyOfficers = try values.decodeIfPresent([String].self, forKey: .companyOfficers)
        executiveTeam = try values.decodeIfPresent([String].self, forKey: .executiveTeam)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct Transactions : Codable {
    let maxAge : Int?
    let shares : Shares?
    let value : Value?
    let filerUrl : String?
    let transactionText : String?
    let filerName : String?
    let filerRelation : String?
    let moneyText : String?
    let startDate : StartDate?
    let ownership : String?

    enum CodingKeys: String, CodingKey {

        case maxAge = "maxAge"
        case shares = "shares"
        case value = "value"
        case filerUrl = "filerUrl"
        case transactionText = "transactionText"
        case filerName = "filerName"
        case filerRelation = "filerRelation"
        case moneyText = "moneyText"
        case startDate = "startDate"
        case ownership = "ownership"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
        shares = try values.decodeIfPresent(Shares.self, forKey: .shares)
        value = try values.decodeIfPresent(Value.self, forKey: .value)
        filerUrl = try values.decodeIfPresent(String.self, forKey: .filerUrl)
        transactionText = try values.decodeIfPresent(String.self, forKey: .transactionText)
        filerName = try values.decodeIfPresent(String.self, forKey: .filerName)
        filerRelation = try values.decodeIfPresent(String.self, forKey: .filerRelation)
        moneyText = try values.decodeIfPresent(String.self, forKey: .moneyText)
        startDate = try values.decodeIfPresent(StartDate.self, forKey: .startDate)
        ownership = try values.decodeIfPresent(String.self, forKey: .ownership)
    }

}

struct UpgradeDowngradeHistory : Codable {
    let history : [History]?
    let maxAge : Int?

    enum CodingKeys: String, CodingKey {

        case history = "history"
        case maxAge = "maxAge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        history = try values.decodeIfPresent([History].self, forKey: .history)
        maxAge = try values.decodeIfPresent(Int.self, forKey: .maxAge)
    }

}

struct Value : Codable {
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

struct Yearly : Codable {
    let date : Int?
    let revenue : Int?
    let earnings : Int?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case revenue = "revenue"
        case earnings = "earnings"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(Int.self, forKey: .date)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        earnings = try values.decodeIfPresent(Int.self, forKey: .earnings)
    }

}

// MARK: - Stock Summary Response Models

struct StockSummaryResponse: Codable {
    let meta: StockSummaryMeta?
    let data: [StockSummaryData]?
    let type: String?
    let symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case meta
        case data
        case type
        case symbol
    }
}

struct StockSummaryMeta: Codable {
    let symbol: String?
    let instrumentType: String?
    let exchange: String?
    let currency: String?
    let exchangeTimezone: String?
    let firstTradeDate: Int?
    let regularMarketTime: Int?
    let hasPrePostMarketData: Bool?
    let twelveMonthHigh: Double?
    let twelveMonthLow: Double?
    let fiftyDayAverage: Double?
    let twoHundredDayAverage: Double?
    let dividendDate: Int?
    let dividendYield: Double?
    let payoutAmount: Int?
    let dividendRate: Double?
    let exDividendDate: Int?
    let beta: Double?
    let trailingAnnualDividendYield: Double?
    let priceHint: Int?
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case instrumentType
        case exchange
        case currency
        case exchangeTimezone
        case firstTradeDate
        case regularMarketTime
        case hasPrePostMarketData
        case twelveMonthHigh
        case twelveMonthLow
        case fiftyDayAverage
        case twoHundredDayAverage
        case dividendDate
        case dividendYield
        case payoutAmount
        case dividendRate
        case exDividendDate
        case beta
        case trailingAnnualDividendYield
        case priceHint
    }
}

struct StockSummaryData: Codable {
    let symbol: String?
    let shortName: String?
    let longName: String?
    let exchange: String?
    let currency: String?
    let quoteType: String?
    let totalCash: Int?
    let totalCashPerShare: Double?
    let ebitda: Int?
    let totalDebt: Int?
    let totalRevenue: Int?
    let revenuePerShare: Double?
    let grossProfits: Int?
    let grossMargins: Double?
    let operatingMargins: Double?
    let profitMargins: Double?
    let returnOnAssets: Double?
    let returnOnEquity: Double?
    let earningsTimestamp: Int?
    let earningsDate: [Int]?
    let earningsAverage: Double?
    let earningsLow: Double?
    let earningsHigh: Double?
    let revenueAverage: Int?
    let revenueLow: Int?
    let revenueHigh: Int?
    let price: Double?
    let priceChange: Double?
    let priceChangePercent: Double?
    let marketCap: Int?
    let marketCapChange: Int?
    let marketCapChangePercent: Double?
    let volume: Int?
    let averageVolume: Int?
    let peRatio: Double?
    let forwardPE: Double?
    let pegRatio: Double?
    let beta: Double?
    let epsTTM: Double?
    let earningsGrowth: Double?
    let revenueGrowth: Double?
    let annualEps: Double?
    let annualRevenue: Int?
    let annualProfit: Int?
    let priceToBook: Double?
    let priceToSales: Double?
    let bookValue: Double?
    let sector: String?
    let industry: String?
    let website: String?
    let recommendationMean: Double?
    let recommendationKey: String?
    let numberOfAnalystOpinions: Int?
    let targetLowPrice: Double?
    let targetMeanPrice: Double?
    let targetHighPrice: Double?
    let targetMedianPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case shortName
        case longName
        case exchange
        case currency
        case quoteType
        case totalCash
        case totalCashPerShare
        case ebitda
        case totalDebt
        case totalRevenue
        case revenuePerShare
        case grossProfits
        case grossMargins
        case operatingMargins
        case profitMargins
        case returnOnAssets
        case returnOnEquity
        case earningsTimestamp
        case earningsDate
        case earningsAverage
        case earningsLow
        case earningsHigh
        case revenueAverage
        case revenueLow
        case revenueHigh
        case price
        case priceChange
        case priceChangePercent
        case marketCap
        case marketCapChange
        case marketCapChangePercent
        case volume
        case averageVolume
        case peRatio
        case forwardPE
        case pegRatio
        case beta
        case epsTTM
        case earningsGrowth
        case revenueGrowth
        case annualEps
        case annualRevenue
        case annualProfit
        case priceToBook
        case priceToSales
        case bookValue
        case sector
        case industry
        case website
        case recommendationMean
        case recommendationKey
        case numberOfAnalystOpinions
        case targetLowPrice
        case targetMeanPrice
        case targetHighPrice
        case targetMedianPrice
    }
}
