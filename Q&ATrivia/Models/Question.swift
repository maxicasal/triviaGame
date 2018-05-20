import Foundation
import ObjectMapper
import AlamofireObjectMapper
import StringExtensionHTML

final class Question: Mappable {
    var category: String!
    var type: String!
    var difficulty: String!
    var question: String!
    var correct_answer: String!
    var incorrect_answers: [String]!
    var answer: Bool!

    // MARK: - Mappable
    required init?(map: Map) {}

    init() {}

    func mapping(map: Map) {
        category <- map["category"]
        type <- map["type"]
        difficulty <- map["difficulty"]
        question <- map["question"]
        correct_answer <- map["correct_answer"]
        incorrect_answers <- map["incorrect_answers"]
        
        // Decode values from HTML Entities
        question = question.stringByDecodingHTMLEntities
        category = category.stringByDecodingHTMLEntities
        
        // Default value false
        answer = false
    }
}
