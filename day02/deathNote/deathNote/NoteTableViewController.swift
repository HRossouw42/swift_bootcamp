//
//  NoteTableViewController.swift
//  deathNote
//
//  Created by Harmun Rossouw on 2019/10/19.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    //MARK: PROPERTIES
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleNotes()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NoteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NoteTableViewCell.")
        }
        
        // Fetches the appropriate note for the data source layout.
        let note = notes[indexPath.row]
        // Configure the cell...
        cell.nameLabel.text = note.name
        cell.descriptionLabel.text = note.description
        cell.dateLabel.text = note.date
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Guard", description: "Arrow to the knee \nAnd the eye", date: "2019-11-21") else { fatalError("Note1 broke") }
        
        guard let note2 = Note(name: "Toblin", description: "Gelatinous Cube", date: "2019-12-30") else { fatalError("Note2 broke") }
        
        guard let note3 = Note(name: "Bobby", description: "Arrow to the knee", date: "2020-01-01") else { fatalError("Note3 broke") }
        
        notes += [note1, note2, note3]
    }
}

