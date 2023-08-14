//
//  SerialPort.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/8/23.
//

import Foundation

var SerialData: [UInt8] = [UInt8](repeating: 0, count: 2);
var TestRomMessage: [UInt8] = [UInt8](repeating: 0, count: 1024);
var MessageSize: Int = 0;
extension GameBoy {
    func TestRomWrite() -> Void {
        if BusRead(address: 0xFF02) == 0x81 {
            TestRomMessage[MessageSize] = BusRead(address: 0xFF01);
            MessageSize += 1;
            BusWrite(address: 0xFF02, value: 0);
        }
    }
    
    func TestRomRead() -> Void {
        if TestRomMessage[0] != 0 {
            let messageString = String(TestRomMessage.map { Character(UnicodeScalar($0)) });
            
            if messageString.contains("Passed") || messageString.contains("Failed") {
                        print(messageString)
                    }
            //print(messageString);
        }
    }
}
