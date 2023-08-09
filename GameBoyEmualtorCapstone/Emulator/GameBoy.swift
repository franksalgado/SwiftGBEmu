//
//  GameBoy.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/15/23.
//

import Foundation

class GameBoy {
    lazy var LR35902: CPU = CPU(GameBoy: self);
    var cartridge: Cartridge;
    var state: GameBoyState = GameBoyState();
    var ram: RAM = RAM();
    init(cartridge: Cartridge) {
        //romData = GetROMData(fileURL: GetFileURL()!)!;
        self.cartridge = cartridge;
    }
    func startGameBoy() {
        while state.running == true {
            if !LR35902.CPUStep() {
                print("cpu step returned false");
                exit(-5);
            }
        }
    }
}

