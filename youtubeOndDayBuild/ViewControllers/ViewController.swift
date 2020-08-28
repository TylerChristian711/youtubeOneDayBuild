//
//  ViewController.swift
//  youtubeOndDayBuild
//
//  Created by Lambda_School_Loaner_218 on 8/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set itself to be the dataSource and delegate
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self 
        
        model.getVideoes()
    }

    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        tableView.reloadData()
    }
    
        
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

