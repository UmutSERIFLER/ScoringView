//
//  UIImage+Extension.swift
//  ScoringView
//
//  Created by Umut SERIFLER on 18/01/2021.
//

import UIKit

extension UIImage {
    internal func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
