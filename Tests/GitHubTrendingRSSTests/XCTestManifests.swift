import XCTest

extension GitHubPageParserTests {
    static let __allTests = [
        ("testParsePeriodSpecifiedTrendingPageLinks", testParsePeriodSpecifiedTrendingPageLinks)
    ]
}

extension ModelsTests {
    static let __allTests = [
        ("testGenerateRssListHTML", testGenerateRssListHTML),
        ("testRepository", testRepository)
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GitHubPageParserTests.__allTests),
        testCase(ModelsTests.__allTests)
    ]
}
#endif
