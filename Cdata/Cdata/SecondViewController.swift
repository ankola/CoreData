
import UIKit
protocol dataparse {
    func data(fname:String,lname:String,number:String,email:String,get:Int, check:Bool)
}

class SecondViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, cellDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    
    var delegate:dataparse? = nil
    var getid:Int?
    var checkAddorUpdate = false
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataBase.sharedinstance.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell)!
        
        var data = DataBase.sharedinstance.getData()
        
        cell.user = data[indexPath.row]
        
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        var getdata = DataBase.sharedinstance.getData()[indexPath.row]

        delegate?.data(fname: getdata.fname as! String, lname: getdata.lname as! String, number: getdata.number as! String, email: getdata.email as! String,get: indexPath.row, check: true)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func didTapDelete(tag: Int) {

        DataBase.sharedinstance.DeleteData(index: tag);
        self.tblView.reloadData()
    }

    
}
