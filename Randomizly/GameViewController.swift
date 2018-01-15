import UIKit

class GameViewController: UIViewController {

  @IBOutlet weak var inputField: UITextField!
  
  @IBAction func guess(_ sender: Any) {
    if let input = self.inputField.text, input != "" {
      print("Input: \(input)")
    } else {
      print("No input")
    }
  }
  
}
