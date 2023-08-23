//
//  ViewModelType.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }
}
