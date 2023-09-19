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
            return 0;
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
            return IORead(address: address);
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
            print("Not yet implmented")
            //cartridge.romData[Int(address)] = value;
        //case 0x8000..<0xA000:
            //PPUStateInstance.vram[Int(address &- 0x8000)] = value;
        case 0xA000..<0xC000:
            print("Not yet implmented")
            //cartridge.CartridgeWrite(value: value, address: address);
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
            IOWrite(address: address, value: value);
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


