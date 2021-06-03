//
//  CustomDescriptionCell.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 02/06/21.
//

import UIKit

class CustomDescriptionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var abvLabel: UILabel!
    
    @IBOutlet weak var ibuLabel: UILabel!
    
    @IBOutlet weak var food_pairingLabel: UILabel!
    
    static let identifier:String = "CustomDescriptionTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func getFood_pairingLabel(data:[String])->String{
        var food:String = ""
        for value in data{
            if food.isEmpty{
                food = food + value
            }else{
                food = food + "\n" + value
            }
           
        }
        return food
    }

    func configDetails(beer:BeerElements?){
        self.nameLabel.text = String(describing: beer?.name ?? "")
        self.descriptionLabel.text = String(describing: beer?.description ?? "")
        self.abvLabel.text = String(describing: beer?.abv ?? 0.0)
        self.ibuLabel.text = String(describing: beer?.ibu ?? 0.0)
        guard let url:URL = URL(string: beer?.image_url ?? "") else {return}
        beerImage.load(url: url)
        self.food_pairingLabel.text = self.getFood_pairingLabel(data:beer?.food_pairing ?? [])
        }
    }
    

