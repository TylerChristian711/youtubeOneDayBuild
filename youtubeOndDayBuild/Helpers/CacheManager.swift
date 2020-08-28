//
//  CacheManager.swift
//  youtubeOndDayBuild
//
//  Created by Lambda_School_Loaner_218 on 8/28/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data: Data?) {
        // store image data and use the url as the key 
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
}
