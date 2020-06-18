import UIKit
import PKHUD


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    var textArray = [String]()

    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // tableViewのdelegateメソッドを自分の中(self)で呼べるようにした
        tableView.delegate = self
        tableView.dataSource = self
        textfield.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    

    // 'numberOfRows'　Sectionの中のcellの数を決めるメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //-> Int型は、Int型を返さないといけない。
        return textArray.count
    }
    
    // Sectionの数を決める
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    // 'cellForRowAt' cellの中身を構築するDelegateメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //コードでcell内の文字の大きさを変更
        cell.textLabel!.font = UIFont(name: "Arial", size: 25)
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // タップした時に、その配列の中身を取り出して、値を渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "Next") as! NextViewController
        
        nextVC.toDoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    // 'heightForRowAt' cellの高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        // cell上で高さ決めてなくても、下記コードで高さを自動で決められる
        // この場合、画面の7分割となる
        return view.frame.size.height/6
    }
    
    // 'ShouldReturn' keyboadのリターンキーが押されたら、発動するメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // textArrayの中に、textFieldで入力された値を入れます
        textArray.append(textField.text!)
        // 'resignFirstResponder'でtextFieldの中のキーボードを閉じます
        textField.resignFirstResponder()
        //　textFieldのテキストを空にする
        textField.text = ""
        tableView.reloadData()
        
        return true
        
    }
    
    
    
}

