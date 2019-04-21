//
//  UIFont+Extension.swift
//  movie
//
//  Created by Daniel Parra on 4/20/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func MuliRegular(size: CGFloat) -> UIFont {
        guard let muliRegular = UIFont(name: "Muli-Regular", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        return muliRegular
    }
    
    class func MuliSemibold(size: CGFloat) -> UIFont {
        guard let muliSemibold = UIFont(name: "Muli-SemiBold", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        return muliSemibold
    }
    
    class func MuliExtrabold(size: CGFloat) -> UIFont {
        guard let muliExtrabold = UIFont(name: "Muli-ExtraBold", size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        return muliExtrabold
    }
    
    class func NumpadFont() -> UIFont {
        return UIFont.systemFont(ofSize: 25, weight: .regular)
    }
}
