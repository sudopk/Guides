* Port number is used to allow multiple applications on the same device to simultaneously utilize the same transport protocol.
* In L2CAP, ports are called Protocol Serivce Multiplexers (PSM) and can take on odd-numbered values between 1 and 32767.
* In RFCOMM, ports are called channels. Channels 1-30 are available for use.
* L2CAP reserves ports 1-1023 for standardized usage. e.g. SDP (Standard Discovery Protocol) used port 1 and RFCOMM connection are multiplexed on L2CAP port 3.
* RFCOMM doesn't have any reserved ports/channels.
* There is no notion of ports in SCO.
