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
        table[0x00] = Instruction(name: "NOP", instructionFunction: NOP);
        table[0x01] = Instruction(name: "LD BC, d16", instructionFunction: {[self] in LD_16R_d16(register: &registers.bc, value: FetchD16())} );
        table[0x02] = Instruction(name: "LD (BC) A", instructionFunction: { [self] in LD_ADDR_r(address: registers.bc, value: registers.a, specialCase: false)});
        table[0x03] = Instruction(name: "INC BC", instructionFunction: { [self] in INC_16R(register: &registers.bc)});
        table[0x04] = Instruction(name: "INC B", instructionFunction: { [self] in INC_R(register: &registers.b)});
        table[0x05] = Instruction(name: "DEC B", instructionFunction: { [self] in DEC_R(register: &registers.b)});
        table[0x06] = Instruction(name: "LD B,d8", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x07] = Instruction(name: "RLCA", instructionFunction: RLCA);
        table[0x08] = Instruction(name: "LD (a16), SP", instructionFunction: LD_ADDR_a16_SP);
        table[0x09] = Instruction(name: "ADD HL, BC", instructionFunction: {[self] in ADD_HL_16R(register: registers.bc)});
        table[0x0A] = Instruction(name: "LD A, (BC)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.bc), specialCase: true)});
        table[0x0B] = Instruction(name: "DEC BC", instructionFunction: {[self] in DEC_16R(register: &registers.bc)});
        table[0x0C] = Instruction(name: "INC C", instructionFunction: {[self] in INC_R(register: &registers.c)});
        table[0x0D] = Instruction(name: "DEC C", instructionFunction: {[self] in DEC_R(register: &registers.c)});
        table[0x0E] = Instruction(name: "LD C, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.c, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x0F] = Instruction(name: "RRCA", instructionFunction: RRCA);
        table[0x10] = Instruction(name: "STOP 0", instructionFunction: STOP_0);
        table[0x11] = Instruction(name: "LD DE, d16", instructionFunction: {[self] in LD_16R_d16(register: &registers.de, value: FetchD16())});
        table[0x12] = Instruction(name: "LD (DE), A", instructionFunction: {[self] in LD_ADDR_r(address: registers.de, value: registers.a, specialCase: false)});
        table[0x13] = Instruction(name: "INC DE", instructionFunction: { [self] in INC_16R(register: &registers.de)});
        table[0x14] = Instruction(name: "INC D", instructionFunction: { [self] in INC_R(register: &registers.d)});
        table[0x15] = Instruction(name: "DEC D", instructionFunction: { [self] in DEC_R(register: &registers.d)});
        table[0x16] = Instruction(name: "LD D, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.d, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x17] = Instruction(name: "RLA", instructionFunction: RLA);
        table[0x18] = Instruction(name: "JR r8", instructionFunction: { [self] in JR_COND_r8(condition: true)});
        table[0x19] = Instruction(name: "ADD HL, DE", instructionFunction: {[self] in ADD_HL_16R(register: registers.de)});
        table[0x1A] = Instruction(name: "LD A, (DE)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.de), specialCase: true)});
        table[0x1B] = Instruction(name: "DEC DE", instructionFunction: {[self] in DEC_16R(register: &registers.de)});
        table[0x1C] = Instruction(name: "INC E", instructionFunction: {[self] in INC_R(register: &registers.e)});
        table[0x1D] = Instruction(name: "DEC E", instructionFunction: {[self] in DEC_R(register: &registers.e)});
        table[0x1E] = Instruction(name: "LD E, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.e, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x1F] = Instruction(name: "RRA", instructionFunction: RRA);
        table[0x20] = Instruction(name: "JR NZ, r8", instructionFunction: { [self] in JR_COND_r8(condition: !isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0x21] = Instruction(name: "LD HL, d16", instructionFunction: {[self] in LD_16R_d16(register: &registers.hl, value: FetchD16())});
        table[0x22] = Instruction(name: "LD (HL+), A", instructionFunction: {[self] in LD_ADDR_r(address: registers.hl, value: registers.a, specialCase: true)});
        table[0x23] = Instruction(name: "INC HL", instructionFunction: {[self] in INC_16R(register: &registers.hl)});
        table[0x24] = Instruction(name: "INC H", instructionFunction: {[self] in INC_R(register: &registers.h)});
        table[0x25] = Instruction(name: "DEC H", instructionFunction: {[self] in DEC_R(register: &registers.h)});
        table[0x26] = Instruction(name: "LD H, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.h, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x27] = Instruction(name: "DAA", instructionFunction: DAA);
        table[0x28] = Instruction(name: "JR Z r8", instructionFunction: { [self] in JR_COND_r8(condition: isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0x29] = Instruction(name: "ADD HL, HL", instructionFunction: {[self] in ADD_HL_16R(register: registers.hl)});
        table[0x2A] = Instruction(name: "LD A, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x2B] = Instruction(name: "DEC HL", instructionFunction: {[self] in DEC_16R(register: &registers.hl)});
        table[0x2C] = Instruction(name: "INC L", instructionFunction: {[self] in INC_R(register: &registers.l)});
        table[0x2D] = Instruction(name: "DEC L", instructionFunction: {[self] in DEC_R(register: &registers.l)});
        table[0x2E] = Instruction(name: "LD L, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.l, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x2F] = Instruction(name: "CPL", instructionFunction: CPL);
        table[0x30] = Instruction(name: "JR NC, r8", instructionFunction: { [self] in JR_COND_r8(condition: !isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0x31] = Instruction(name: "LD SP, d16", instructionFunction: {[self] in LD_16R_d16(register: &registers.sp, value: FetchD16())} );
        table[0x32] = Instruction(name: "LD (HL-),A", instructionFunction: {[self] in LD_ADDR_r(address: registers.hl, value: registers.a, specialCase: true)});
        table[0x33] = Instruction(name: "INC SP", instructionFunction: {[self] in INC_16R(register: &registers.sp)});
        table[0x34] = Instruction(name: "INC (HL)", instructionFunction: INC_ADDR_HL);
        table[0x35] = Instruction(name: "DEC (HL)", instructionFunction: DEC_ADDR_HL);
        table[0x36] = Instruction(name: "LD (HL),d8", instructionFunction: {[self] in LD_ADDR_r(address: registers.hl, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x37] = Instruction(name: "SCF", instructionFunction: SCF);
        table[0x38] = Instruction(name: "JR C, r8", instructionFunction: { [self] in JR_COND_r8(condition: isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0x39] = Instruction(name: "ADD HL, BC", instructionFunction: {[self] in ADD_HL_16R(register: registers.sp)});
        table[0x3A] = Instruction(name: "LD A, (BC)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.bc), specialCase: true)});
        table[0x3B] = Instruction(name: "DEC SP", instructionFunction: {[self] in DEC_16R(register: &registers.sp)});
        table[0x3C] = Instruction(name: "INC A", instructionFunction: {[self] in INC_R(register: &registers.a)});
        table[0x3D] = Instruction(name: "DEC A", instructionFunction: {[self] in DEC_R(register: &registers.a)});
        table[0x3E] = Instruction(name: "LD A, d8", instructionFunction: {[self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.pc), specialCase: true)});
        table[0x3F] = Instruction(name: "CCF", instructionFunction: CCF);
        table[0x40] = Instruction(name: "LD B, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.b, specialCase: false)});
        table[0x41] = Instruction(name: "LD B, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.c, specialCase: false)});
        table[0x42] = Instruction(name: "LD B, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.d, specialCase: false)});
        table[0x43] = Instruction(name: "LD B, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.e, specialCase: false)});
        table[0x44] = Instruction(name: "LD B, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.h, specialCase: false)});
        table[0x45] = Instruction(name: "LD B, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.l, specialCase: false)});
        table[0x46] = Instruction(name: "LD B, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x47] = Instruction(name: "LD B, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.b, value: registers.a, specialCase: false)});
        table[0x48] = Instruction(name: "LD C, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.b, specialCase: false)});
        table[0x49] = Instruction(name: "LD C, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.c, specialCase: false)});
        table[0x4A] = Instruction(name: "LD C, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.d, specialCase: false)});
        table[0x4B] = Instruction(name: "LD C, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.e, specialCase: false)});
        table[0x4C] = Instruction(name: "LD C, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.h, specialCase: false)});
        table[0x4D] = Instruction(name: "LD C, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.l, specialCase: false)});
        table[0x4E] = Instruction(name: "LD C, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x4F] = Instruction(name: "LD C, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.c, value: registers.a, specialCase: false)});
        table[0x50] = Instruction(name: "LD D, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.b, specialCase: false)});
        table[0x51] = Instruction(name: "LD D, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.c, specialCase: false)});
        table[0x52] = Instruction(name: "LD D, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.d, specialCase: false)});
        table[0x53] = Instruction(name: "LD D, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.e, specialCase: false)});
        table[0x54] = Instruction(name: "LD D, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.h, specialCase: false)});
        table[0x55] = Instruction(name: "LD D, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.l, specialCase: false)});
        table[0x56] = Instruction(name: "LD D, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x57] = Instruction(name: "LD D, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.d, value: registers.a, specialCase: false)});
        table[0x58] = Instruction(name: "LD E, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.b, specialCase: false)});
        table[0x59] = Instruction(name: "LD E, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.c, specialCase: false)});
        table[0x5A] = Instruction(name: "LD E, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.d, specialCase: false)});
        table[0x5B] = Instruction(name: "LD E, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.e, specialCase: false)});
        table[0x5C] = Instruction(name: "LD E, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.h, specialCase: false)});
        table[0x5D] = Instruction(name: "LD E, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.l, specialCase: false)});
        table[0x5E] = Instruction(name: "LD E, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x5F] = Instruction(name: "LD E, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.e, value: registers.a, specialCase: false)});
        table[0x60] = Instruction(name: "LD H, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.b, specialCase: false)});
        table[0x61] = Instruction(name: "LD H, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.c, specialCase: false)});
        table[0x62] = Instruction(name: "LD H, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.d, specialCase: false)});
        table[0x63] = Instruction(name: "LD H, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.e, specialCase: false)});
        table[0x64] = Instruction(name: "LD H, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.h, specialCase: false)});
        table[0x65] = Instruction(name: "LD H, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.l, specialCase: false)});
        table[0x66] = Instruction(name: "LD H, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x67] = Instruction(name: "LD H, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.h, value: registers.a, specialCase: false)});
        table[0x68] = Instruction(name: "LD L, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.b, specialCase: false)});
        table[0x69] = Instruction(name: "LD L, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.c, specialCase: false)});
        table[0x6A] = Instruction(name: "LD L, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.d, specialCase: false)});
        table[0x6B] = Instruction(name: "LD L, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.e, specialCase: false)});
        table[0x6C] = Instruction(name: "LD L, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.h, specialCase: false)});
        table[0x6D] = Instruction(name: "LD L, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.l, specialCase: false)});
        table[0x6E] = Instruction(name: "LD L, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x6F] = Instruction(name: "LD L, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.l, value: registers.a, specialCase: false)});
        table[0x70] = Instruction(name: "LD (HL), B", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.b, specialCase: false) });
        table[0x71] = Instruction(name: "LD (HL), C", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.c, specialCase: false) });
        table[0x72] = Instruction(name: "LD (HL), D", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.d, specialCase: false) });
        table[0x73] = Instruction(name: "LD (HL), E", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.e, specialCase: false) });
        table[0x74] = Instruction(name: "LD (HL), H", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.h, specialCase: false) });
        table[0x75] = Instruction(name: "LD (HL), L", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.l, specialCase: false) });
        table[0x76] = Instruction(name: "HALT", instructionFunction: HALT);
        table[0x77] = Instruction(name: "LD (HL), A", instructionFunction: { [self] in LD_ADDR_r(address: registers.hl, value: registers.a, specialCase: false) });
        table[0x78] = Instruction(name: "LD A, B", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.b, specialCase: false)});
        table[0x79] = Instruction(name: "LD A, C", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.c, specialCase: false)});
        table[0x7A] = Instruction(name: "LD A, D", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.d, specialCase: false)});
        table[0x7B] = Instruction(name: "LD A, E", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.e, specialCase: false)});
        table[0x7C] = Instruction(name: "LD A, H", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.h, specialCase: false)});
        table[0x7D] = Instruction(name: "LD A, L", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.l, specialCase: false)});
        table[0x7E] = Instruction(name: "LD A, (HL)", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: registers.hl), specialCase: true)});
        table[0x7F] = Instruction(name: "LD A, A", instructionFunction: { [self] in LD_R_R(registerOne: &registers.a, value: registers.a, specialCase: false)});
        table[0x80] = Instruction(name: "ADD A, B", instructionFunction: { [self] in ADD_A_R(value: registers.b)});
        table[0x81] = Instruction(name: "ADD A, C", instructionFunction: { [self] in ADD_A_R(value: registers.c)});
        table[0x82] = Instruction(name: "ADD A, D", instructionFunction: { [self] in ADD_A_R(value: registers.d)});
        table[0x83] = Instruction(name: "ADD A, E", instructionFunction: { [self] in ADD_A_R(value: registers.e)});
        table[0x84] = Instruction(name: "ADD A, H", instructionFunction: { [self] in ADD_A_R(value: registers.h)});
        table[0x85] = Instruction(name: "ADD A, L", instructionFunction: { [self] in ADD_A_R(value: registers.l)});
        table[0x86] = Instruction(name: "ADD A, (HL)", instructionFunction: { [self] in ADD_A_R(value: GB.BusRead(address: registers.hl))});
        table[0x87] = Instruction(name: "ADD A, A", instructionFunction: { [self] in ADD_A_R(value: registers.a)});
        table[0x88] = Instruction(name: "ADC A, B", instructionFunction: { [self] in ADC_A_R(register: registers.b)});
        table[0x89] = Instruction(name: "ADC A, C", instructionFunction: { [self] in ADC_A_R(register: registers.c)});
        table[0x8A] = Instruction(name: "ADC A, D", instructionFunction: { [self] in ADC_A_R(register: registers.d)});
        table[0x8B] = Instruction(name: "ADC A, E", instructionFunction: { [self] in ADC_A_R(register: registers.e)});
        table[0x8C] = Instruction(name: "ADC A, H", instructionFunction: { [self] in ADC_A_R(register: registers.h)});
        table[0x8D] = Instruction(name: "ADC A, L", instructionFunction: { [self] in ADC_A_R(register: registers.l)});
        table[0x8E] = Instruction(name: "ADC A, (HL)", instructionFunction: { [self] in ADC_A_R(register: GB.BusRead(address: registers.hl ))});
        table[0x8F] = Instruction(name: "ADC A, A", instructionFunction: { [self] in ADC_A_R(register: registers.a)});
        table[0x90] = Instruction(name: "SUB B", instructionFunction: { [self] in SUB_R(value: registers.b)});
        table[0x91] = Instruction(name: "SUB C", instructionFunction: { [self] in SUB_R(value: registers.c)});
        table[0x92] = Instruction(name: "SUB D", instructionFunction: { [self] in SUB_R(value: registers.d)});
        table[0x93] = Instruction(name: "SUB E", instructionFunction: { [self] in SUB_R(value: registers.e)});
        table[0x94] = Instruction(name: "SUB H", instructionFunction: { [self] in SUB_R(value: registers.h)});
        table[0x95] = Instruction(name: "SUB L", instructionFunction: { [self] in SUB_R(value: registers.l)});
        table[0x96] = Instruction(name: "SUB (HL)", instructionFunction: { [self] in SUB_R(value:  GB.BusRead(address: registers.hl ))});
        table[0x97] = Instruction(name: "SUB A", instructionFunction: { [self] in SUB_R(value: registers.a)});
        table[0x98] = Instruction(name: "SBC A, B", instructionFunction: { [self] in SBC_A_R(register: registers.b)});
        table[0x99] = Instruction(name: "SBC A, C", instructionFunction: { [self] in SBC_A_R(register: registers.c)});
        table[0x9A] = Instruction(name: "SBC A, D", instructionFunction: { [self] in SBC_A_R(register: registers.d)});
        table[0x9B] = Instruction(name: "SBC A, E", instructionFunction: { [self] in SBC_A_R(register: registers.e)});
        table[0x9C] = Instruction(name: "SBC A, H", instructionFunction: { [self] in SBC_A_R(register: registers.h)});
        table[0x9D] = Instruction(name: "SBC A, L", instructionFunction: { [self] in SBC_A_R(register: registers.l)});
        table[0x9E] = Instruction(name: "SBC A, (HL)", instructionFunction: { [self] in SBC_A_R(register:  GB.BusRead(address: registers.hl ))});
        table[0x9F] = Instruction(name: "SBC A, A", instructionFunction: { [self] in SBC_A_R(register: registers.a)});
        table[0xA0] = Instruction(name: "AND B", instructionFunction: { [self] in AND_R(value: registers.b)});
        table[0xA1] = Instruction(name: "AND C", instructionFunction: { [self] in AND_R(value: registers.c)});
        table[0xA2] = Instruction(name: "AND D", instructionFunction: { [self] in AND_R(value: registers.d)});
        table[0xA3] = Instruction(name: "AND E", instructionFunction: { [self] in AND_R(value: registers.e)});
        table[0xA4] = Instruction(name: "AND H", instructionFunction: { [self] in AND_R(value: registers.h)});
        table[0xA5] = Instruction(name: "AND L", instructionFunction: { [self] in AND_R(value: registers.l)});
        table[0xA6] = Instruction(name: "AND (HL)", instructionFunction: { [self] in AND_R(value: GB.BusRead(address: registers.hl))});
        table[0xA7] = Instruction(name: "AND A", instructionFunction: { [self] in AND_R(value: registers.a)});
        table[0xA8] = Instruction(name: "XOR B", instructionFunction: { [self] in XOR_R(value: registers.b)});
        table[0xA9] = Instruction(name: "XOR C", instructionFunction: { [self] in XOR_R(value: registers.c)});
        table[0xAA] = Instruction(name: "XOR D", instructionFunction: { [self] in XOR_R(value: registers.d)});
        table[0xAB] = Instruction(name: "XOR E", instructionFunction: { [self] in XOR_R(value: registers.e)});
        table[0xAC] = Instruction(name: "XOR H", instructionFunction: { [self] in XOR_R(value: registers.h)});
        table[0xAD] = Instruction(name: "XOR L", instructionFunction: { [self] in XOR_R(value: registers.l)});
        table[0xAE] = Instruction(name: "XOR (HL)", instructionFunction: { [self] in XOR_R(value: GB.BusRead(address: registers.hl))});
        table[0xAF] = Instruction(name: "XOR A", instructionFunction: { [self] in XOR_R(value: registers.a)});
        table[0xB0] = Instruction(name: "OR B", instructionFunction: { [self] in OR_R(register: registers.b)});
        table[0xB1] = Instruction(name: "OR C", instructionFunction: { [self] in OR_R(register: registers.c)});
        table[0xB2] = Instruction(name: "OR D", instructionFunction: { [self] in OR_R(register: registers.d)});
        table[0xB3] = Instruction(name: "OR E", instructionFunction: { [self] in OR_R(register: registers.e)});
        table[0xB4] = Instruction(name: "OR H", instructionFunction: { [self] in OR_R(register: registers.h)});
        table[0xB5] = Instruction(name: "OR L", instructionFunction: { [self] in OR_R(register: registers.l)});
        table[0xB6] = Instruction(name: "OR (HL)", instructionFunction: { [self] in OR_R(register: GB.BusRead(address: registers.hl ))});
        table[0xB7] = Instruction(name: "OR A", instructionFunction: { [self] in OR_R(register: registers.a)});
        table[0xB8] = Instruction(name: "CP B", instructionFunction: { [self] in CP_R(value: registers.b)});
        table[0xB9] = Instruction(name: "CP C", instructionFunction: { [self] in CP_R(value: registers.c)});
        table[0xBA] = Instruction(name: "CP D", instructionFunction: { [self] in CP_R(value: registers.d)});
        table[0xBB] = Instruction(name: "CP E", instructionFunction: { [self] in CP_R(value: registers.e)});
        table[0xBC] = Instruction(name: "CP H", instructionFunction: { [self] in CP_R(value: registers.h)});
        table[0xBD] = Instruction(name: "CP L", instructionFunction: { [self] in CP_R(value: registers.l)});
        table[0xBE] = Instruction(name: "CP (HL)", instructionFunction: { [self] in CP_R(value: GB.BusRead(address: registers.hl ) ) });
        table[0xBF] = Instruction(name: "CP A", instructionFunction: { [self] in CP_R(value: registers.a)});
        table[0xC0] = Instruction(name: "RET NZ", instructionFunction: { [self] in RET_COND(conditon: !isBitSet(bitPosition: ZFlag, in: registers.f))} );
        table[0xC1] = Instruction(name: "POP BC", instructionFunction: {[self] in POP_16R(register: &registers.bc)});
        table[0xC2] = Instruction(name: "JP NZ, a16", instructionFunction: {[self] in JP_COND_a16(condition: !isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0xC3] = Instruction(name: "JP a16", instructionFunction: {[self] in JP_COND_a16(condition: true)});
        table[0xC4] = Instruction(name: "CALL NZ, a16", instructionFunction: {[self] in CALL_COND_a16(condition: !isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0xC5] = Instruction(name: "PUSH BC", instructionFunction: {[self] in PUSH_16R(data: registers.bc)});
        table[0xC6] = Instruction(name: "ADD A, d8", instructionFunction: {[self] in ADD_A_R(value: GB.BusRead(address: registers.pc))});
        table[0xC7] = Instruction(name: "RST 00H", instructionFunction: {[self] in RST_n_H(address: 00)});
        table[0xC8] = Instruction(name: "RET Z", instructionFunction: {[self] in RET_COND(conditon: isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0xC9] = Instruction(name: "RET", instructionFunction: {[self] in RET_COND(conditon: true)});
        table[0xCA] = Instruction(name: "JP Z, a16", instructionFunction: {[self] in JP_COND_a16(condition: isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0xCB] = Instruction(name: "PREFIX CB", instructionFunction: PREFIXCB);
        table[0xCC] = Instruction(name: "CALL Z,a16", instructionFunction: {[self] in CALL_COND_a16(condition: isBitSet(bitPosition: ZFlag, in: registers.f))});
        table[0xCD] = Instruction(name: "CALL a16", instructionFunction: {[self] in CALL_COND_a16(condition: true)});
        table[0xCE] = Instruction(name: "ADC A,d8", instructionFunction: {[self] in ADC_A_R(register: GB.BusRead(address: registers.pc))});
        table[0xCF] = Instruction(name: "RST 08H", instructionFunction: { [self] in RST_n_H(address: 08)});
        table[0xD0] = Instruction(name: "RET NC", instructionFunction: { [self] in RET_COND(conditon: !isBitSet(bitPosition: CFlag, in: registers.f))} );
        table[0xD1] = Instruction(name: "POP DE", instructionFunction: {[self] in POP_16R(register: &registers.de)});
        table[0xD2] = Instruction(name: "JP NC, a16", instructionFunction: {[self] in JP_COND_a16(condition: !isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0xD4] = Instruction(name: "CALL NC, a16", instructionFunction: {[self] in CALL_COND_a16(condition: !isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0xD5] = Instruction(name: "PUSH DE", instructionFunction: {[self] in PUSH_16R(data: registers.de)});
        table[0xD6] = Instruction(name: "SUB d8", instructionFunction: {[self] in SUB_R(value: GB.BusRead(address: registers.pc))});
        table[0xD7] = Instruction(name: "RST 10H", instructionFunction: {[self] in RST_n_H(address: 10)});
        table[0xD8] = Instruction(name: "RET C", instructionFunction: {[self] in RET_COND(conditon: isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0xD9] = Instruction(name: "RETI", instructionFunction: {[self] in RET_COND(conditon: true)});
        table[0xDA] = Instruction(name: "JP C, a16", instructionFunction: {[self] in JP_COND_a16(condition: isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0xDC] = Instruction(name: "CALL C,a16", instructionFunction: {[self] in CALL_COND_a16(condition: isBitSet(bitPosition: CFlag, in: registers.f))});
        table[0xDE] = Instruction(name: "SBC A, d8", instructionFunction: {[self] in SBC_A_R(register: GB.BusRead(address: registers.pc))});
        table[0xDF] = Instruction(name: "RST 18H", instructionFunction: { [self] in RST_n_H(address: 18)});
        table[0xE0] = Instruction(name: "LDH (a8), A", instructionFunction: LDH_ADDR_a8_A);
        table[0xE1] = Instruction(name: "POP HL", instructionFunction: {[self] in POP_16R(register: &registers.hl)});
        table[0xE2] = Instruction(name: "LD (C), A", instructionFunction: {[self] in LD_ADDR_r(address: 0xFF00 | UInt16(registers.c), value: registers.a, specialCase: true)});
        table[0xE5] = Instruction(name: "PUSH HL", instructionFunction: {[self] in PUSH_16R(data: registers.hl)});
        table[0xE6] = Instruction(name: "AND d8", instructionFunction: {[self] in AND_R(value: GB.BusRead(address: registers.pc))});
        table[0xE7] = Instruction(name: "RST 20H", instructionFunction: {[self] in RST_n_H(address: 20)});
        table[0xE8] = Instruction(name: "ADD SP, r8", instructionFunction: ADD_SP_r8);
        table[0xE9] = Instruction(name: "JP (HL)", instructionFunction: {[self] in JP_COND_a16(condition: false)});//false because handled by else if
        table[0xEA] = Instruction(name: "LD (a16), A", instructionFunction: {[self] in LD_ADDR_r(address: FetchD16(), value: registers.a, specialCase: false)});
        table[0xEE] = Instruction(name: "XOR d8", instructionFunction: {[self] in XOR_R(value: GB.BusRead(address: registers.pc))});
        table[0xEF] = Instruction(name: "RST 28H", instructionFunction: { [self] in RST_n_H(address: 28)});
        table[0xF0] = Instruction(name: "LDH A, (a8)", instructionFunction: LDH_A_ADDR_a8);
        table[0xF1] = Instruction(name: "POP AF", instructionFunction: { [self] in POP_16R(register: &registers.af)});
        table[0xF2] = Instruction(name: "LD A, (C)", instructionFunction: {[self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: 0xFF00 | UInt16(registers.c)), specialCase: true)});
        table[0xF3] = Instruction(name: "DI", instructionFunction: DI);
        table[0xF5] = Instruction(name: "PUSH AF", instructionFunction: {[self] in PUSH_16R(data: registers.af)});
        table[0xF6] = Instruction(name: "OR d8", instructionFunction: {[self] in OR_R(register: GB.BusRead(address: registers.pc))});
        table[0xF7] = Instruction(name: "RST 30H", instructionFunction: {[self] in RST_n_H(address: 30)});
        table[0xF8] = Instruction(name: "LD HL, SP+r8", instructionFunction: LD_HL_SP_plus_R8);
        table[0xF9] = Instruction(name: "LD SP, HL", instructionFunction:{[self] in LD_16R_d16(register: &registers.sp, value: registers.hl)} );
        table[0xFA] = Instruction(name: "LD A, (a16)", instructionFunction: {[self] in LD_R_R(registerOne: &registers.a, value: GB.BusRead(address: FetchD16() ), specialCase: true)});
        table[0xFB] = Instruction(name: "EI", instructionFunction: EI);
        table[0xFE] = Instruction(name: "CP d8", instructionFunction: {[self] in CP_R(value: GB.BusRead(address: registers.pc))});
        table[0xFF] = Instruction(name: "RST 38H", instructionFunction: { [self] in RST_n_H(address: 38)});
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
    func LD_16R_d16(register: inout U16,  value: U16) -> Void {
        register = value;
        if currentOpcode == 0xF9 { EmulatorCycles(CPUCycles: 1); }
    }
    

    
    func LD_HL_SP_plus_R8() {
        let value: UInt8 = GB.BusRead(address: registers.pc);
        registers.pc += 1;
        registers.hl = (UInt16(truncatingIfNeeded: Int(Int8(bitPattern: U8(value) ) ) + Int(registers.sp)));
                 registers.setFlagsRegister(
                    z: 0,
                    n: 0,
                    h: ( (registers.sp & 0xF) + UInt16(value & 0xF) >= 0x10 ? 1 : 0),
                    c: ( UInt16(registers.sp & 0xFF) + UInt16(value & 0xFF) >= 0x100 ? 1 : 0)
                 );
        EmulatorCycles(CPUCycles: 2);
    }
    
    //0x02 0x12 0x22 0x32
    func LD_ADDR_r(address: U16, value: U8, specialCase: Bool) -> Void {
        GB.BusWrite(address: address, value: value);
        EmulatorCycles(CPUCycles: 1);
        if !specialCase { return; }
        else if  currentOpcode == 0x22 {
            registers.hl &+= 1;
        }
        else if currentOpcode == 0x32 {
            registers.hl &-= 1;
        }
        else if currentOpcode == 0x36 {
            registers.pc += 1;
            EmulatorCycles(CPUCycles: 1);
        }
        else if currentOpcode == 0xE2 {  EmulatorCycles(CPUCycles: 1); }

    }
    
    //0x10
    func STOP_0() -> Void {
        print("stop instruction executed");
    }
    
    //0x03 0x13 0x23 0x33
    func INC_16R(register: inout U16) {
        register &+= 1;
        EmulatorCycles(CPUCycles: 1);
    }
    
    func INC_ADDR_HL() -> Void {
        let value: U8 = GB.BusRead(address: registers.hl) &+ 1;
        GB.BusWrite(address: registers.hl, value: value);
        let halfCarry: U8 = (value & 0x0F == 0 ? 1 : 0)
        registers.setFlagsRegister(z: IsZero(value: value) , n: 0, h: halfCarry, c: 2);
        EmulatorCycles(CPUCycles: 2);
    }
    
    func DEC_ADDR_HL() {
        let value: U8 = GB.BusRead(address: registers.hl) &- 1;
        GB.BusWrite(address: registers.hl, value: value);
        let halfCarry: UInt8 = ( (value & 0x0F) == 0x0F ? 1 : 0);
        registers.setFlagsRegister(z: IsZero(value: value) , n: 1, h: halfCarry, c: 2);
        EmulatorCycles(CPUCycles: 2);
    }
    
    func DAA() -> Void {
        var u: UInt8 = 0
        var carryFlag: UInt8 = 0;
        if isBitSet(bitPosition: HFlag, in: registers.f) || (!isBitSet(bitPosition: NFlag, in: registers.f) && (registers.a & 0xF) > 9) {
                u = 6;
        }

        if isBitSet(bitPosition: CFlag, in: registers.f) || (!isBitSet(bitPosition: NFlag, in: registers.f) && registers.a > 0x99) {
            u |= 0x60;
            carryFlag = 1;
        }
        if isBitSet(bitPosition: NFlag, in: registers.f) {
            registers.a =  registers.a &- u;
        }
        else {
            registers.a &+= u;
        }
        registers.setFlagsRegister(z: IsZero(value: registers.a), n: 2, h: 0, c: carryFlag);
    }
    
    
    func DEC_16R(register: inout U16) {
        register &-= 1;
        EmulatorCycles(CPUCycles: 1);
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
        register &-= 1;
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
        if isBitSet(bitPosition: CFlag, in: registers.f) { registers.a |= 1;
        }
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlag);
    }
    
    func RRA() -> Void {
        let carryFlag: UInt8 = registers.a & 1;
        registers.a >>= 1;
        if isBitSet(bitPosition: CFlag, in: registers.f) { registers.a |= (1 << 7); }
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
    func RLCA() {
        let carryFlagVal: UInt8 = ( isBitSet(bitPosition: 7, in: registers.a) ? 1 : 0);
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
            EmulatorCycles(CPUCycles: 1);
        }
        else if currentOpcode & 0x06 == 0x06 && currentOpcode >= 0x46 ||
                currentOpcode & 0x0E == 0x0E && currentOpcode >= 0x4E ||
                currentOpcode == 0x0A || currentOpcode == 0x1A{
            EmulatorCycles(CPUCycles: 1);
        }
        else if currentOpcode == 0x2A {
            EmulatorCycles(CPUCycles: 1);
            registers.hl &+= 1;
        }
        else if currentOpcode == 0x3A {
            EmulatorCycles(CPUCycles: 1);
            registers.hl &-= 1;
        }
        else if currentOpcode == 0xF2 {
            EmulatorCycles(CPUCycles: 1);
        }
        else if currentOpcode == 0xFA { EmulatorCycles(CPUCycles: 1); }
    }
    
    func ADD_HL_16R(register: UInt16) -> Void {
        let val = registers.hl;
        registers.hl &+= register;
        registers.setFlagsRegister(
            z: 2,
            n: 0,
            h: ( (val & 0xFFF) + (register & 0xFFF) >= 0x1000 ? 1 : 0),
            c: (UInt32(val) + UInt32(register) >= 0x10000 ? 1 : 0)
        );
        EmulatorCycles(CPUCycles: 1);
    }
    
    func XOR_R(value: UInt8) -> Void {
        registers.a ^= value;
        registers.setFlagsRegister(
            z: IsZero(value: registers.a),
            n: 0,
            h: 0,
            c: 0
        );
        //if currentOpcode & 0xA0 == 0xA0 { return; }
        if currentOpcode == 0xAE {
            EmulatorCycles(CPUCycles: 1);
        }
        if currentOpcode == 0xEE {
            registers.pc += 1;
            EmulatorCycles(CPUCycles: 1);
        }
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
            EmulatorCycles(CPUCycles: 1);
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
            registers.sp &-= 2;
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
        registers.sp &-= 2;
        registers.pc = address;
        EmulatorCycles(CPUCycles: 3);
    }
    
    func ADD_A_R(value: U8) {
        let halfCarry: UInt8 = (
            ((registers.a & 0xF) + (value & 0xF)) >= 0x10 ? 1 : 0 );
        let carryFlag: UInt8 = (
            (Int(registers.a & 0xFF) + Int(value & 0xFF)) >= 0x100 ? 1 : 0);
        registers.a &+= value;
        registers.setFlagsRegister(z: IsZero(value: registers.a) , n: 0, h: halfCarry, c: carryFlag);
    }
    
    
    func ADC_A_R(register: UInt8) -> Void {
        let carryFlagVal: UInt8 = (!isBitSet(bitPosition: CFlag, in: registers.f) ? 0 : 1);
        let halfCarry: U8 = ( (registers.a & 0xF) + (register & 0xF) + carryFlagVal > 0xF ? 1 : 0);
        let carryFlag: U8 = ( (Int(registers.a) + Int(register) + Int(carryFlagVal))  > 0xFF ? 1 : 0 );
        if currentOpcode == 0x8E {
            EmulatorCycles(CPUCycles: 1);
        }
        registers.a &+=  register &+ carryFlagVal;
        if currentOpcode == 0xCE {
            registers.pc += 1;
            EmulatorCycles(CPUCycles: 1);
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
            registers.sp &+= 2;
        }
        if currentOpcode == 0xD9 {
            interruptMasterEnable = true;
        }
        EmulatorCycles(CPUCycles: 1);
    }
    
    func JP_COND_a16(condition: Bool) {
        if condition {
            registers.pc = FetchD16();
            EmulatorCycles(CPUCycles: 1);
        }
        else if currentOpcode == 0xE9 {
            registers.pc = registers.hl;
            print("zaza")
        }
        else {
            EmulatorCycles(CPUCycles: 2);
            registers.pc += 2;
        }
    }
    
    func SUB_R(value: U8) {
        if currentOpcode == 0x96 {
            EmulatorCycles(CPUCycles: 1);
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
    
    func SBC_A_R(register: UInt8) {
        var halfCarry: UInt8 = 0;
        var carryFlag: UInt8 = 0;
        let carryFlagVal: UInt8 = (isBitSet(bitPosition: CFlag, in: registers.f) ? 1 : 0);
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
            EmulatorCycles(CPUCycles: 1);
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
                return GB.BusRead(address: registers.hl);
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
                GB.BusWrite(address: registers.hl, value: value);
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
        var value: UInt8 = GetRegisterValueCB(register: register);
        let carryFlag: UInt8 = (value & 1 == 1 ? 1 : 0);
        value >>= 1;
        if isBitSet(bitPosition: CFlag, in: registers.f) {
            value |= (1 << 7);
        }
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func SLACB(register: String) -> Void {
        var value: UInt8 = GetRegisterValueCB(register: register);
        let carryFlag: UInt8 = (isBitSet(bitPosition: 7, in: value) ? 1 : 0);
        value <<= 1;
        SetRegisterValueCB(register: register, value: value);
        registers.setFlagsRegister(z: IsZero(value: value), n: 0, h: 0, c: carryFlag);
    }

    func SRACB(register: String) -> Void {
        var value: UInt8 = GetRegisterValueCB(register: register);
        let carryFlag: UInt8 = (value & 1 == 1 ? 1 : 0);
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
        var value: UInt8 = GetRegisterValueCB(register: register);
        let carryFlag: UInt8 = (value & 1 == 1 ? 1 : 0);
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
    
    func RRCA() -> Void {
        let carryFlag: UInt8 = ( registers.a & 1 == 1 ? 1 : 0);
        registers.a >>= 1;
        registers.a |= (carryFlag << 7);
        registers.setFlagsRegister(z: 0, n: 0, h: 0, c: carryFlag);
    }
    func CPL() -> Void {
        registers.a = ~registers.a;
        registers.setFlagsRegister(z: 2, n: 1, h: 1, c: 2);
    }
    func LD_ADDR_a16_SP() {
        GB.BusWrite16Bit(address: FetchD16(), value: registers.sp);
        EmulatorCycles(CPUCycles: 2);
    }
    func CCF() -> Void {
        registers.setFlagsRegister(z: 2, n: 0, h: 0, c: (isBitSet(bitPosition: CFlag, in: registers.f) ? 0 : 1));
    }
    
    func HALT() -> Void { halted = true; }
    
    func POP_16R(register: inout U16) {
        register = stack.StackPop16Bit();
        registers.sp &+= 2;
        EmulatorCycles(CPUCycles: 2);
    }
    
    func PUSH_16R(data: U16) {
        stack.StackPush16Bit(data: data);
        registers.sp &-= 2;
        EmulatorCycles(CPUCycles: 3);
    }
    
    func LDH_ADDR_a8_A() -> Void {
        let address = UInt16(GB.BusRead(address: registers.pc)) | 0xFF00;
        EmulatorCycles(CPUCycles: 1);
        GB.BusWrite(address: address, value: registers.a);
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
    }
    
    func LDH_A_ADDR_a8() -> Void {
        let fetchedData = UInt16(GB.BusRead(address: registers.pc));
        EmulatorCycles(CPUCycles: 1);
        registers.a = GB.BusRead(address: 0xFF00 | fetchedData);
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 1);
    }
    
    func ADD_SP_r8() -> Void {
        registers.sp = UInt16(truncatingIfNeeded: Int(registers.sp) + Int(Int8(bitPattern: GB.BusRead(address:  registers.pc))));
        registers.pc += 1;
        EmulatorCycles(CPUCycles: 3);
        registers.setFlagsRegister(
            z: 0,
            n: 0,
            h: ((registers.sp & 0xF) + UInt16(GB.BusRead(address: registers.pc) & 0xF) >= 0x10 ? 1 : 0),
            c: (Int(registers.sp & 0xFF) + Int(GB.BusRead(address: registers.pc) & 0xFF) >= 0x100 ? 1 : 0)
        );
    }
}
