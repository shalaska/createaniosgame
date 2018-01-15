import UIKit

class GameViewController: UIViewController {

  @IBOutlet weak var inputField: UITextField!
  
  @IBOutlet weak var hintLabel: UILabel!
  
  let model = RandomizlyModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.hintLabel.isHidden = true
  }
  
  @IBAction func guess(_ sender: Any) {
    if let input = self.inputField.text, let number = Int(input) {
      let result = self.model.guess(number)
      let tries = self.model.tries
      switch result {
      case .correct:
        self.showAlert(title: "Victory", message: "You guessed the number correctly! Tries needed: \(tries)")
        self.model.newRandomNumber()
        self.inputField.text = ""
        self.hintLabel.isHidden = true
      
      case .tooLow:
        self.hintLabel.text = "👆 HIGHER 📈"
        
      case .tooHigh:
        self.hintLabel.text = "👇 LOWER 📉"

      }
      print("Result: \(result), tries: \(tries)")
    } else {
      print("No input")
      self.showAlert(title: "Error", message: "Enter a number!")
    }
  }
  
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(defaultAction)
    present(alertController, animated:true, completion: nil)
  }
  
}
