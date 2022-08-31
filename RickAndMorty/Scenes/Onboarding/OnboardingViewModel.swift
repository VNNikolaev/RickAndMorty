//
//  OnboardingViewModel.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    private weak var coordinator: AppCoordinator?

    init(_ coordiator: AppCoordinator?) {
        self.coordinator = coordiator
    }

    func openMainView() {
        coordinator?.openMainView()
    }
}
