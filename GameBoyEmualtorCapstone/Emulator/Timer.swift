//
//  Timer.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/28/23.
//

import Foundation

/*
 FF07 TAC: Timer Control
 Bit  2   - Timer Enable
 Bits 1-0 - Input Clock Select
            00: CPU Clock / 1024 (DMG, SGB2, CGB Single Speed Mode:   4096 Hz, SGB1:   ~4194 Hz, CGB Double Speed Mode:   8192 Hz)
            01: CPU Clock / 16   (DMG, SGB2, CGB Single Speed Mode: 262144 Hz, SGB1: ~268400 Hz, CGB Double Speed Mode: 524288 Hz)
            10: CPU Clock / 64   (DMG, SGB2, CGB Single Speed Mode:  65536 Hz, SGB1:  ~67110 Hz, CGB Double Speed Mode: 131072 Hz)
            11: CPU Clock / 256  (DMG, SGB2, CGB Single Speed Mode:  16384 Hz, SGB1:  ~16780 Hz, CGB Double Speed Mode:  32768 Hz)
 */

struct Timer {
    var DIV: U16 = 0xAC00;
    var TIMA: U8 = 0;
    var TMA: U8 = 0;
    var TAC: U8 = 0
    var timaOverFlow: Bool = false;
    var timerUpdate: Bool = false;
    //var timaFrequencies: [U16] = [1024, 16, 64, 256];
    var cpu: CPU
    mutating func timerTick() -> Void {
        let previousDiv = DIV;
        DIV &+= 1;
        timerUpdate = false;
        switch TAC & 0b11 {
        case 0b00:
            timerUpdate = (previousDiv & (1 << 9)) != 0 && (DIV & (1 << 9)) == 0;
        case 0b01:
            timerUpdate = (previousDiv & (1 << 3)) != 0 && (DIV & (1 << 3)) == 0;
        case 0b10:
            timerUpdate = (previousDiv & (1 << 5)) != 0 && (DIV & (1 << 5)) == 0;
        case 0b11:
            timerUpdate = (previousDiv & (1 << 7)) != 0 && (DIV & (1 << 7)) == 0;
        default:
            break;
        }

        if timerUpdate && (TAC & (1 << 2)) != 0 {
            TIMA &+= 1;
            if TIMA == 0xFF {
                TIMA = TMA;
                cpu.RequestInterrupt(InterruptTypes: .TIMER);
            }
        }
    }
    func TimerRead(address: UInt16) -> UInt8 {
        switch(address) {
        case 0xFF04:
            return U8(DIV >> 8);
        case 0xFF05:
            return TIMA;
        case 0xFF06:
            return TMA;
        case 0xFF07:
            return TAC
        default:
            print("Failed Timer Read");
            exit(-5);
        }
    }

    mutating func TimerWrite(address: UInt16, value: UInt8) -> Void {
        switch(address) {
        case 0xFF04:
            DIV = 0;
        case 0xFF05:
            TIMA = value;
        case 0xFF06:
            TMA = value;
        case 0xFF07:
            TAC = value;
        default:
            break;
        }
    }
    
    init(CPU: CPU) {
        cpu = CPU;
    }
}


