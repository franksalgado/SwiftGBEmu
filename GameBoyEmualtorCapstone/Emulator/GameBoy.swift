//
//  GameBoy.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/15/23.
//

import Foundation

class GameBoy {
    var LR35902: CPU?;
    var romData: [U8] = [0];
    init() {
        LR35902 = CPU(GameBoy: self);
    }
    
}

