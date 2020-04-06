//
//  IntentHandler.swift
//  IntentExample
//
//  Created by Leonardo Oliveira on 06/04/20.
//  Copyright © 2020 Leonardo Oliveira. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        // Quer saber quem lida com o Intent detectado
        return SomaHandler()
    }
}
