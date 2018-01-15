import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var randomNumberLabel: UILabel!
  
  var number = 10
  var index = 0
  let colors = [UIColor.red, UIColor.green, UIColor.blue]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.newRandomNumber(self)
  }
  
  @IBAction func newRandomNumber(_ sender: Any) {
    self.number = Int(arc4random_uniform(6)+1)
    self.randomNumberLabel.text = "\(number)"
    
    self.index += 1
      if self.index > 2 {
        self.index = 0
      }
    self.view.backgroundColor = self.colors[self.index]
    
  }
}
