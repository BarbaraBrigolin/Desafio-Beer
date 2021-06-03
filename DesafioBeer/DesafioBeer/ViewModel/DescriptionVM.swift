//
//  DescriptionVM.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 02/06/21.
//

import Foundation


class DescriptionVM{
    
    private let beer:BeerElements?
    
    public var getDetailBeer:BeerElements?{
        return self.beer
    }
    
    public var lineNumberCount:Int = 1
    
    init(beerElement:BeerElements?) {
    
        self.beer = beerElement
        
    }
}
