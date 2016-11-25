//
//  SaveViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var savedTales: [String] = ["hi", "pie", "man"]
    
    // with the core data will be var savedTales: [SavedTales] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Adding black logout button to top
        let testUIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from coredata
       // getData()
        
        // reload the tableview
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tale = savedTales[indexPath.row]
         cell.textLabel?.text = tale
        return cell
    }
 
//    This is for gathering the coredata
//    func getData() {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        
//        do
//        {
//            tasks = try context.fetch(Task.fetchRequest())
//        } catch {
//            print("Fetching Failed")
//        }
//    }

    
    // This is for the delete swiper using core data on the table
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        
//        if editingStyle == .delete {
//            let task = tasks[indexPath.row]
//            context.delete(task)
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//            do
//            {
//                tasks = try context.fetch(Task.fetchRequest())
//            } catch {
//                print("Fetching Failed")
//            }
//        }
//        
//        tableView.reloadData()
//    }



}
