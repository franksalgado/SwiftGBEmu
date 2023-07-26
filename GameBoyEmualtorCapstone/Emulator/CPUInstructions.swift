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
        table[0x01] = Instruction(name: "LD_BC_D16", instructionFunction: {self.LD_16R_d16(register: self.registers.setBCRegister(value:), value: self.FetchD16() )} );
        table[0x02] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x03] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x04] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x05] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x06] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x07] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x08] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x09] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x0F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x10] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x11] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x12] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x13] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x14] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x15] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x16] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x17] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x18] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x19] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x1F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x20] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x21] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x22] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x23] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x24] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x25] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x26] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x27] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x28] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x29] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x2F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x30] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x31] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x32] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x33] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x34] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x35] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x36] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x37] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x38] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x39] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x3F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x40] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x41] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x42] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x43] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x44] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x45] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x46] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x47] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x48] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x49] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x4F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x50] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x51] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x52] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x53] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x54] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x55] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x56] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x57] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x58] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x59] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x5F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x60] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x61] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x62] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x63] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x64] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x65] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x66] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x67] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x68] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x69] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x6F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x70] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x71] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x72] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x73] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x74] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x75] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x76] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x77] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x78] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x79] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x7F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x80] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x81] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x82] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x83] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x84] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x85] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x86] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x87] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x88] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x89] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x8F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x90] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x91] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x92] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x93] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x94] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x95] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x96] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x97] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x98] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x99] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9A] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9B] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9C] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9D] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9E] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0x9F] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xA9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAB] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAD] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xAF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xB9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBB] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBD] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xBF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xC9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xCA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xCB] = Instruction(name: "PREFIX CB", instructionFunction: PREFIXCB);
        table[0xCC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xCD] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xCE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xCF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xD9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDB] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDD] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xDF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xE9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xEA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xEB] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xEC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xED] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xEE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xEF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF0] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF1] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF2] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF3] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF4] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF5] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF6] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF7] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF8] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xF9] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFA] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFB] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFC] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFD] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFE] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        table[0xFF] = Instruction(name: <#T##String#>, instructionFunction: <#T##(() -> Void)##(() -> Void)##() -> Void#>);
        return table;
    }
    
    func FetchD16() -> UInt16 {
        let lowByte: UInt16 = UInt16(GB.BusRead(address: registers.pc));
        let highByte: UInt16 = UInt16(GB.BusRead(address: registers.pc + 1));
        EmulatorCycles(CPUCycles: 2);
        registers.pc += 2;
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
        if currentOpcode == 0xF8 {
            registers.pc += 1;
            register(UInt16(truncatingIfNeeded: Int(Int8(bitPattern: U8(value) ) ) + Int(registers.sp)));
                     registers.setFlagsRegister(
                        z: 0,
                        n: 0,
                        h: ( (registers.sp & 0xF) + UInt16(value & 0xF) >= 0x10 ? 1 : 0),
                        c: ( UInt16(registers.sp & 0xFF) + UInt16(value & 0xFF) >= 0x100 ? 1 : 0)
                     );
            EmulatorCycles(CPUCycles: 2);
            return;
        }
        register(value);
    }
    
    //0x02 0x12 0x22 0x32
    func LD_ADDR_r(address: U16, value: U8) -> Void {
        GB.BusWrite(address: address, value: value);
        EmulatorCycles(CPUCycles: 1);
        if  currentOpcode == 0x22 {
            registers.SetHLRegister(value: address &+ 1);
        }
        else if currentOpcode == 0x32 {
            registers.SetHLRegister(value: address &- 1);
        }
        else if currentOpcode == 0x36 {
            registers.pc += 1;
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
            EmulatorCycles(1);
        } else {
            registers.sp = registerValue &+ 1;
            EmulatorCycles(1);
        }
    }
    
    func INC_ADDR_HL() -> Void {
        let value: UInt8 = GB.BusRead(address: registers.GetHLRegister()) &+ 1;
        GB.BusWrite(address: registers.GetHLRegister(), value: value);
        var halfCarry: UInt8 = 0;
        if value & 0x0F == 0 {
            halfCarry = 1;
        }
        SetFlagsRegister(z: IsValueEqualToZero(value: value) , n: 0, h: halfCarry, c: 2);
        EmulatorCycles(CPUCycles: 2);
    }
    
    func DAA() -> Void {
        var u: UInt8 = 0
        var carryFlag: UInt8 = 0;
        if isBitSet(bitPosition: registers.f, in: HFlag) || (!isBitSet(bitPosition: registers.f, in: NFlag) && (registers.a & 0xF) > 9) {
                u = 6;
        }

        if isBitSet(bitPosition: registers.f, in: CFlag) || (!isBitSet(bitPosition: registers.f, in: NFlag) && registers.a > 0x99) {
            u |= 0x60;
            carryFlag = 1;
        }
        if isBitSet(bitPosition: registers.f, in: NFlag) {
            registers.a =  registers.a &- u;
        }
        else {
            registers.a &+= u;
        }
        registers.setFlagsRegister(
            z: IsZero(value: registers.a),
            n: 2,
            h: 0,
            c: carryFlag
        );
    }
    
    func LDa16SP() -> Void {
        BusWrite16Bit(address: FetchD16(), value: CPUStateInstance.registersState.sp);
        EmulatorCycles(CPUCycles: 2);
    }
    
    func DEC_16R(registerValue: U16, setRegister: ((U16)->Void)?) {
        if setRegister != nil {
            setRegister!(registerValue &- 1);
        } else {
            registers.sp = registerValue &- 1;
        }
    }
    
    func INC_R(register: inout U8) {
        register &+= 1;
        registers.setFlagsRegister(
            z: (register == 0 ? 1 : 0),
            n: 0,
            h: (register & 0x0F == 0 ? 1 : 0),
            c: 2
        );
    }
    
    func DEC_R(register: inout U8) {
        register &+= 1;
        registers.setFlagsRegister(
            z: (register == 0 ? 1 : 0),
            n: 1,
            h: (register & 0x0F == 0 ? 1 : 0),
            c: 2
        );
    }
    
    func RLA() -> Void {
        let carryFlag: UInt8 = (isBitSet(bitPosition: 7, in: registers.a) ? 1 : 0);
        registers.a <<= 1;
        if isBitSet(bitPosition: registers.f, in: CFlag) { registers.a |= 1; }
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlag);
    }
    
    func RRA() -> Void {
        let carryFlag: UInt8 = registers.a & 1;
        registers.a >>= 1;
        if isBitSet(bitPosition: registers.f, in: CFlag) { registers.a |= (1 << 7); }
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlag);
    }
    
    //0x20 0x30 0x18 28 38
    func JR_COND_r8(condition: Bool) {
        let fetchedData = Int8(bitPattern: GB.BusRead(address: registers.pc));
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
        if condition {
            registers.pc = UInt16(truncatingIfNeeded: Int(registers.pc) + Int(fetchedData));
            EmulatorCycles(CPUCycles: 1);
        }
    }
    
    //0x37 Set carry flag
    func SCF() -> Void {
        registers.setFlagsRegister(z: 2, n: 0, h: 0, c: 1);
    }
    
    //07
    func RLCA(direction: String) {
        let carryFlagVal: UInt8 = ( registers.a & (1 << 7) == (1 << 7) ? 1 : 0);
        registers.a <<= 1;
        registers.a |= carryFlagVal;
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlagVal);
    }
    
    func LD_R_R(registerOne: inout U8, value: U8, specialCase: Bool) {
        registerOne = value;
        if !specialCase { return; }
        else if currentOpcode & 0x06 == 0x06 && currentOpcode <= 0x26 ||
            currentOpcode & 0x0E == 0x0E && currentOpcode <= 0x3E {
            registers.pc += 1;
            EmuatorCycles(1);
        }
        else if currentOpcode & 0x06 == 0x06 && currentOpcode >= 0x46 ||
                currentOpcode & 0x0E == 0x0E && currentOpcode >= 0x4E ||
                currentOpcode == 0x0A || currentOpcode == 0x1A{
                EmuatorCycles(1);
        }
        else if currentOpcode == 0x2A {
            EmuatorCycles(1);
            let value = registers.GetHLRegister() &+ 1;
            registers.SetHLRegister(value: value);
        }
        else if currentOpcode == 0x3A {
            EmuatorCycles(1);
            let value = registers.GetHLRegister() &- 1;
            registers.SetHLRegister(value: value);
        }
        else if currentOpcode == 0xF2 {
            emulatorcycles(1);
            registers.pc += 1;
        }
        else if currentOpcode == 0xFA { EmulatorCycles(1); }
    }
    
    func ADDHL_16R(register: UInt16) -> Void {
        let value: UInt16 = registers.GetHLRegister() &+ register;
        EmulatorCycles(CPUCycles: 1);
        registers.SetHLRegister(value: value);
        registers.setFlagsRegister(
            z: 2,
            n: 0,
            h: ( (registers.GetHLRegister() & 0xFFF) + (register & 0xFFF) >= 0x1000 ? 1 : 0),
            c: (UInt32(registers.GetHLRegister()) + UInt32(register) >= 0x10000 ? 1 : 0)
        );
    }
    
    func XOR_R(register: UInt8) -> Void {
        registers.a ^= register;
        if currentOpcode == 0xAE {
            EmulatorCycles(CPUCycles: 1);
        }
        if currentOpcode == 0xEE {
            registers.pc += 1;
            EmulatorCycles(1);
        }
        registers.setFlagsRegister(
            z: IsZero(value: registers.a),
            n: 0,
            h: 0,
            c: 0
        );
    }
    
    func OR_R(register: UInt8) -> Void {
        registers.a |= register;
        if currentOpcode == 0xAE {
            EmulatorCycles(CPUCycles: 1);
        }
        registers.setFlagsRegister(
            z: IsZero(value: registers.a),
            n: 0,
            h: 0,
            c: 0
        );
    }
    
    func CP_R(value: U8) -> Void {
        if currentOpcode == 0xFE {
            registers.pc += 1;
            EmulatorCycles(1);
        }
        registers.setFlagsRegister(
            z: IsZero(value: (Int(registers.a) - Int(value) == 0 ? 1 : 0) ),
            n: 1,
            h: ( (Int(registers.a & 0x0F) - Int(value & 0x0F)) < 0x0 ? 1 : 0 ),
            c: ( (Int(registers.a) - Int(value)) < 0 ? 1 : 0 )
        );
    }
    
    func CALL_COND_a16(condition: Bool) {
        if condition {
            let fetchedD16 = FetchD16();
            EmulatorCycles(CPUCycles: 2);
            stack.StackPush16Bit(data: registers.pc);
            registers.pc = fetchedD16;
            EmulatorCycles(CPUCycles: 1);
        }
        else {
            EmulatorCycles(CPUCycles: 2);
            registers.pc += 2;
        }
    }
    //0xC7, 0xD7, 0xE7, 0xF7, 0xCF, 0xDF, 0xEF, 0xFF,
    func RST_n_H(address: UInt16) -> Void {
        stack.StackPush16Bit(data: registers.pc);
        registers.pc = address;
        EmulatorCycles(CPUCycles: 3);
    }
    
    func ADD_A_R(value: U8) {
        let halfCarry: UInt8 = (
            ((registers.a & 0xF) + (registers.b & 0xF)) >= 0x10 ? 1 : 0 );
        let carryFlag: UInt8 = (
            (Int(registers.a & 0xFF) + Int(registers.b & 0xFF)) >= 0x100 ? 1 : 0);
        registers.a &+= value;
        registers.setFlagsRegister(z: IsZero(value: registers.a) , n: 0, h: halfCarry, c: carryFlag);
    }
    
    
    func ADC_A_R(register: UInt8) -> Void {
        var carryFlagVal: UInt8 = (!isBitSet(bitPosition: CFlag, in: registers.f) ? 0 : 1);
        let halfCarry: U8 = ( (registers.a & 0xF) + (register & 0xF) + carryFlagVal > 0xF ? 1 : 0);
        let carryFlag: U8 = ( (Int(registers.a) + Int(register) + Int(carryFlagVal))  > 0xFF ? 1 : 0 );
        if currentOpcode == 0x8E {
            EmulatorCycles(CPUCycles: 1);
        }
        registers.a &+=  register &+ carryFlagVal;
        if currentOpcode == 0xCE {
            registers.pc += 1;
            EmulatorCycles(1);
        }
        registers.setFlagsRegister(z: IsZero(value: registers.a), n: 0, h: halfCarry, c: carryFlag);
    }
    
    // 0xA0 - 0xA5
    //add extra cpu cyc for d8
    func AND_R(value: U8) {
        registers.a &= value;
        registers.f = (registers.a == 0 ? 0b10100000 : 0b00100000);
        if currentOpcode == 0xE6 {
            EmulatorCycles(CPUCycles: 1);
            registers.pc += 1;
        }
    }
    
    //0xF3
    func DI() -> Void { interruptMasterEnable = false; }
    
    //FB
    func EI() -> Void { enablingIME = true; }
    
    func RET_COND(conditon: Bool) {
        if conditon {
            EmulatorCycles(CPUCycles: 3);
            registers.pc = stack.StackPop16Bit();
        }
        if currentOpcode == 0xD9 {
            interruptMasterEnable = true;
        }
        EmulatorCycles(CPUCycles: 1);
    }
    func JP_COND_a16(condition: Bool) {
        if condition {
            registers.pc = FetchD16();
        }
        else if currentOpcode == 0xE9 {
            registers.pc = registers.GetHLRegister();
        }
        else {
            EmulatorCycles(CPUCycles: 2);
            registers.pc += 2;
        }
    }
    
    func SUB_R(value: U8) {
        if currentOpcode == 0x96 {
            EmulatorCycles(1);
        }
        let a = registers.a;
        registers.a &-= value;
        registers.setFlagsRegister(
            z: IsZero(value: registers.a),
            n: 1,
            h: ( (Int(a & 0xF) - Int(value & 0xF)) < 0x0 ? 1 : 0 ),
            c: ( (Int(a) - Int(value)) < 0 ? 1 : 0 )
        );
    }
    
    func SBCA_R(register: UInt8) -> Void {
        var halfCarry: UInt8 = 0;
        var carryFlag: UInt8 = 0;
        let carryFlagVal: UInt8 = (isBitSet(bitPosition: registers.f, in: CFlag) ? 1 : 0);
        if (Int(registers.a & 0xF) - Int(register & 0xF) - Int(carryFlagVal)) < 0x0 {
            halfCarry = 1;
        }
        if (Int(registers.a) - Int(register) - Int(carryFlagVal)) < 0x0 {
            carryFlag = 1;
        }
        registers.a &-=  register &+ carryFlagVal;
        if currentOpcode == 0x9E { EmulatorCycles(CPUCycles: 1); }
        if currentOpcode == 0xDE {
            registers.pc += 1;
            EmulatorCycles(1);
        }
        registers.setFlagsRegister(z: IsZero(value: registers.a), n: 1, h: halfCarry, c: carryFlag);
    }
    
    //CB instruction table functions
    func GetRegisterValueCB(register: String) -> UInt8 {
            switch register {
                case "b":
                    return registers.b;
                case "c":
                    return registers.c;
                case "d":
                    return registers.d;
                case "e":
                    return registers.e;
                case "h":
                    return registers.h;
                case "l":
                    return registers.l;
                case "(hl)":
                return GB.BusRead(address: registers.GetHLRegister());
                case "a":
                    return registers.a;
                default:
                    print("Invalid");
                    exit(-5);
            }
        }

        func SetRegisterValueCB(register: String, value: UInt8) -> Void {
            switch register {
            case "b":
                registers.b = value;
            case "c":
                registers.c = value;
            case "d":
                registers.d = value;
            case "e":
                registers.e = value;
            case "h":
                registers.h = value;
            case "l":
                registers.l = value;
            case "(hl)":
                GB.BusWrite(address: registers.GetHLRegister(), value: value);
            default:
                registers.a = value;
            }
        }

    func RLCCB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & (1 << 7) == (1 << 7) {
            carryFlag = 1;
        }
        value <<= 1;
        value |= carryFlag;
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func RRCCB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & 1 == 1 {
            carryFlag = 1;
        }
        value >>= 1;
        value |= (carryFlag << 7);
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func RLCB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & (1 << 7) == (1 << 7) {
            carryFlag = 1;
        }
        value <<= 1;
        if isBitSet(bitPosition: CFlag, in: registers.f) {
            value |= 1;
        }
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func RRCB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & 1 == 1 {
            carryFlag = 1;
        }
        value >>= 1;
        if isBitSet(bitPosition: CFlag, in: registers.f) {
            value |= (1 << 7);
        }
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func SLACB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & (1 << 7) == (1 << 7) {
            carryFlag = 1;
        }
        value <<= 1;
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func SRACB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & 1 == 1 {
            carryFlag = 1;
        }
        value = (value >> 1) + (value & (1 << 7));
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func SWAPCB(register: String) -> Void {
        let value: UInt8 = ((GetRegisterValueCB(register: register) & 0xF0) >> 4) | ((GetRegisterValueCB(register: register) & 0x0F) << 4);
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: 0);
    }

    func SRLCB(register: String) -> Void {
        var carryFlag: UInt8 = 0;
        var value: UInt8 = GetRegisterValueCB(register: register);
        if value & 1 == 1 {
            carryFlag = 1;
        }
        value >>= 1;
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func BITCB(bit: UInt8, register: String) -> Void {
        var bitValue: UInt8 = 1;
        let value: UInt8 = GetRegisterValueCB(register: register);
        if value & (1 << bit) == (1 << bit) {
            bitValue = 0;
        }
        registers.setFlagsRegister(z: bitValue, n: 0, h: 1, c: 2);
    }

    func RESCB(bit: UInt8, register: String) -> Void {
        let value: UInt8 = GetRegisterValueCB(register: register) & ~(1 << bit);
        SetRegisterValueCB(register: register, value: value);
    }

    func SETCB(bit: UInt8, register: String) -> Void {
        let value: UInt8 = GetRegisterValueCB(register: register) | (1 << bit);
        SetRegisterValueCB(register: register, value: value);
    }

    func GetRegisterCB(opcode: UInt8) -> String {
        switch opcode & 0b111 {
            case 0x00:
                return "b";
            case 0x01:
                return "c";
            case 0x02:
                return "d";
            case 0x03:
                return "e";
            case 0x04:
                return "h";
            case 0x05:
                return "l";
            case 0x06:
                EmulatorCycles(CPUCycles: 2);
                return "(hl)";
            case 0x07:
                return "a";
            default:
                print("Invalid cb");
                exit(-5);
        }
    }

    //0xCB
    func PREFIXCB() -> Void {
        let opcode = GB.BusRead(address: registers.pc);
        registers.pc += 1;
        let register: String = GetRegisterCB(opcode: opcode);
        let bit: UInt8 = (opcode >> 3) & 0b111;
        EmulatorCycles(CPUCycles: 1);
        let operations: [ClosedRange<UInt8>: () -> Void] = [
            0x00...0x07: { self.RLCCB(register: register); },
            0x08...0x0F: { self.RRCCB(register: register); },
            0x10...0x17: { self.RLCB(register: register); },
            0x18...0x1F: { self.RRCB(register: register); },
            0x20...0x27: { self.SLACB(register: register); },
            0x28...0x2F: { self.SRACB(register: register); },
            0x30...0x37: { self.SWAPCB(register: register); },
            0x38...0x3F: { self.SRLCB(register: register); },
            0x40...0x7F: { self.BITCB(bit: bit, register: register); },
            0x80...0xBF: { self.RESCB(bit: bit, register: register); },
            0xC0...0xFF: { self.SETCB(bit: bit, register: register); }
        ];
        for (range, operation) in operations {
            if range.contains(opcode) {
                operation();
                break;
            }
        }
    }
    func LDH_A_a8() -> Void {
        let fetchedData = UInt16(GB.BusRead(address: registers.pc));
        EmulatorCycles(CPUCycles: 1);
        registers.a = GB.BusRead(address: 0xFF00 | fetchedData);
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
    }
    
    func LDH_a8_A() -> Void {
        let value: UInt16 = registers.pc
        let address: UInt16 = UInt16(GB.BusRead(address: value)) | 0xFF00;
        EmulatorCycles(CPUCycles: 1);
        GB.BusWrite(address: address, value: registers.a);
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
    }
    
    func RRCA() -> Void {
        let carryFlag: UInt8 = ( registers.a & 1 == 1 ? 1 : 0);
        registers.a >>= 1;
        registers.a |= (carryFlag << 7);
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlag);
    }
    func CPL() -> Void {
        CPUStateInstance.registersState.a = ~CPUStateInstance.registersState.a;
        SetFlagsRegister(z: 2, n: 1, h: 1, c: 2);
    }
}