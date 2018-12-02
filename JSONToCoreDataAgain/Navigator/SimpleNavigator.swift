//
//  SimpleNavigator.swift
//  UIProgramatically
//
//  Created by anoop on 2018-11-28.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import UIKit

class SimpleNavigator: Navigator {

    enum Destination {
        case second(album: AlbumViewModel)
    }
    private weak var navigationController: UINavigationController?

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func navigate(to destination: Destination) {
        let toVC = makeViewController(for: destination)
        self.navigationController?.pushViewController(toVC, animated: true)
    }

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .second(let album):
            return SecondViewController(with: album)
        }
    }
}
