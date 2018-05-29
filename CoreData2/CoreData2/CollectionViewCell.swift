//
//  CollectionViewCell.swift
//  CoreData2
//
//  Created by agile on 5/28/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var lblfn:UILabel!
    @IBOutlet var lblln:UILabel!
    @IBOutlet var lblnum:UILabel!
    
    var user : User!{
        didSet {
            lblfn.text = user.firstname
            lblln.text = user.lastname
            lblnum.text = user.number
        }
    }
    
}
