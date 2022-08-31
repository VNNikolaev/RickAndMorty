//
//  File.swift
//  RickAndMorty
//
//  Created by Васлий Николаев on 29.08.2022.
//

import SwiftUI
import UIKit

struct AppRootView<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> (Content)) {
        self.content = content()
    }

    var body: some View {
        EmptyView()
            .onAppear {
                UIApplication.shared.setHostingController(rootView: content)
            }
    }
}

private extension UIApplication {
    /// Sets the App to start at rootView
    func setHostingController<V: View>(rootView: V) {
        let hostingController = UIHostingController(rootView: rootView)
        extKeyWindow?.rootViewController = hostingController
    }
}

extension UIApplication {
    var extKeyWindow: UIWindow? {
        // Get connected scenes
        UIApplication.shared.connectedScenes
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap { $0 as? UIWindowScene }?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}
