//
//  CPUInstructions.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/17/23.
//

import Foundation
extension CPU {
    struct Instruction {
        var name: String;
        //Void function cooresponding to the instruction
        var instructionFunction: (()->Void);
    }
    
    func GenerateOpcodes() -> [Instruction] {
        var table = Array(repeating: Instruction(name: "Empty Spot", instructionFunction: EmptySpot), count: 0x100);
        table[0x00] = Instruction(name: "NOP", instructionFunction: EmptySpot);
        table[0x01] = Instruction(name: "LD_BC_D16", instructionFunction: LD_16R_d16(register: self.registers.setBCRegister(value:), value: FetchD16() ));
        return table;
        
    }
    
    func FetchD16() -> UInt16 {
        let lowByte: UInt16 = UInt16(BusRead(address: self.registers.pc));
        let highByte: UInt16 = UInt16(BusRead(address: self.registers.pc + 1));
        EmulatorCycles(CPUCycles: 2);
        self.registers.pc += 2;
        return lowByte | (highByte << 8);
    }
    
    //used to initialize the instruction table and fill in spots that are not used
    func EmptySpot() -> Void {
        print("illegal instruc 😳\n");
    }
    
    // Performs no operation 0x00
    func NOP() -> Void {}
    
    //0x01 0x11 0x21 0x31
    func LD_16R_d16(register: ((U16)->Void),  value: U16) -> Void {
        register(value);
    }
    
    //0x02 0x12 0x22 0x32
    func LD_ADDR_r(address: U16, value: U8) -> Void {
        BusWrite(address: address, value: value);
        EmulatorCycles(CPUCycles: 1);
        if  self.currentOpcode == 0x22 {
            let value = self.registers.GetHLRegister() &+ 1;
            self.registers.SetHLRegister(value: value);
        }
        else if self.currentOpcode == 0x32 {
            let value = self.registers.GetHLRegister() &- 1;
            self.registers.SetHLRegister(value: value);
        }
        else if self.currentOpcode == 0x36 {
            EmulatorCycles(CPUCycles: 1);
        }
    }
    
    //0x10
    func STOP_0() -> Void {
        print("stop instruction executed");
    }
    
    //0x03 0x13 0x23 0x33
    func INC_16R(registerValue: U16, setRegister: ((U16)->Void)?) {
        if setRegister != nil {
            setRegister!(registerValue &+ 1);
        } else {
            self.registers.sp = registerValue &+ 1;
        }
    }
    
    func INC_R(register: inout U8) {
        register &+= 1;
        self.registers.setFlagsRegister(
            z: (register == 0 ? 1 : 0),
            n: 0,
            h: (register & 0x0F == 0 ? 1 : 0),
            c: 2
        );
    }
    
    func DEC_R(register: inout U8) {
        register &+= 1;
        self.registers.setFlagsRegister(
            z: (register == 0 ? 1 : 0),
            n: 1,
            h: (register & 0x0F == 0 ? 1 : 0),
            c: 2
        );
    }
    
    //0x20 0x30 0x18 28 38
    func JR_COND_r8(condition: Bool) {
        let fetchedData = Int8(bitPattern: BusRead(address: self.registers.pc));
        self.registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
        if condition {
            self.registers.pc = UInt16(truncatingIfNeeded: Int(self.registers.pc) + Int(fetchedData));
            EmulatorCycles(CPUCycles: 1);
        }
    }
    
    //0x37 Set carry flag
    func SCF() -> Void {
        self.registers.setFlagsRegister(z: 2, n: 0, h: 0, c: 1);
    }
    
    
    //07
    func RLCA(direction: String) {
        let carryFlagVal: UInt8 = ( self.registers.a & (1 << 7) == (1 << 7) ? 1 : 0);
        
        CPUStateInstance.registers.a <<= 1;
        CPUStateInstance.registers.a |= carryFlagVal;
        SetFlagsRegister(z: 0, n: 0, h: 0, c: carryFlagVal);
    }
    
    func LD_R_R(registerOne: inout U8,value: U8) {
        registerOne = value;
    }
    
