//
//  OnboardingView.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        VStack {
            Text("Its onbording view.")
            Spacer()
                .frame(height: 100)
            Button("Go main!") {
                viewModel.openMainView()
            }
        }
        .navigationBarHidden(true)
    }
}
