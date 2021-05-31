//
//  BeerVM.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import Foundation

class BeerVM{
    
    private var dataBeer:[BeerElements] = []
    
    var getArrayBeer:[BeerElements]{
        return self.dataBeer
    }
    
    var beer:BeerElements?
    
    public func selectedBeer(value:BeerElements){
        self.beer = value
    }
    
    
    var countElement:Int{
        return self.dataBeer.count
    }
    
    public func getBeer(completion: @escaping(_ value:Bool) -> Void){
        Service().getBeer { success, error in
            if success != nil{
                self.dataBeer = success ?? []
                completion(true)
            }else{
                completion(false)
            }
        }
    }
}
