//
//  CustomTableViewCell.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    
    @IBOutlet weak var nameBeerLabel: UILabel!
    
 
    
    static let identifier:String = "CustomTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
       
    func configBeer(setup:BeerElements){
     
        self.nameBeerLabel.text = String(describing: setup.name ?? "")
        guard let url:URL = URL(string: setup.image_url ?? "") else {return}
        beerImageView.load(url: url)
    }
    
}



