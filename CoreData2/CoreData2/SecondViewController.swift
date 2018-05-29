
import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var objcollection:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        objcollection.delegate = self
        objcollection.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.sharedinstance.getData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell)!
        
        var arr = data.sharedinstance.getData()
        cell.user = arr[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        data.sharedinstance.DeleteData(index: indexPath.row)
//        objcollection.reloadData()
        let firstvc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        print(firstvc?.checkUpdateorSave)
        firstvc?.checkUpdateorSave = true
        print(firstvc?.checkUpdateorSave)
        firstvc?.getindex = indexPath.row
        
        self.navigationController?.popViewController(animated: true)
       // dismiss(animated: true, completion: nil)
    }
    
    

}
