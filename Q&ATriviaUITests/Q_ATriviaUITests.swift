import XCTest

class Q_ATriviaUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGameBeginCorrectly() {
        app.launch()
        app.buttons["BEGIN"].tap()
        XCTAssertFalse(app.buttons["FALSE"] != nil)
    }
}
