//
//  AlphabeticValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  The `AlphabeticValidator` contains an `AlphabeticCondition`. A valid string only contains letters.
 *  - seealso: `AlphabeticCondition`
 */
public struct AlphabeticValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers

    public init(allowsWhitespace: Bool) {
        conditions = [AlphabeticCondition(allowsWhiteSpace: allowsWhitespace)]
    }
    
}