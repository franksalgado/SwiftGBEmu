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
    func BusWrite(address: U16, value: U8) -> Void {
        switch address {
        case 0x0000..<0x8000:
            self.romData[Int(address)] = value;
        default:
            print("INVALID BUS WRITE")
        }
    }
    
    func BusRead16Bit(address: UInt16) -> UInt16 {
        let lowByte: UInt16 = UInt16(BusRead(address: address));
        let highByte: UInt16 = UInt16(BusRead(address: address + 1));
        return lowByte | (highByte << 8);
    }

    func BusWrite16Bit(address: UInt16, value: UInt16) {
        BusWrite(address: address + 1, value: UInt8(value >> 8));
        BusWrite(address: address, value: UInt8(value & 0xFF));
    }
}


