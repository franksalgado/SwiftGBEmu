//
//  Timer.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/28/23.
//

import Foundation

struct Timer {
    var DIV: U16 = 0xAC00;
    var TIMA: U8 = 0;
    var TMA: U8 = 0;
    var TAC: U8 = 0
    var divCount: U16 = 0;
    mutating func timerTick() {
        divCount &+= 1;
        if divCount == 256 {
            DIV &+= 1;
            divCount = 0;
        }
        
        
    }
}


