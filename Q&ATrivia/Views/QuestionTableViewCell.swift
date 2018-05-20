import UIKit

class QuestionTableViewCell: UITableViewCell {

    var question: Question?

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    func setupCell(_ question: Question, index: Int) {
        self.question = question
        let correctAnswer = NSString(string: question.correct_answer)
        answerLabel.text = question.answer == correctAnswer.boolValue ? Constants.QuestionAnswer.Correct : Constants.QuestionAnswer.Incorrect
        questionLabel.text = "\(index+1) - \(question.question!)"
        questionLabel.adjustsFontSizeToFitWidth = true
    }
}
