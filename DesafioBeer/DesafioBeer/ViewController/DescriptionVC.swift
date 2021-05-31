//
//  DescriptionVC.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 31/05/21.
//

import UIKit

class DescriptionVC: UIViewController {

    
    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var abvLabel: UILabel!
    
    @IBOutlet weak var ibuLabel: UILabel!
    
    @IBOutlet weak var food_pairingLabel: UILabel!
    
    
    var beer:BeerElements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configDetails()
    }
    
    
    func configDetails(){
        self.nameLabel.text = String(describing: beer?.name ?? "")
        self.descriptionLabel.text = String(describing: beer?.description ?? "")
        self.abvLabel.text = String(describing: beer?.abv )
        self.ibuLabel.text = String(describing: beer?.ibu )
        guard let url:URL = URL(string: beer?.image_url ?? "") else {return}
        beerImage.load(url: url)
    }

}
    
    
    

