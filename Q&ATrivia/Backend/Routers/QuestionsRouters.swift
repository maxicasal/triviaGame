import Foundation
import Alamofire
import ObjectMapper

enum QuestionsRouter: Router {

    case retrieveTriviaQuestions()
    
    var path: String {
        switch self {
        case .retrieveTriviaQuestions:
            return ""
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .retrieveTriviaQuestions:
            return Alamofire.HTTPMethod.get
        }
    }
    
    var requireAuth: Bool {
        return false
    }
    
    var params: Dictionary<String, Any>? {
        switch self {
        case .retrieveTriviaQuestions():
            return [:]
        }
    }
}
