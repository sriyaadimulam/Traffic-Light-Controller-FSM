# Verification Notes

## Simulation Overview

Behavioral simulation was performed using Vivado Simulator to verify FSM transitions and output timing behavior of the Traffic Light Controller.

## Verified FSM Sequence

```text id="jlwm46"
S0 → S1 → S2 → S3 → S0
```

## State Verification

| State | Verified Output           |
| ----- | ------------------------- |
| S0    | Road A Green, Road B Red  |
| S1    | Road A Yellow, Road B Red |
| S2    | Road A Red, Road B Green  |
| S3    | Road A Red, Road B Yellow |

## Observations

* FSM transitions were verified successfully.
* Output signals changed correctly according to state transitions.
* Clock divider behavior was validated during simulation.
* Behavioral waveform confirms proper traffic signal sequencing.

## Future Enhancements

* VCD waveform analysis
* Python-based visualization
* Automated verification checks
* Assertion-based validation
