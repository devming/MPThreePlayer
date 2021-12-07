//
//  AppRootBuilder.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/06.
//

import ModernRIBs

protocol AppRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppRootComponent: Component<AppRootDependency>, MainDependency {
    var listeningFilesRepository: ListeningFilesRepository

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    init(
        dependency: AppRootDependency,
        repository: ListeningFilesRepository
    ) {
        self.listeningFilesRepository = repository
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {

    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = AppRootComponent(
            dependency: dependency,
            repository: ListeningFilesRepository()
        )
        
        let tabBarController = RootTabBarController()
        
        let interactor = AppRootInteractor(
            presenter: tabBarController
        )
        
        let appMain = MainBuilder(dependency: component)
        
        return AppRootRouter(
            interactor: interactor,
            viewController: tabBarController,
            appMain: appMain
        )
    }
}
