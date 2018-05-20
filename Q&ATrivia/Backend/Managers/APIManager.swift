import UIKit
import Alamofire
import ObjectMapper

class APIManager: NSObject {

    static let sharedInstance = APIManager()

    func processError(_ request: URLRequest, response: HTTPURLResponse?, result: Result<Any>, hideErrorForKeys: [String]?, hideErrorForDescription: String?, showAcknowledge: Bool? = false) -> NSError? {
        var errorObject : NSError? = nil

        if (result.isFailure) {
           errorObject = NSError(domain: "Error Trivia Q&A", code: (response?.statusCode)!, userInfo: [NSLocalizedDescriptionKey : "Server not working."])
        }

        return errorObject
    }

    func isSuccessStatusCode(code: Int?) -> Bool {
        let statusRange = Constants.Properties.SuccessRange
        if code != nil {
            return statusRange.contains(code!)
        }

        return false
    }
}
