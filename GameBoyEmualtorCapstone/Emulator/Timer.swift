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
    var divCount: U16 = 0;
    var timaCount: U16 = 0;
    var timaOverFlow: Bool = false;
    var timaFrequencies: [U16] = [1024, 16, 64, 256];
    mutating func timerTick() {
        timaOverFlow = false;
        divCount &+= 1;
        timaCount &+= 1;
        if divCount == 256 {
            DIV &+= 1;
            divCount = 0;
        }
        if timaCount == timaFrequencies[Int(TAC & 0b11)] {
            if TIMA == 255 && isBitSet(bitPosition: 1, in: TAC) {
                TIMA = TMA;
                timaOverFlow = true;
                RequestInterrupt();
                return;
            }
            TIMA &+= 1;
            timaCount = 0;
        }
    }
}


