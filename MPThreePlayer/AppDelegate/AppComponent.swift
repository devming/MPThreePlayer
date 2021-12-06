//
//  AppComponent.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/06.
//

import Foundation
import ModernRIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
    
}
