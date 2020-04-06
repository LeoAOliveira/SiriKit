//
//  SomaHandler.swift
//  IntentExample
//
//  Created by Leonardo Oliveira on 06/04/20.
//  Copyright © 2020 Leonardo Oliveira. All rights reserved.
//

import Foundation
import Intents

public class SomaHandler: NSObject, SomaIntentHandling {
    
    // Handle intent
    public func handle(intent: SomaIntent, completion: @escaping (SomaIntentResponse) -> Void) {
        
        guard let x = intent.x, let y = intent.y else {
            let resposta = SomaIntentResponse(code: .dadosInsuficientes, userActivity: nil)
            completion(resposta)
            return
        }
        
        let xDouble = Double(truncating: x)
        let yDouble = Double(truncating: y)
        let resultado = NSNumber(value: xDouble + yDouble)
        
        let sucesso = SomaIntentResponse.success(resultado: resultado)
        completion(sucesso)
    }
    
    public func resolveX(for intent: SomaIntent, with completion: @escaping (SomaXResolutionResult) -> Void) {
        
        if let x = intent.x {
            let xDouble = Double(truncating: x)
            completion(SomaXResolutionResult.success(with: xDouble))
        } else {
            completion(SomaXResolutionResult.needsValue())
        }
    }
    
    public func resolveY(for intent: SomaIntent, with completion: @escaping (SomaYResolutionResult) -> Void) {
        
        if let y = intent.y {
            let yDouble = Double(truncating: y)
            completion(SomaYResolutionResult.success(with: yDouble))
        } else {
            completion(SomaYResolutionResult.needsValue())
        }
    }
    
}
