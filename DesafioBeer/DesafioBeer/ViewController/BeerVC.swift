//
//  ViewController.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import UIKit

class BeerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel:BeerVM = BeerVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getBeer()
        
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
        self.tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "DescriptionVC"{
            let data:DescriptionVC? = segue.destination as? DescriptionVC
            data?.beer = self.viewModel.beer
        }
    }
}

extension BeerVC:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.countElement
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.configBeer(setup: self.viewModel.getArrayBeer[indexPath.row])
    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedBeer(value: self.viewModel.getArrayBeer[indexPath.row])
        self.performSegue(withIdentifier: "DescriptionVC", sender: nil)
    }

    
  }

