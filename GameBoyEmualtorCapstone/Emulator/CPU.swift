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
    
    func getBCRegister() -> UInt16 {
        let lowByte: UInt16 = UInt16(self.c);
        let highByte: UInt16 = UInt16(self.b);
        return lowByte | (highByte << 8);
    }

    mutating func setBCRegister(value: UInt16) -> Void {
        self.c = UInt8(value & 0xFF);
        self.b = UInt8((value >> 8) & 0xFF);
    }

    // GetAFRegister - Gets the value of the AF register
    func GetAFRegister() -> UInt16 {
        let lowByte: UInt16 = UInt16(self.f);
        let highByte: UInt16 = UInt16(self.a);
        return lowByte | (highByte << 8);
    }

    // SetAFRegister - Sets the value of the AF register
    mutating func SetAFRegister(value: UInt16) -> Void {
        self.f = UInt8(value & 0xFF);
        self.a = UInt8((value >> 8) & 0xFF);
    }

    // GetHLRegister - Gets the value of the HL register
    func GetHLRegister() -> UInt16 {
        let lowByte: UInt16 = UInt16(self.l);
        let highByte: UInt16 = UInt16(self.h);
        return lowByte | (highByte << 8);
    }

    // SetHLRegister - Sets the value of the HL register
    mutating func SetHLRegister(value: UInt16) -> Void {
        self.l = UInt8(value & 0xFF);
        self.h = UInt8(value >> 8);
    }

    // GetDERegister - Gets the value of the DE register
    func GetDERegister() -> UInt16 {
        let lowByte: UInt16 = UInt16(self.e);
        let highByte: UInt16 = UInt16(self.d);
        return lowByte | (highByte << 8);
    }

    // SetDERegister - Sets the value of the DE register
    mutating func SetDERegister(value: UInt16) -> Void {
        self.e = UInt8(value & 0xFF);
        self.d = UInt8((value >> 8) & 0xFF);
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
    //let InstructionsTable = GenerateOpcodes();
    var GB: GameBoy;
    func CPUStep(GameBoy: GameBoy) -> Bool{
        if !halted {
            currentOpcode = GameBoy.BusRead(address: registers.pc);
            EmulatorCycles(CPUCycles: 1);
            registers.pc += 1;
            //TestRomWrite();
            //TestRomRead();
           // print(self.registersState)
            //print(String(format: "0x%X", self.currentOpcode), self.InstructionsTable[Int(self.currentOpcode)].name)
            InstructionsTable[Int(currentOpcode)].instructionFunction();
        }
        else {
            EmulatorCycles(CPUCycles: 1);
            if interruptFlags != 0 {
                halted = false;
            }
        }
        if interruptMasterEnable {
            CPUHandleInterrupts();
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
    }
}
