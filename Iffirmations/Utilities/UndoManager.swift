//
//  UndoManager.swift
//  Iffirmations
//
//  Created by Fares Cherni on 03/03/2023.
//

import Foundation

class StateUndoManager<T> {
    private var states: [T]
    private var currentIndex = 0
    
    init(initialState: T) {
        self.states = [initialState]
    }
    
    var canUndo: Bool {
        return currentIndex > 0
    }
    
    var canRedo: Bool {
        return currentIndex < states.count - 1
    }
    
    var currentState: T {
        return states[currentIndex]
    }
    
    func undo() {
        guard canUndo else { return }
        currentIndex -= 1
    }
    
    func redo() {
        guard canRedo else { return }
        currentIndex += 1
    }
    
    func updateState(_ state: T) {
        states = Array(states[0...currentIndex]) + [state]
        currentIndex += 1
    }
    func reset(initialState: T) {
        self.states = [initialState]
        currentIndex = 0
    }
}
