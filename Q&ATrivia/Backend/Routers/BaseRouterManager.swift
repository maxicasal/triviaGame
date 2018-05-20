import Foundation
import Alamofire

class BaseRouterManager: RouterManager {

    // MARK: - RouterManager
    class func route(_ router: Router) -> URLRequestConvertible {
        let baseUrl = Constants.Properties.BaseURL
        let URL = Foundation.URL(string: baseUrl)!
        return buildRequest(URL, path: router.path, method: router.method, parameters: router.params, requireAuth: router.requireAuth)
    }

    class func buildRequest(_ url: URL, path: String, method: Alamofire.HTTPMethod, parameters: Dictionary<String, Any>?, requireAuth: Bool) -> URLRequestConvertible {
        return AlamofireRequest(url, path: path, method: method, parameters: parameters, requireAuth: requireAuth)
    }

    class AlamofireRequest : URLRequestConvertible {

        var url : URL
        var path : String = ""
        var method : Alamofire.HTTPMethod
        var parameters : Dictionary<String, Any>?
        var requireAuth : Bool

        init(_ url: URL, path: String, method: Alamofire.HTTPMethod, parameters: Dictionary<String, Any>?, requireAuth: Bool) {
            self.url = url
            self.path = path
            self.method = method
            self.parameters = parameters
            self.requireAuth = requireAuth
        }

        open func asURLRequest() throws -> URLRequest {
            var request = path != "" ? URLRequest(url: url.appendingPathComponent(path)) : URLRequest(url: url)
            if let parameters = parameters, parameters.count > 0 {
                let data: NSDictionary = ParameterBuilder.build(parameters)

                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
                } catch _ as NSError {
                    request.httpBody = nil
                }
            }

            request.httpMethod = method.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            return request
        }
    }
}
