//
//  AddEditViewController.swift
//  VideoGameCoreData
//
//  Created by Catia Miranda de Souza on 02/12/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tfConsole: UITextField!
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var dpReleseData: UIDatePicker!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var tbAddEdit: UIButton!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
    }
    @IBAction func addEditGame(_ sender: UIButton) {
        //criar game
        if game == nil{
            game = Game(context: context)
        }
        game.title = tfTitle.text
        game.releaseDate = dpReleseData.date
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
        navigationController?.popViewController(animated: true)
    }
    
    

}
