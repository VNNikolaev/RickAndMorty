//
//  MainCoordinatorView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import SwiftUI

struct MainCoordinatorView: View {
    @ObservedObject var coordinator: MainCoordinator
    var body: some View {
        NavigationView {
            MainView(viewModel: coordinator.mainViewModel)
        }
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
}
