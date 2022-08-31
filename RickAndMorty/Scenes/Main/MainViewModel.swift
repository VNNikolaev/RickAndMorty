//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import Foundation

enum TabBarButton {
    case boo
    case planet
    case tv
}

final class MainViewModel: ObservableObject {

    @Published var activeTab: TabBarButton = .boo
    init() {}
}
