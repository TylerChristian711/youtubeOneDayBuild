//
//  Model.swift
//  youtubeOndDayBuild
//
//  Created by Lambda_School_Loaner_218 on 8/26/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation


protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideoes() {
        // create URL object
        guard let url = URL(string: Constants.API_URL) else { return }
        
        // get a URLSession Object
        let session = URLSession.shared
        
        // Get a data task from the URLSession
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            // check if there are any errors
            if error != nil || data == nil {
                return
            }
            // parsing the data into video objects
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                // call the "videosFetched method of the deleagate
                if response.items != nil  {
                    DispatchQueue.main.async {
                         self.delegate?.videosFetched(response.items!)
                    }
                }
                //dump(response)
            } catch {
                
            }
            
        }
        
        // kick off the task
        dataTask.resume()
    }
    
}
