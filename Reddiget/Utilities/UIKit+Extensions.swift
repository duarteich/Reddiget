//
//  UIKit+Extensions.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 16/04/21.
//

import UIKit

extension UIImageView {
    private static var urlStore = [String:String]()

    func setImage(url: String, placeholderImage: UIImage? = nil) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        UIImageView.urlStore[tmpAddress] = url
        
        if let image = placeholderImage {
            self.image = image
        } else{
            self.backgroundColor = .gray
        }
        
        ImageDownloader().downloadImage(url: url, success: { (image, url) in
            DispatchQueue.main.async {
            if UIImageView.urlStore[tmpAddress] == url {
                        self.image = image
                        self.backgroundColor = .clear
                    }
            }
        }) { error in
        }
    }
}
