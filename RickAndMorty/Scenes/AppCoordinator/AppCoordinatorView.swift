//
//  AppCoordinatorView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
       content()
            .onAppear {
                Self.adjustAppearance()
                coordinator.startApp()
            }
    }
}

private extension AppCoordinatorView {
    @ViewBuilder
    func content() -> some View {
        switch coordinator.aciveItem {
        case .splash:
            SplashView()
        case .onboarding:
            OnboardingView(viewModel: coordinator.onboardingViewModel)
        case .main:
            MainCoordinatorView(coordinator: coordinator.mainCoordinator)
        }

    }

    static func adjustAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .gray
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.darkGray
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .red
    }
}
