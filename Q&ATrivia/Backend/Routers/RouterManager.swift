import Foundation
import Alamofire

protocol RouterManager {
    static func route(_ router: Router) -> URLRequestConvertible
}
