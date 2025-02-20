//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import UIKit

class ImageLoader {
    weak var delegate: ImageLoaderDelegate?
    var completionHandler: ((UIImage?) -> Void)?

    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.completionHandler?(image)
                    if let image = image {
                        self.delegate?.imageLoader(self, didLoad: image)
                    } else {
                        self.delegate?.imageLoader(self, didFailWith: NSError(domain: "ImageLoader", code: -1, userInfo: nil))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.delegate?.imageLoader(self, didFailWith: error)
                }
            }
        }
    }
}
