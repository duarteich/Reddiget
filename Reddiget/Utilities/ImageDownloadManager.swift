//
//  ImageDownloadManager.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 16/04/21.
//

import UIKit

class ImageDownloadManager: NSObject {
    
    static let sharedInstance = ImageDownloadManager()
    var imageCache: NSCache<NSString, UIImage>
    
    override init() {
        self.imageCache = NSCache()
    }
    
    func getImage(forURL url: String) -> UIImage? {
        return self.imageCache.object(forKey: url as NSString)
    }
    
    func setImage(image: UIImage, forKey url: String) {
        self.imageCache.setObject(image, forKey: url as NSString)
    }
}
