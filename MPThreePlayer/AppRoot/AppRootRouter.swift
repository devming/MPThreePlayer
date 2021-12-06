//
//  AppRootRouter.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/06.
//

import ModernRIBs

protocol AppRootInteractable: Interactable {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {

    private let appMain: MainBuildable
    private var appMainRouting: Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        appMain: MainBuildable
    ) {
        self.appMain = appMain
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
