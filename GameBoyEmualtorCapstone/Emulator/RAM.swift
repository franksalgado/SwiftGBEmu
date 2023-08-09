//
//  RAM.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/6/23.
//

import Foundation

struct RAM {
    var workingRAM: [UInt8] = Array<UInt8>(repeating: 0 , count: 0x2000);
    var highRAM: [UInt8] = Array<UInt8>(repeating: 0 , count: 0x80);
    func workingRAMWRead(address: U16) -> U8 {
        let addr = address - 0xC000;
        return workingRAM[Int(addr)] ;
    }
    mutating func workingRAMWrite(address: U16, value: U8) {
        let addr = address - 0xC000;
        highRAM[Int(addr)] = value;
    }
    func highRAMRead(address: U16) -> U8 {
        let addr = address - 0xFF80;
        return highRAM[Int(addr)] ;
    }
    mutating func highRAMWrite(address: U16, value: U8) {
        let addr = address - 0xFF80;
        highRAM[Int(addr)] = value;
    }
    
}
