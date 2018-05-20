import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension APIManager {

    typealias QuestionsCompletionHandler = (([Question]?) -> Void)

    func getTriviaQuestions(_ completionHandler: @escaping QuestionsCompletionHandler) {
        Alamofire.request(BaseRouterManager.route(QuestionsRouter.retrieveTriviaQuestions()))
            .responseJSON { [weak self] (dataResponse) in
                if !(self?.isSuccessStatusCode(code: dataResponse.response?.statusCode))! {
                    completionHandler(nil)
                } else if let responseValue = dataResponse.result.value {
                    completionHandler(self?.handleQuestionsAnswer(responseValue))
                }
        }
    }

    func handleQuestionsAnswer(_ jsonResponse: Any?) -> Array<Question> {
        var allQuestions = Array<Question>()
        let questionsJsonResponse = (jsonResponse as! NSDictionary)["results"] as! Array<NSDictionary>

        for question in questionsJsonResponse {
            allQuestions.append(Mapper<Question>().map(JSONObject: question)!)
        }

        return allQuestions
    }
}
