//
//  CPU.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/6/23.
//

import Foundation

struct CPURegisters {
    //a is accumulator register, f is flag register
    //register pairs can be combined to be one 16 bit register
    var a: UInt8;
    var f: UInt8;
    
    var b: UInt8;
    var c: UInt8;
    
    var d: UInt8;
    var e: UInt8;
    
    var h: UInt8;
    var l: UInt8;
    
    //stack pointer and progam counter
    var sp: UInt16;
    var pc: UInt16;
    
    mutating func setFlagsRegister(z: UInt8, n: UInt8, h: UInt8, c: UInt8) -> Void {
        let flagsArray: [UInt8] = [z, n, h, c];
        var index: Int = 7;
        for bit in flagsArray {
            if bit == 1 {
                self.f |= (1 << index);
            }
            else if bit == 0 {
                self.f &= ~(1 << index);
            }
            index -= 1;
        }
    }
    
    init() {
        a = 0x01;
        f = 0xB0;
        b = 0b10110000;
        c = 0x13;
        d = 0;
        e = 0xD8;
        h = 0x01;
        l = 0x4d;
        sp = 0xFFFE;
        pc = 0x100;
    }
}

class CPU {
    var registers = CPURegisters();
    var currentOpcode: UInt8;
    var halted: Bool;
    var stepping: Bool;
    var interruptMasterEnable: Bool;
    var enablingIME: Bool;
    var interruptEnableRegister: UInt8;
    var interruptFlags: UInt8;
    let InstructionsTable = GenerateOpcodes();
    func CPUStep() -> Bool{
        if !self.halted {
            self.currentOpcode = BusRead(address: self.registers.pc);
            EmulatorCycles(CPUCycles: 1);
            self.registers.pc += 1;
            //TestRomWrite();
            //TestRomRead();
           // print(self.registersState)
            //print(String(format: "0x%X", self.currentOpcode), self.InstructionsTable[Int(self.currentOpcode)].name)
            self.InstructionsTable[Int(self.currentOpcode)].instructionFunction();
        }
        else {
            EmulatorCycles(CPUCycles: 1);
            if self.interruptFlags != 0 {
                self.halted = false;
            }
        }
        if self.interruptMasterEnable {
            CPUHandleInterrupts();
            self.enablingIME = false;
        }
        if self.enablingIME {
            self.interruptMasterEnable = true;
        }
        return true;
    }
    init(){
        currentOpcode = 0;
        halted = false;
        stepping = false;
        interruptMasterEnable = false;
        enablingIME = false;
        interruptEnableRegister = 0;
        interruptFlags = 0;
    }
}
