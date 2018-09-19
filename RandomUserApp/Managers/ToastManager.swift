//
//  ToastManager.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 19/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation
import SwiftEntryKit

struct ToastManager {
    
    /// Show a toast message at the bottom of the screen for 3s
    static func toast(title: String? = nil, message: String, verticalOffset: CGFloat = 20.0) {
        var attributes = EKAttributes.bottomFloat
        attributes.entryBackground = .color(color: UIColor.black.withAlphaComponent(0.8))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .inferred
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = verticalOffset
        attributes.displayDuration = 3
        let title = EKProperty.LabelContent(text: title ?? "", style: .init(font: UIFont.systemFont(ofSize: 22, weight: .medium), color: UIColor.white))
        let description = EKProperty.LabelContent(text: message, style: .init(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: UIColor.white, alignment: .center))
        let simpleMessage = EKSimpleMessage(title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
        
        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
        if #available(iOS 10.0, *) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
    
    private init() {}
    
    private static func errorFeedback() {
        if #available(iOS 10.0, *) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
}
