# README.md
## FlagProtocol

The main idea to find the flag is to run the "transmitter" that's included in the challenge and sniff the traffic it sends out — no reverse engineering of the binary required, just packet capture.

#### Step-1:

The Mega link contained a tarball with `FlagProtocol.dll` and `FlagProtocol.runtimeconfig.json` — a .NET Core console app targeting `netcoreapp2.2`. The challenge description says it's "solvable without reverse engineering" and to "get the flag transmitter running and capture the flag," which is a strong hint this is about network capture, not disassembly.

#### Step-2:

The sandbox only had a newer .NET runtime installed, so running the dll directly failed with a framework-version mismatch. Fixed it by adding a roll-forward policy to the runtime config:

```
{
  "runtimeOptions": {
    "tfm": "netcoreapp2.2",
    "framework": {
      "name": "Microsoft.NETCore.App",
      "version": "2.2.0"
    },
    "rollForward": "LatestMajor"
  }
}
```

Running it then just prints:

```
Transmitting flag...
```

...and keeps running, sending something out over the network.

#### Step-3:

Started a packet capture and ran the transmitter alongside it:

```
tcpdump -i any -n -w capture.pcap udp port 6969 &
dotnet FlagProtocol.dll
```

The app was broadcasting UDP packets to `255.255.255.255:6969` about twice a second. Each packet's payload was only 8 bytes, e.g.:

```
666c616707191464   ->   "flag" 07 19 14 'd'
666c616707190043   ->   "flag" 07 19 00 'C'
666c61670719187d   ->   "flag" 07 19 18 '}'
```

The layout is: the literal string `flag`, two constant bytes, then one **index** byte, then one **character** byte. So every packet reveals a single, randomly-chosen character of the flag along with its position — it just needs enough packets to eventually cover every index.

#### Step-4:

Captured for about 40 seconds (enough for every index to show up at least once) and reassembled the flag with a small script:

```python
from scapy.all import rdpcap

pkts = rdpcap('capture.pcap')
result = {}
for p in pkts:
    if p.haslayer('UDP') and p.haslayer('Raw'):
        payload = bytes(p['Raw'].load)
        if payload.startswith(b'flag') and len(payload) == 8:
            idx, ch = payload[6], payload[7]
            result[idx] = chr(ch)

flag = ''.join(result[i] for i in range(max(result) + 1))
print(flag)
```

This collected all 25 indices (0–24) and printed the flag directly.

#### Step-5:

Finally the flag becomes: **`CTFlearn{y0u_c4ptur3d_m3}`**