//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import Foundation

enum ActiveScreen {
    case onboarding
    case splash
    case main
}

final class AppCoordinator: ObservableObject {
    @Published var onboardingViewModel: OnboardingViewModel!
    @Published var mainCoordinator: MainCoordinator!
    @Published var aciveItem: ActiveScreen = .splash
    //TODO: Сохранять и доставать значение из UserDefaults
    var needOnbording: Bool = true

    init() {
        onboardingViewModel = .init(self)
        mainCoordinator = .init()
    }

    func openMainView() {
        aciveItem = .main
    }

    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.needOnbording {
                self.aciveItem = .onboarding
            } else {
                self.aciveItem = .main
            }
        }
    }
}
