//
//  MainView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack(spacing: .zero) {
            TabView(selection: $viewModel.activeTab) {
                CharacterView()
                    .tag(TabBarButton.boo)
                LocationView()
                    .tag(TabBarButton.planet)
                EpisodeView()
                    .tag(TabBarButton.tv)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            tabBarButtons
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

private extension MainView {
    var tabBarButtons: some View {
        HStack {
            Spacer()
            BooButtonView(selected: $viewModel.activeTab)
            Spacer()
            PlanetButtonView(selected: $viewModel.activeTab)
            Spacer()
            TVButtonView(selected: $viewModel.activeTab)
            Spacer()
        }
        .padding(.bottom, 24)
        .padding(.top, 5)
        .background {
            Color(uiColor: UIColor.darkGray)
        }
    }
}
