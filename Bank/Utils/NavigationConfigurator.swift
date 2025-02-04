//
//  NavigationConfigurator.swift
//  Bank
//
//  Created by Ronald Muñoz on 2/1/25.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UINavigationController {
        UINavigationController()
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        configure(uiViewController)
    }
}

extension View {
    func configureNavigationBar(configure: @escaping (UINavigationController) -> Void = { _ in }) -> some View {
        self.background(NavigationConfigurator(configure: configure))
    }
}
