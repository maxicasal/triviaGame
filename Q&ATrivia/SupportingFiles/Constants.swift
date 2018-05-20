import UIKit

struct Constants {

    struct Properties {
        static let BaseURL = "https://opentdb.com/api.php?amount=\(Constants.QuestionsRequest.NumberOfQuestions)&difficulty=\(Constants.QuestionsRequest.Level)&type=\(Constants.QuestionsRequest.QuestionType)"
        static let SuccessRange = 200...299
    }

    struct QuestionsRequest {
        static let NumberOfQuestions = "10"
        static let Level = "hard"
        static let QuestionType = "boolean"
    }

    struct StatusCodeRanges {
        static let SuccessCodeRange = 200...299
        static let ErrorCodeRange = 500...599
    }

    struct CellIdentifiers {
        static let QuestionCellId = "questionCellId"
    }

    struct QuestionAnswer {
        static let Correct = "✅"
        static let Incorrect = "❌"
    }

    struct SegueIdentifiers {
        static let ScoresSegueId = "scoresSegueId"
        static let GameSegueId = "gameSegueId"
        static let HomeSegueId = "homeSegueId"
    }

    struct Colors {
        static let Success = UIColor(red: 55/255.0, green: 200/255.0, blue: 113/255.0, alpha: 1)
        static let Error = UIColor(red: 229/255.0, green: 57/255.0, blue: 53/255.0, alpha: 1)
        static let Warning = UIColor(red: 255/255.0, green: 127/255.0, blue: 42/255.0, alpha: 1)
        static let Info = UIColor(red: 0/255.0, green: 120/255.0, blue: 184/255.0, alpha: 1)
    }
}
