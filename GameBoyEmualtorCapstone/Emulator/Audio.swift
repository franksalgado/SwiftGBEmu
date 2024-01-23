//
//  Audio.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/14/23.
//

import Foundation

import AVFAudio

//https://gbdev.io/pandocs/Audio_Registers.html

struct GameBoySoundRegisters {
    var NR10: U8 = 0x00;
    var NR11: U8 = 0x00;
    var NR12: U8 = 0x00;
    var NR13: U8 = 0x00;
    var NR14: U8 = 0x00;
    
    var NR21: U8 = 0x00;
    var NR22: U8 = 0x00;
    var NR23: U8 = 0x00;
    var NR24: U8 = 0x00;
    
    var NR30: U8 = 0x00;
    var NR31: U8 = 0x00;
    var NR32: U8 = 0x00;
    var NR33: U8 = 0x00;
    var NR34: U8 = 0x00;
    
    var NR41: U8 = 0x00;
    var NR42: U8 = 0x00;
    var NR43: U8 = 0x00;
    var NR44: U8 = 0x00;
    
    var NR50: U8 = 0x00;
    var NR51: U8 = 0x00;
    var NR52: U8 = 0x00;
    
    var waveRAM: [U8] = Array(repeating: 0x00, count: 16);
    
    func AudioRead(address: UInt16) -> UInt8 {
        switch address {
        case 0xFF10: return NR10;
        case 0xFF11: return NR11;
        case 0xFF12: return NR12;
        case 0xFF13: return NR13;
        case 0xFF14: return NR14;
        case 0xFF16: return NR21;
        case 0xFF17: return NR22;
        case 0xFF18: return NR23;
        case 0xFF19: return NR24;
        case 0xFF1A: return NR30;
        case 0xFF1B: return NR31;
        case 0xFF1C: return NR32;
        case 0xFF1D: return NR33;
        case 0xFF1E: return NR34;
        case 0xFF20: return NR41;
        case 0xFF21: return NR42;
        case 0xFF22: return NR43;
        case 0xFF23: return NR44;
        case 0xFF24: return NR50;
        case 0xFF25: return NR51;
        case 0xFF26: return NR52;
        case 0xFF30 ... 0xFF3F:
            let waveRAMIndex = Int(address - 0xFF30);
            return waveRAM[waveRAMIndex];
        default: return 0x00; // Default value for unknown addresses
        }
    }
    
    mutating func AudioWrite(address: UInt16, value: UInt8) {
        switch address {
        case 0xFF10: NR10 = value;
        case 0xFF11: NR11 = value;
        case 0xFF12: NR12 = value;
        case 0xFF13: NR13 = value;
        case 0xFF14: NR14 = value;
        case 0xFF16: NR21 = value;
        case 0xFF17: NR22 = value;
        case 0xFF18: NR23 = value;
        case 0xFF19: NR24 = value;
        case 0xFF1A: NR30 = value;
        case 0xFF1B: NR31 = value;
        case 0xFF1C: NR32 = value;
        case 0xFF1D: NR33 = value;
        case 0xFF1E: NR34 = value;
        case 0xFF20: NR41 = value;
        case 0xFF21: NR42 = value;
        case 0xFF22: NR43 = value;
        case 0xFF23: NR44 = value;
        case 0xFF24: NR50 = value;
        case 0xFF25: NR51 = value;
        case 0xFF26: NR52 = value;
        case 0xFF30 ... 0xFF3F:
            let waveRAMIndex = Int(address - 0xFF30);
            waveRAM[waveRAMIndex] = value;
        default: break; // Ignore writes to unknown addresses
        }
    }
}

struct GlobalAudioRegisters {
    var NR50: U8 = 0x00;
    var NR51: U8 = 0x00;
    var NR52: U8 = 0x00;
}

/*
 GB has 4 sound channels
 Channel signals passed into mixer.
Mixer sends two signals to amplifier
 They are then outputted
 APU runs off gb clock
 Fully synced w the cpu and ppu
 Channels 1 and 2 are pulse channels.
 Have 4 pulse and width setting
 channel 3 wave channel
 channel 4 noise channel
 */
struct APU {
    var channelOne = PulseChannelOne();
    var channelTwo = PulseChannelTwo();
    var channelThree = WaveChannel();
    var channelFour = NoiseChannel();
}

/*
 NRx0 is some channel-specific feature (if present),
 NRx1 controls the length timer,
 NRx2 controls the volume and envelope,
 NRx3 controls the period (maybe only partially),
 NRx4 has the channel’s trigger and length timer enable bits, as well as any leftover bits of period;
 */

class SoundChannel {
    var channelOn = true;
    var isTriggered = false;
    var audioRegisters: [U8] = Array<U8>(repeating: 0, count: 5);
    func emulate() {}
    func produceWave() -> [U8] {
        return [0];
    };
    var audioBuffer: [U8] = [0];
}

class PulseChannel: SoundChannel {
    let waveForms: [[U8]] = [
        [0, 0, 0, 0, 0, 0, 0, 1],    // 12.5%
        [0, 0, 0, 0, 0, 0, 1, 1],    // 25%
        [0, 0, 0, 0, 1, 1, 1, 1],    // 50%
        [1, 1, 1, 1, 1, 1, 0, 0]     // 75%
    ];
    
}

class PulseChannelOne: PulseChannel {
    func sweepPace() {
        
    }
    func calculatePeriod(currentPeriod: U16) {
        //n is the sweep slope
        let n = self.audioRegisters[0] & 0b111;
        var newPeriod: U16 = 0;
        if isBitSet(bitPosition: 3, in: self.audioRegisters[0]) {
            newPeriod = currentPeriod - (currentPeriod / UInt16( pow(2, Double(n)) ) );
            if newPeriod > 0x7FF {
                //write code to turn off the channel
                channelOn = false;
            }
            else {
                newPeriod = currentPeriod + (currentPeriod / UInt16( pow(2, Double(n)) ) );
            }
            self.audioRegisters[3] = U8(newPeriod & 0xFF);
            self.audioRegisters[4] &= U8(newPeriod >> 8) & 0b111;
        }
    }
}

class PulseChannelTwo: PulseChannel {};

class WaveChannel: SoundChannel {};

class NoiseChannel: SoundChannel {};
