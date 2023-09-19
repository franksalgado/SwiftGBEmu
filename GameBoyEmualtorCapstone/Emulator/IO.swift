//
//  IO.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/18/23.
//

import Foundation

extension GameBoy {
    func IORead(address: U16) -> U8{
        if address == 0xFF00 {
            //print("reading from joypad", JoypadInstance.JoypadRead())
            //return JoypadInstance.JoypadRead();
        }
        else if address == 0xFF01 {
            return SerialData[0];
        }
        else if address == 0xFF02 {
            return SerialData[1];
        }
        else if address >= 0xFF04 && address <= 0xFF07 {
            return LR35902.timer.TimerRead(address: address);
        }
        else if address == 0xFF0F {
            return LR35902.interruptFlags;
        }
        else if address >= 0xFF10 && address <= 0xFF3F {
            return APU.AudioRead(address: address);
        }
        else if address >= 0xFF40 && address <= 0xFF4B {
            //return LCDRead(address: address);
        }
        print("Invalid IO Read")
        return 0;
    }
    func IOWrite(address: U16, value: U8) {
        if address == 0xFF00 {
            //print("writing to joypad", value)
            //JoypadInstance.JoypadWrite(value: value);
        }
        if address == 0xFF01 {
            SerialData[0] = value;
        }
         if address == 0xFF02 {
            SerialData[1] = value;
        }
         if address >= 0xFF04 && address <= 0xFF07 {
             LR35902.timer.TimerWrite(address: address, value: value);
        }
        if address == 0xFF0F {
             LR35902.interruptFlags = value;
        }
        else if address >= 0xFF10 && address <= 0xFF3F {
            APU.AudioWrite(address: address, value: value);
        }
        if address >= 0xFF40 && address <= 0xFF4B {
            //LCDWrite(address: address, value: value);
        }
    }
}
