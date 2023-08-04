//
//  Emulator.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/28/23.
//

import Foundation

struct GameBoyState {
    var runing: Bool = true;
    var paused: Bool = false;
    var ticks: UInt64 = 0; 
}


extension CPU {
    /*
    func EmulatorCycles(CPUCycles: Double) {
        totalInstructionClockCycles += CPUCycles * 4;
    }
     */
    func EmulatorCycles(CPUCycles: Double) -> Void {
        var i: Double = 0;
        var n: Double = 0;
        while i < CPUCycles {
            while n < 4 {
                let startTime = CFAbsoluteTimeGetCurrent();
                //EmulatorStateInstance.ticks += 1;
               // TimerTick();
                //PPUTick();
                n += 1;
                if CFAbsoluteTimeGetCurrent() < startTime + clockCycleDuration {
                    let sleepDuration = (startTime + clockCycleDuration) - CFAbsoluteTimeGetCurrent();
                    Thread.sleep(forTimeInterval: sleepDuration);
                }
                else {
                    print("execution time greater. \(CFAbsoluteTimeGetCurrent() - startTime)");
                    exit(-5);
                }
            }
            //DMATick();
            i += 1;
        }
    }
    func throttle(startTime: CFAbsoluteTime)  {
        let currentTime =  CFAbsoluteTimeGetCurrent();
        if currentTime < (totalInstructionClockCycles * clockCycleDuration) + startTime {
            let sleepDuration = ((totalInstructionClockCycles * clockCycleDuration) + startTime) - currentTime;
                        Thread.sleep(forTimeInterval: sleepDuration)
        }
        else {
            print("execution time greater. \(currentTime - startTime)");
            exit(-5);
        }
        totalInstructionClockCycles = 0;
    }
}
