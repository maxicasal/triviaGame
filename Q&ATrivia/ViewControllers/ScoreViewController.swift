import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoresTableView: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!

    var questions = [Question]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableview()
        setupScoreLabel()
    }

    func setupTableview() {
        scoresTableView.delegate = self
        scoresTableView.dataSource = self
        scoresTableView.reloadData()
    }

    func setupScoreLabel() {
        scoreLabel.text = "\(getCorrectAnswers()) / \(questions.count)"
    }

    // Method to calculate the number of answer that were replied correctly.
    func getCorrectAnswers() -> Int {
        return questions.filter{ $0.answer == NSString(string: $0.correct_answer).boolValue }.count
    }
}

extension ScoreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = scoresTableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.QuestionCellId), let questionCell = cell as? QuestionTableViewCell else {
            return UITableViewCell()
        }

        let question = questions[indexPath.row]

        questionCell.setupCell(question, index: indexPath.row)

        return cell
    }
}
