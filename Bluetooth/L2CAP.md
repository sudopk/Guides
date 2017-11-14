* The Logical Link Control and Adaption protocol.
* Packet-base and can be configured with varying levels of reliability (latter part is not technically true).
* Default max packet size is 672 bytes, but can be negotiated up to 65535 bytes after a connection is established.
* Can be compared with UDP, which is best effort packet-based. But use cases for L2CAP are much broader. L2CAP enforces delivery order (not the case in UDP).
* Reliability by the a transmit/acknowlegment scheme. There are 3 possible retransmit policies.
  * Never retransmit (but make a best effort)
  * Always retransmit until success or total connection failure (Default option, reliable)
  * Drop a packet and move on to queued data if packet hasn't been acknowledged after a specified time limit (0-1279 ms)
* L2CAP actually serves as the transport protocol for RFCOMM. This means changing the delivey guarantees of L2CAP changes it for the RFCOMM as well.
