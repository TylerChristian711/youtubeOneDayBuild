//
//  ViewController.swift
//  youtubeOndDayBuild
//
//  Created by Lambda_School_Loaner_218 on 8/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideoes()
    }


}

