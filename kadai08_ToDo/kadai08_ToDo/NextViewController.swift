
import UIKit

class NextViewController: UIViewController {
    
    // String型、初期化する
    //　toDoStringは、ViewControllerのtextFieldで入力したテキストが入ってくる場所
    var toDoString = String()
    
    @IBOutlet weak var todoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //　var関数で入ってきたテキストを、viewDidLoadに表示させる
        todoLabel.text = toDoString
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
   

}
