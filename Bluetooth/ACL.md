* The Asynchronous Connection-Oriented Logical protocol.
* All L2CAP connections are encapsulated with ACL connections. RFCOMM connections are encapsulated within an L2CAP connection.
* Two bluetooth devices can have at most a single ACL connection between them, which is used to transport all L2CAP and RFCOMM traffic.
* ACL is similar to IP, in that it is a fundamental protocol that is rarely used to directly transport data, but almost always to encapsulate higher level protocol packets.
