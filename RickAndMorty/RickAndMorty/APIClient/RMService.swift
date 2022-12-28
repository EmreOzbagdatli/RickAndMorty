//
//  RMService.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 28.12.2022.
//

import Foundation

final class RMService {
    static let share = RMService()
        
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping ()-> Void){
        
    }
    
}
