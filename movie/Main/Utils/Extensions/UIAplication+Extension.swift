//
//  UIAplication+Extension.swift
//  movie
//
//  Created by Daniel Parra on 4/20/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue
        }
    }
}
