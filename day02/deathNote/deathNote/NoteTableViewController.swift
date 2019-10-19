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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
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
    
    
    //MARK: Actions
    @IBAction func unwindToNoteList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NoteViewController, let note = sourceViewController.note {
            let newIndexPath = IndexPath(row: notes.count, section: 0)
            notes.append(note)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Premade Notes
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Guard", description: "Arrow to the knee \nAnd the eye \nAnd again \nAnd Again", date: "2019-11-21") else { fatalError("Note1 broke") }
        
        guard let note2 = Note(name: "Toblin", description: "Gelatinous Cube", date: "2019-12-30") else { fatalError("Note2 broke") }
        
        guard let note3 = Note(name: "xxxLegolasxxx", description: "Being too cool \nfor his school", date: "2020-01-01") else { fatalError("Note3 broke") }
        
        notes += [note1, note2, note3]
    }
}

