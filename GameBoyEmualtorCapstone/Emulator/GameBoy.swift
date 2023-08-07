//
//  GameBoy.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/15/23.
//

import Foundation

class GameBoy {
    lazy var LR35902: CPU = CPU(GameBoy: self);
    var romData: [U8]?;
    var state: GameBoyState = GameBoyState();
    init() {
        romData = GetROMData(fileURL: GetFileURL()!)
    }
    
}

