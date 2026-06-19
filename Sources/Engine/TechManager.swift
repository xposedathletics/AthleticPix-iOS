import Foundation
import Combine
import CoreBluetooth
 
// ── TechManager — wearable, camera, SMARTSPEED ────────────────────────────────
class TechManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    // Wearable
    @Published var wearableConnected: Bool = false
    @Published var wearableDevice:    String = ""
    @Published var hr:   Int = 0
    @Published var hrv:  Int = 0
    @Published var spo2: Int = 0
    @Published var speed:       Double = 0
    @Published var distance:    Double = 0
    @Published var calories:    Double = 0
    @Published var acceleration:Double = 0
 
    // Camera
    @Published var cameraConnected: Bool = false
    @Published var cameraSystem:    String = ""
    @Published var cameraTelemetry: [String:String] = [:]
 
    // SMARTSPEED
    @Published var smartspeedConnected: Bool = false
    @Published var smartspeedSystem:    String = ""
    @Published var splits: [SMARTSPEEDSplit] = []
 
    // Equipment
    @Published var equipment: [String] = []
 
    private var simulationTimer: Timer?
    var isRunning: Bool = false
 
    // BT
    private var centralManager: CBCentralManager?
    func centralManagerDidUpdateState(_ central: CBCentralManager) {}
 
    func connectWearable(device: String) {
        wearableDevice    = device
        wearableConnected = true
        hr = 72
        startSimulation()
    }
    func disconnectWearable() {
        wearableConnected = false; hr = 0; simulationTimer?.invalidate()
    }
    func connectCamera(system: String) { cameraSystem = system; cameraConnected = true }
    func disconnectCamera() { cameraConnected = false }
    func connectSMARTSPEED(system: String) { smartspeedSystem = system; smartspeedConnected = true }
    func disconnectSMARTSPEED() { smartspeedConnected = false }
 
    func recordSplit(setNumber:Int) {
        if smartspeedConnected {
            splits.append(SMARTSPEEDSplit(setNumber:setNumber, time:Double.random(in:4.1...4.8)))
        }
    }
    func clearSplits() { splits = [] }
 
    // Wearable sim (real device: CBPeripheral / HealthKit)
    private func startSimulation() {
        simulationTimer?.invalidate()
        simulationTimer = Timer.scheduledTimer(withTimeInterval:1.0, repeats:true) { [weak self] _ in
            guard let self else { return }
            self.hr    = max(60, min(200, self.hr + (Bool.random() ? 2 : -1)))
            self.hrv   = Int.random(in:30...50)
            self.spo2  = Int.random(in:97...99)
            if self.isRunning {
                self.speed       = Double.random(in:4...14)
                self.distance   += 0.003
                self.calories   += 0.4
                self.acceleration = Double.random(in:0...9)
            } else {
                self.speed       = Double.random(in:0...1)
                self.acceleration = 0
            }
        }
    }
 
    var hrMax: Int = 204   // set by HomeView from athlete age
    var hrZone: (String, String) {  // (label, hex color)
        let pct = hrMax > 0 ? Double(hr)/Double(hrMax)*100 : 0
        if pct < 60 { return ("Z1 Recovery",  "60a5fa") }
        if pct < 70 { return ("Z2 Aerobic",   "6ee7a0") }
        if pct < 80 { return ("Z3 Tempo",     "C9A84C") }
        if pct < 90 { return ("Z4 Threshold", "f97316") }
        return              ("Z5 Max",        "ef4444")
    }
}
