//
//  DescriptionVC.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 31/05/21.
//

import UIKit

class DescriptionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel:DescriptionVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomDescriptionTableViewCell.nib(), forCellReuseIdentifier: CustomDescriptionTableViewCell.identifier)
    }
}

extension DescriptionVC:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.lineNumberCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomDescriptionTableViewCell.identifier, for: indexPath) as? CustomDescriptionTableViewCell
        
        cell?.configDetails(beer: self.viewModel?.getDetailBeer)
        
        return cell ?? UITableViewCell()
    }
}
