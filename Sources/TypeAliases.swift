//
//  TypeAliases.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo. All rights reserved.
//


#if os(iOS) || os(tvOS)
    import UIKit
    
    public typealias TextField  = UITextField
    public typealias TextView   = UITextView
#elseif os(macOS)
    import AppKit
    
    public typealias TextField  = NSTextField
    public typealias TextView   = NSTextView
#endif
