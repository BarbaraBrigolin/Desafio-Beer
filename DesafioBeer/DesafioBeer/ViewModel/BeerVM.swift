//
//  BeerVM.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import Foundation

class BeerVM{
    
    private var dataBeer:[BeerElements] = []
    var getArrayBeer:[BeerElements] = []
    
    func deleteBeer(index:IndexPath){
        self.dataBeer.remove(at: index.row)
        self.getArrayBeer = self.dataBeer
    }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText == ""{
            self.getArrayBeer = dataBeer
        }else{
            self.getArrayBeer = dataBeer.filter { (beer: BeerElements) -> Bool in
                return beer.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    var beer:BeerElements?
    
    public func selectedBeer(value:BeerElements){
        self.beer = value
    }
    
    
    var countElement:Int{
        return self.getArrayBeer.count
    }
    
    public func getBeer(completion: @escaping(_ value:Bool) -> Void){
        Service().getBeer { success, error in
            if success != nil{
                self.dataBeer = success ?? []
                self.getArrayBeer = self.dataBeer
                completion(true)
            }else{
                completion(false)
            }
        }
    }
}
