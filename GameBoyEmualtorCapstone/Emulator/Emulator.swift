//
//  Emulator.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/28/23.
//

import Foundation

struct GameBoyState {
    var running: Bool = true;
    var paused: Bool = false;
    var ticks: UInt64 = 0; 
}

/*
 CPU Clock speed is 4.19 mHZ.
 One machine cyclee = */
extension CPU {
    /*
    func EmulatorCycles(CPUCycles: Double) {
        totalInstructionClockCycles += CPUCycles * 4;
    }
     */
    func EmulatorCycles(CPUCycles: Double) -> Void {
        let startTime = CFAbsoluteTimeGetCurrent();
        var machineCycles: Double = 0;
        var tCycles: Double = 0;
        var audioTicks: Double = 0;
        while machineCycles < CPUCycles {
            while tCycles < 4 {
                //EmulatorStateInstance.ticks += 1;
                timer.timerTick();
                //PPUTick();
                tCycles += 1;
            }
            //DMATick();
            machineCycles += 1;
        }
        if CFAbsoluteTimeGetCurrent() < startTime + machineCycleDuration * CPUCycles {
            let sleepDuration = (startTime + machineCycleDuration * CPUCycles) - CFAbsoluteTimeGetCurrent();
            //print("sleeping for \(sleepDuration)");
            Thread.sleep(forTimeInterval: sleepDuration);
        }
    }
}
