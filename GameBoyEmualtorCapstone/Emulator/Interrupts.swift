//
//  Interrupts.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/5/23.
//

import Foundation

extension CPU {
    enum InterruptTypes: UInt8 {
    case VBLANK = 1,//bit 1
         LCDSTAT = 2,
         TIMER = 4,
         SERIAL = 8,
         JOYPAD = 16
    }
    
    func InterruptHandle(address: UInt16) -> Void {
        StackPush16Bit(data: registers.pc);
        registers.pc = address;
    }

    func InterruptCheck(address: UInt16, InterruptTypes: InterruptTypes) -> Bool {
        if ((interruptFlags & InterruptTypes.rawValue) != 0) && ((interruptEnableRegister & InterruptTypes.rawValue) != 0) {
            InterruptHandle(address: address);
            interruptFlags &= ~InterruptTypes.rawValue;
            halted = false;
            interruptMasterEnable = false;
            return true;
           }
           
           return false
    }

    func CPUHandleInterrupts() -> Void {
        if InterruptCheck(address: 0x40, InterruptTypes: .VBLANK) {
                
            }
        else if InterruptCheck(address: 0x48, InterruptTypes: .LCDSTAT) {
                
            }
        else if InterruptCheck(address: 0x50, InterruptTypes: .TIMER) {
                
            }
        else if InterruptCheck(address: 0x58, InterruptTypes: .SERIAL) {
                
            }
        else if InterruptCheck(address: 0x60, InterruptTypes: .JOYPAD) {
                
            }
    }

}
