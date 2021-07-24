//
//  Unimplemented.swift
//  GitHubApp
//
//  Created by Blake McAnally on 7/24/21.
//

import UIKit

/// Shows an alert that informs the user the functionality they are trying to
/// use isn't implemented
/// - Parameter viewController: the viewController to show the alert on
@available(*, deprecated, message: "You should probably build this at some point. 😃")
func unimplemented(_ viewController: UIViewController) {
    let alert = UIAlertController(
        title: "Work In Progress",
        message: "This is not yet implemented.",
        preferredStyle: .alert
    )
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)
}
