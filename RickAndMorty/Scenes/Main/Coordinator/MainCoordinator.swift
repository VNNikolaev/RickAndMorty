//
//  MainCoordinator.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import Foundation

final class MainCoordinator: ObservableObject {
    @Published var mainViewModel: MainViewModel!
    init() {
        mainViewModel = .init()
    }
}
