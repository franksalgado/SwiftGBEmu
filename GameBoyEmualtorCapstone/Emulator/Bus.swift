//
//  Bus.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/6/23.
//

import Foundation

extension GameBoy {
    func BusRead(address: U16) -> U8 {
        switch address {
        case 0x0000..<0x8000:
            return self.romData[Int(address)];
        default:
            return 0;
        }
    }
}


