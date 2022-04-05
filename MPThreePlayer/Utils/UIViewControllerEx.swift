//
//  UIViewControllerEx.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/07.
//

import UIKit

extension UIViewController {
    func tempFunction() {
        print("temp1")
    }
    
    func showAlert(title: String, message: String, confirmCompletion: (() -> Void)? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let confirmAction = UIAlertAction(
            title: "확인",
            style: .default) { _ in
                confirmCompletion?()
            }
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel,
            handler: nil
        )
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
