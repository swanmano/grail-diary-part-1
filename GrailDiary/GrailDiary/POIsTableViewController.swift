//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Craig Swanson on 9/19/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var pois: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController
                else { fatalError() }
            addPOIVC.delegate = self
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POITableViewCell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }

}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

