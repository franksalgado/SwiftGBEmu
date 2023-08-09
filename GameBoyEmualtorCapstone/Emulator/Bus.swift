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
            return cartridge.romData[Int(address)];
        //case 0x8000..<0xA000:
                //return PPUStateInstance.vram[Int(address) - 0x8000];
        case 0xA000..<0xC000:
            return cartridge.romData[Int(address)];
        case 0xC000..<0xE000:
            return ram.workingRAMWRead(address: address);
        case 0xE000..<0xFE00:
            //implement
            break;
        /*
        case 0xFE00..<0xFEA0:
            // ppu
            
            if DMATransferring() {
                return 0xFF;
            }
            return PPUOAMread(address: address);
             */
        case 0xFEA0..<0xFF00:
            //unusable
            break
        case 0xFF00..<0xFF80:
            if address == 0xFF00 {
                //print("reading from joypad", JoypadInstance.JoypadRead())
                //return JoypadInstance.JoypadRead();
            }
            if address == 0xFF01 {
                return SerialData[0];
            }
            if address == 0xFF02 {
                return SerialData[1];
            }
            if address >= 0xFF04 && address <= 0xFF07 {
                return LR35902.timer.TimerRead(address: address);
            }
            if address == 0xFF0F {
                return LR35902.interruptFlags;
            }
            if address >= 0xFF40 && address <= 0xFF4B {
                //return LCDRead(address: address);
            }
            print("Invalid IO Read")
            return 0;
        case 0xFF80..<0xFFFF:
            return ram.highRAMRead(address: address);
        case 0xFFFF:
            return LR35902.interruptEnableRegister
        default:
            return 0;
        }
        return 0;
    }
    func BusWrite(address: U16, value: U8) -> Void {
        switch address {
        case 0x0000..<0x8000:
            cartridge.romData[Int(address)] = value;
        //case 0x8000..<0xA000:
            //PPUStateInstance.vram[Int(address &- 0x8000)] = value;
        case 0xA000..<0xC000:
            cartridge.CartridgeWrite(value: value, address: address);
        case 0xC000..<0xE000:
            ram.workingRAM[Int(address &- 0xC000)] = value;
        case 0xE000..<0xFE00:
            // implement
            break;
        //case 0xFE00..<0xFEA0:
            // ppu
           // if DMATransferring() {
             //   return;
            //}
           // PPUOAMWrite(address: address, value: value);
        case 0xFEA0..<0xFF00:
            // unusable
            break;
       case 0xFF00..<0xFF80:
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
            if address >= 0xFF40 && address <= 0xFF4B {
                //LCDWrite(address: address, value: value);
            }
        case 0xFF80..<0xFFFF:
            ram.highRAM[Int(address &- 0xFF80)] = value;
        case 0xFFFF:
            LR35902.interruptEnableRegister = value;
        default:
            break;
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


