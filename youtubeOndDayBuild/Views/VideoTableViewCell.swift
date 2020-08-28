//
//  VideoTableViewCell.swift
//  youtubeOndDayBuild
//
//  Created by Lambda_School_Loaner_218 on 8/28/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    func setCell(_ v:Video) {
        self.video = v
        
        guard self.video != nil else { return }
        
        // set title and date
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else { return }
        
        // Check Cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            // set the thumbnail imageview
            self.thumbNailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // download thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        // create dataTask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                // check that the downloaded url matches the video thumbnail URl that this cell is set to display
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                
                if url?.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail
                    return
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbNailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }
    
}
