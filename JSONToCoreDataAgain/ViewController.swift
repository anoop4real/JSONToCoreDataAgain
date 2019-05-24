//
//  ViewController.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIUpdaterProtocol {
    
    private var navigator: SimpleNavigator!
    private var albumTableView:UITableView!
    func updateUI() {
        
        dataStore.getDataFromDB()
        albumTableView.reloadData()
    }
    
    var dataStore:DataStore!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpNavigator()
        setUpTableView()
        dataStore = DataStore(uiUpdater: self)
        dataStore.fetchedResultsController.delegate = self
        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ConnectivityMananger.shared().addListener(listener: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ConnectivityMananger.shared().removeListener(listener: self)
    }
    
    func fetchData(){
        
        dataStore.fetchAlbumData()
    }

    
    func setUpNavigator() {
        navigator = SimpleNavigator(navigationController: self.navigationController!)
    }
    func setUpTableView() {
        
        albumTableView = UITableView()
        albumTableView.delegate = self
        albumTableView.dataSource = self
        albumTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(albumTableView)
        
        albumTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        albumTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // Register Cell
        //dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
        albumTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "SampleCell")
        albumTableView.rowHeight = UITableView.automaticDimension
        albumTableView.estimatedRowHeight = 100.0
        
    }
    func showAlertWith(title: String = "", message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) {(_) in
            
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

extension ViewController: NSFetchedResultsControllerDelegate{
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Start Update
        albumTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                albumTableView.insertRows(at: [indexPath], with: .middle)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                albumTableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        default:
            break;
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            albumTableView.insertSections(IndexSet(integer: sectionIndex), with: .middle)
        case .delete:
            albumTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            break;
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // End update
        albumTableView.endUpdates()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStore.sectionCount()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStore.rowsCount(for: section)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath) as! CustomTableViewCell
        
        guard let album = dataStore.itemAt(indexPath: indexPath) else{
            return cell
        }
        cell.titleLabel.text = album.title!
        cell.subTitleLabel.text = album.artist!
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return dataStore.titleForHeaderAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let album = dataStore.itemAt(indexPath: indexPath) else{
            return
        }
        navigator.navigate(to: .second(album: album))
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
}

extension ViewController: NetworkConnectionStatusListener {
    func networkStatusDidChange(status: NetworkConnectionStatus) {
        switch status {
        case .offline:
            showAlertWith(message: "Offline")
        case .online:
            showAlertWith(message: "Online")
        }
    }
}
