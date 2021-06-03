//
//  ViewController.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import UIKit

class BeerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searche: UISearchBar!
    
    var viewModel:BeerVM = BeerVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getBeer()
        self.searche.delegate = self
       
    }
    
    private func getBeer(){
        self.viewModel.getBeer {value in
            if value{
                self.configTableView()
            }
        }
    }

    func configTableView(){
        DispatchQueue.main.async {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomBeerTableViewCell.nib(), forCellReuseIdentifier: CustomBeerTableViewCell.identifier)
        self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "DescriptionVC"{
            let data:DescriptionVC? = segue.destination as? DescriptionVC
            data?.viewModel =  DescriptionVM(beerElement: self.viewModel.selectedBeer)
        }
    }
    
  
    
}

extension BeerVC:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.countElement
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomBeerTableViewCell.identifier, for: indexPath) as? CustomBeerTableViewCell
        
        cell?.configBeer(setup: self.viewModel.getArrayBeer[indexPath.row])
    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedBeer(value: self.viewModel.getArrayBeer[indexPath.row])
        self.performSegue(withIdentifier: "DescriptionVC", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.viewModel.deleteBeer(index: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
  }

extension BeerVC:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.filterContentForSearchText(searchBar.text ?? "")
        self.tableView.reloadData()
        
    }

    
}


