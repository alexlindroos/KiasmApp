//
//  IconChanger.swift
//  Kiasmapp
//
//  Created by iosdev on 15.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation

class IconChanger{
    
    var iconState: Bool = false
    
   func changeIconToVisited(){
    iconState = true
        }
    
    func tellState() -> Bool {
        return iconState
    }
    
}