    func ADDHL_16R(register: UInt16) -> Void {
        let value: UInt16 = self.registers.GetHLRegister() &+ register;
        EmulatorCycles(CPUCycles: 1);
        self.registers.SetHLRegister(value: value);
        self.registers.setFlagsRegister(
            z: 2,
            n: 0,
            h: ( (self.registers.GetHLRegister() & 0xFFF) + (register & 0xFFF) >= 0x1000 ? 1 : 0),
            c: (UInt32(self.registers.GetHLRegister()) + UInt32(register) >= 0x10000 ? 1 : 0)
        );
    }
    
    func XOR_R(register: UInt8) -> Void {
        self.registers.a ^= register;
        if self.currentOpcode == 0xAE {
            EmulatorCycles(CPUCycles: 1);
        }
        self.registers.setFlagsRegister(
            z: IsZero(value: self.registers.a),
            n: 0,
            h: 0,
            c: 0
        );
    }
    
    func OR_R(register: UInt8) -> Void {
        self.registers.a |= register;
        if self.currentOpcode == 0xAE {
            EmulatorCycles(CPUCycles: 1);
        }
        self.registers.setFlagsRegister(
            z: IsZero(value: self.registers.a),
            n: 0,
            h: 0,
            c: 0
        );
    }
    
    func CP_R(value: U8) -> Void {
        self.registers.setFlagsRegister(
            z: IsZero(value: (Int(self.registers.a) - Int(value) == 0 ? 1 : 0) ),
            n: 1,
            h: ( (Int(self.registers.a & 0x0F) - Int(value & 0x0F)) < 0x0 ? 1 : 0 ),
            c: ( (Int(self.registers.a) - Int(value)) < 0 ? 1 : 0 )
        );
    }
    
    func CALL_COND_a16(condition: Bool) {
        if condition {
            let fetchedD16 = FetchD16();
            //EmulatorCycles(CPUCycles: 2);
            StackPush16Bit(data: self.registers.pc);
            self.registers.pc = fetchedD16;
            EmulatorCycles(CPUCycles: 1);
        }
        else {
            EmulatorCycles(CPUCycles: 2);
            self.registers.pc += 2;
        }
    }
    //0xC7, 0xD7, 0xE7, 0xF7, 0xCF, 0xDF, 0xEF, 0xFF,
    func RST_n_H(address: UInt16) -> Void {
        StackPush16Bit(data: self.registers.pc);
        self.registers.pc = address;
        EmulatorCycles(CPUCycles: 3);
    }
    
    func ADD_A_R(value: U8) {
        let halfCarry: UInt8 = (
            ((self.registers.a & 0xF) + (self.registers.b & 0xF)) >= 0x10 ? 1 : 0 );
        let carryFlag: UInt8 = (
            (Int(self.registers.a & 0xFF) + Int(self.registers.b & 0xFF)) >= 0x100 ? 1 : 0);
        self.registers.a &+= value;
        self.registers.setFlagsRegister(z: IsZero(value: self.registers.a) , n: 0, h: halfCarry, c: carryFlag);
    }
    
    
    func ADC_A_R(register: UInt8) -> Void {
        var carryFlagVal: UInt8 = 1;
        if  !isBitSet(bitPosition: CFlag, in: self.registers.f) {
            carryFlagVal = 0;
        }
        if self.currentOpcode == 0x8E {
            EmulatorCycles(CPUCycles: 1);
        }
        self.registers.a &+=  register &+ carryFlagVal;
        self.registers.setFlagsRegister(
            z: IsZero(value: self.registers.a),
            n: 0,
            h: ( (self.registers.a & 0xF) + (register & 0xF) + carryFlagVal > 0xF ? 1 : 0),
            c: ( (Int(self.registers.a) + Int(register) + Int(carryFlagVal))  > 0xFF ? 1 : 0 )
        );
    }
    
    // 0xA0 - 0xA5
    //add extra cpu cyc for d8
    func AND_R(value: U8) {
        self.registers.a &= value;
        self.registers.f = (self.registers.a == 0 ? 0b10100000 : 0b00100000);
        if self.currentOpcode == 0xE6 {
            EmulatorCycles(CPUCycles: 1);
            self.registers.pc += 1;
        }
    }
    
    //0xF3
    func DI() -> Void { self.interruptMasterEnable = false; }
    
    //FB
    func EI() -> Void { self.enablingIME = true; }
    
    func RET_COND(conditon: Bool)
    
}

