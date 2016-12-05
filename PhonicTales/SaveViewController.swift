//
//  SaveViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit
import AVFoundation

class SaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AVSpeechSynthesizerDelegate {
    
    var savedTales: [Story] = []
    let synthesizer = AVSpeechSynthesizer()
    
    
    // with the core data will be var savedTales: [SavedTales] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from coredata
        getData()
        
        // reload the tableview
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTales.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newDate = ""
        let cell = UITableViewCell()
        let tale = savedTales[indexPath.row]
        
        func dateFormatChanger(date:NSDate) {
            let date = NSDate()
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy, hh:mm a zz"
            var newDateString = dateFormatter.string(from: date as Date)
            newDate = newDateString
        }
        dateFormatChanger(date: tale.storyCreationDate!)
         cell.textLabel?.text = newDate
        return cell
    }
 
//    This is for gathering the coredata
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            savedTales = try context.fetch(Story.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }

    
    // This is for the delete swiper using core data on the table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let tale = savedTales[indexPath.row]
            context.delete(tale)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do
            {
                savedTales = try context.fetch(Story.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tale = savedTales[indexPath.row]
        
        let utterance = AVSpeechUtterance(string: tale.storyText!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)

    }


}
