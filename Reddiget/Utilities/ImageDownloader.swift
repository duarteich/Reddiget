//
//  ImageService.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 16/04/21.
//

import UIKit

class ImageDownloader {
    
    func downloadImage(url: String, success: @escaping (_ image: UIImage?, _ url: String) -> Void,
                       failure: @escaping (_ error: Error?) -> Void) -> Void {
        
        let imageURL = URL(string: url)!
        
        if let image = ImageDownloadManager.sharedInstance.getImage(forURL: url) {
            success(image, url)
        } else {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if error != nil {
                    failure(error)
                    return
                }
                guard let data = data,
                      let image = UIImage(data: data) else {
                    failure(NSError(domain: "", code: 120, userInfo: ["Reason": "Not able to download image"]))
                    return
                }
                ImageDownloadManager.sharedInstance.setImage(image: image, forKey: url)
                success(image, url)
            }.resume()
        }
    }
}
