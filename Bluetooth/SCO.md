* Synchronous Connection-Oriented logical transport.
* It is best-effort packet-based protocol that is exclusively used to tranmist voice-quality audio, not just any audio, but voice-quality audio, at exactly 64kb/s.
* It is useless for CD-quality audio because the transmitting rate isn't high enough, but just right for phone calls e.g. bluetooth headset phone calls.
* For music to bluetooth headset is probably over L2CAP connection.
* SCO packets are not reliable and are never retransmitted. But it is a priority connection, and is always guaranteed to have 64 kb/s transmission rate.
* For the guarantee, no Bluetooth device is allowed to have more than 3 active SCO connections. Between 2 devices, you can have only one active SCO connection.
* In default setting, packets are not transmitted transparently, but encoded using the Continuously Variable Slope Delta audio codec. The received audio, once decoded, looks nothing like original data but sounds the same. So SCO shouldn't be used for normal data transmission, but only for voice-quality audio.
