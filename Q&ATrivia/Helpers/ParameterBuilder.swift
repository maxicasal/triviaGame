import Foundation
import Alamofire

class ParameterBuilder {

    static func build(_ parameters: Dictionary<String, Any>?) -> NSMutableDictionary {
        let data = NSMutableDictionary()

        if let parameters = parameters {
            for (key, value) in parameters {
                data[key] = value
            }
        }

        return data
    }
}
