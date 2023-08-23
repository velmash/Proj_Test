//
//  HasCustomView.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import UIKit

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return customView
    }
}
