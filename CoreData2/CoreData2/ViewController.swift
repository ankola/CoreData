
import UIKit

class ViewController: UIViewController {
    
    var checkUpdateorSave = true
    var getindex:Int?
    
    @IBOutlet var txtFname:UITextField!
    @IBOutlet var txtLname:UITextField!
    @IBOutlet var txtNumber:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view")
        
        self.checkUpdateorSave = false

    }
    
    @IBAction func btnSubmit(sender: UIButton){
        
        var dict = ["fn":txtFname.text,"ln":txtLname.text,"num":txtNumber.text]
        print(checkUpdateorSave)
        if checkUpdateorSave == true {
            
            data.sharedinstance.editData(object: dict as! [String : String], i: getindex!)

        }else{
        data.sharedinstance.savedata(dict: dict as! [String : String])
        }
        
        let secvc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        self.navigationController?.pushViewController(secvc!, animated: true)
    }
    
}

