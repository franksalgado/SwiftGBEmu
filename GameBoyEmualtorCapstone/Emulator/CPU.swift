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
    
    var bc: U16 {
        get {
            let lowByte: UInt16 = UInt16(c);
            let highByte: UInt16 = UInt16(b);
            return lowByte | (highByte << 8);
        }
        set {
            c = UInt8(newValue & 0xFF);
            b = UInt8((newValue >> 8) & 0xFF);
        }
    };

    var af: U16 {
        get {
            let lowByte: UInt16 = UInt16(f);
            let highByte: UInt16 = UInt16(a);
            return lowByte | (highByte << 8);
        }
        set {
            f = UInt8(newValue & 0xFF);
            a = UInt8((newValue >> 8) & 0xFF);
        }
    };

    var hl: U16 {
        get {
            let lowByte: UInt16 = UInt16(l);
            let highByte: UInt16 = UInt16(h);
            return lowByte | (highByte << 8);
        }
        set {
            l = UInt8(newValue & 0xFF);
            h = UInt8((newValue >> 8) & 0xFF);
        }
    };

    // GetDERegister - Gets the value of the DE register
    var de: U16 {
        get {
            let lowByte: UInt16 = UInt16(e);
            let highByte: UInt16 = UInt16(d);
            return lowByte | (highByte << 8);
        }
        set {
            e = UInt8(newValue & 0xFF);
            d = UInt8((newValue >> 8) & 0xFF);
        }
    };
    
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
    //var GB: GameBoy = GameBoy();
    var registers = CPURegisters();
    var currentOpcode: UInt8;
    var halted: Bool;
    var stepping: Bool;
    var interruptMasterEnable: Bool;
    var enablingIME: Bool;
    var interruptEnableRegister: UInt8;
    var interruptFlags: UInt8;
    var stack: Stack = Stack()
    let InstructionsTable: [Instruction];
    var GB: GameBoy;
    var totalInstructionClockCycles: Double;
    let clockCycleDuration: Double = 1 / 4194304;
    func CPUStep() -> Bool{
        if !halted {
            currentOpcode = GB.BusRead(address: registers.pc);
            EmulatorCycles(CPUCycles: 1);
            registers.pc += 1;
            //TestRomWrite();
            //TestRomRead();
           // print(self.registersState)
            //print(String(format: "0x%X", self.currentOpcode), self.InstructionsTable[Int(self.currentOpcode)].name)
            InstructionsTable[Int(currentOpcode)].instructionFunction();
            //throttle(startTime: startTime);
        }
        else {
            EmulatorCycles(CPUCycles: 1);
            if interruptFlags != 0 {
                halted = false;
            }
        }
        if interruptMasterEnable {
            //CPUHandleInterrupts();
            enablingIME = false;
        }
        if enablingIME {
            interruptMasterEnable = true;
        }
        return true;
    }
    
    init(GameBoy: GameBoy){
        currentOpcode = 0;
        halted = false;
        stepping = false;
        interruptMasterEnable = false;
        enablingIME = false;
        interruptEnableRegister = 0;
        interruptFlags = 0;
        GB = GameBoy;
        InstructionsTable = GenerateOpcodes();
        totalInstructionClockCycles = 0;
    }
}
