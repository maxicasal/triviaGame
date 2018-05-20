import UIKit
import HexLoader
import SwiftMessages

class GameViewController: UIViewController {

    var questions = [Question]()
    fileprivate var questionIndex = 0

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionIndexLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        HexagonLoaderConfig.shared.backgroundType = .dark
        questionLabel.adjustsFontSizeToFitWidth = true
        loadQuestions()
    }

    func loadQuestions() {
        startLoading(with: "Loading...")
        APIManager.sharedInstance.getTriviaQuestions { [weak self] (questionsArray) -> Void in
            if let questionsArray = questionsArray {
                self?.questions = questionsArray
                self?.setupQuestionInformation()
            } else {
                self?.performSegue(withIdentifier: Constants.SegueIdentifiers.HomeSegueId, sender: self)
                MessageHandler.errorHandlerWithString("It was not possible to load the questions. Please try again.")
            }
            self?.stopLoading()
        }
    }

    func goToScoreScreen() {
        performSegue(withIdentifier: Constants.SegueIdentifiers.ScoresSegueId, sender: self)
    }

    // Method to change the label information for the next question. If it's the last question it go to Score screen.
    func setupQuestionInformation() {
        guard questionIndex != questions.count else {
            goToScoreScreen()
            return
        }

        let question = questions[questionIndex]

        // Add Transition to label changes
        categoryLabel.fadeTransition(0.4)
        questionLabel.fadeTransition(0.4)
        questionIndexLabel.fadeTransition(0.4)

        // Set lable information
        categoryLabel.text = question.category!
        questionLabel.text = question.question!
        questionIndexLabel.text = "\(questionIndex+1) of \(questions.count)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifiers.ScoresSegueId {
            if let destinationController = segue.destination as? ScoreViewController {
                destinationController.questions = questions
            }
        }
    }

    @IBAction func onTruePressed(_ sender: Any) {
        questions[questionIndex].answer = true
        questionIndex = questionIndex + 1

        setupQuestionInformation()
    }

    @IBAction func onFalsePressed(_ sender: Any) {
        questions[questionIndex].answer = false
        questionIndex = questionIndex + 1
        
        setupQuestionInformation()
    }
}
