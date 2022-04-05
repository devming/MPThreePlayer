//
//  UINavigationEx.swift
//  MPThreePlayer
//
//  Created by devming on 2022/04/05.
//

import Foundation
import UIKit

extension UINavigationController {
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
