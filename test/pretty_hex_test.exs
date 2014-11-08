defmodule PrettyHexTest do
  use ExUnit.Case
  import PrettyHex

  test "Dump less than 16 bytes" do
    assert pretty_hex(<<0x3d, 0x5a, 0x00, 0x58, 0xff>>, 0x1c00) == "00001C00:  3D 5A 00 58 FF                                      =Z.X."
  end

  test "Dump more than 16 bytes" do
    assert pretty_hex(<<0x3d, 0x5a, 0x00, 0x58, 0xff, 0x4d, 0x0d, 0x32, 0xff, 0x4d, 0x73, 0x10, 0xfa, 0x42, 0x5a, 0x00, 0xf3,
                        0xcd, 0x3a, 0x00, 0x51, 0x0c, 0x33, 0x6a, 0x32, 0xf0, 0x4d, 0x57, 0x58, 0xff, 0x4d, 0x6a, 0x32, 0xff,
                        0x4d, 0x53, 0x10, 0x20, 0xfa>>, 0x1fa20) == "0001FA20:  3D 5A 00 58 FF 4D 0D 32 FF 4D 73 10 FA 42 5A 00     =Z.X.M.2.Ms..BZ.\n" <>
                                                                    "0001FA30:  F3 CD 3A 00 51 0C 33 6A 32 F0 4D 57 58 FF 4D 6A     ..:.Q.3j2.MWX.Mj\n" <>
                                                                    "0001FA40:  32 FF 4D 53 10 20 FA                                2.MS..."
  end

  test "Dump text" do
    assert pretty_hex("This is a test. Just a test.", 0x1000) == "00001000:  54 68 69 73 20 69 73 20 61 20 74 65 73 74 2E 20     This.is.a.test..\n" <>
                                                                 "00001010:  4A 75 73 74 20 61 20 74 65 73 74 2E                 Just.a.test."
  end
end
