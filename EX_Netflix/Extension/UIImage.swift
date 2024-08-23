//
//  UIImage.swift
//  EX_Netflix
//
//  Created by 유영웅 on 8/23/24.
//

import Foundation
import UIKit

extension UIImage {
    func resize(size: CGSize) -> UIImage {
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
