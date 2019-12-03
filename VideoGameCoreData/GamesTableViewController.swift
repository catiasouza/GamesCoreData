//
//  GamesTableViewController.swift
//  VideoGameCoreData
//
//  Created by Catia Miranda de Souza on 02/12/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit
import CoreData

class GamesTableViewController: UITableViewController {

    
    var fetchResultsControler: NSFetchedResultsController<Game>!
    var label = UILabel() //mensagem na tela
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Voce nao tem jogos cadastrados"
        label.textAlignment = .center
       loadGames()
    }
    func loadGames(){
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title" ,ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchResultsControler = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsControler.delegate = self
        
        do{
        try fetchResultsControler.performFetch()
        }catch{
            print(error.localizedDescription)
        }
    }
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchResultsControler.fetchedObjects?.count ?? 0
        tableView.backgroundView = count == 0 ? label: nil
        return count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        
        guard let game = fetchResultsControler.fetchedObjects?[indexPath.row] else {
            return cell 
        }
        cell.prepare(with: game)
        return cell
    }
   
}
// sempre q houver mudanca no objeto este metodo dispara
extension GamesTableViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            tableView.reloadData()
        }
    }
}
