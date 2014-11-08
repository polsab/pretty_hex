PrettyHex
=========

PrettyHex is an Elixir library hex dumping binaries.

```elixir
## Example
iex> PrettyHex.pretty_hex("This is a test. Just a test.")
00000000:  54 68 69 73 20 69 73 20 61 20 74 65 73 74 2E 20     This.is.a.test..
00000010:  4A 75 73 74 20 61 20 74 65 73 74 2E                 Just.a.test."

iex> PrettyHex.pretty_hex("Another test.", 0x10f0)
000010F0:  41 6E 6F 74 68 65 72 20 74 65 73 74 2E              Another.test.

iex> PrettyHex.pretty_hex(<<0x45, 0x55, 0xff, 0x12, 0x32, 0x16, 0x70>>, 0xfc00, 64)
000000000000FC00:  45 55 FF 12 32 16 70                                EU..2.p
```
