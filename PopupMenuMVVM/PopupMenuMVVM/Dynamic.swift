//
//  Dynamic.swift
//  PopupMenuMVVM
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import Foundation


class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
}
