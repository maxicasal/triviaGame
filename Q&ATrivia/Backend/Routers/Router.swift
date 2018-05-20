import Foundation
import Alamofire

protocol Router {

    var requireAuth: Bool { get }

    var params: Dictionary<String, Any>? { get }

    var method: Alamofire.HTTPMethod { get }

    var path: String { get }
}
