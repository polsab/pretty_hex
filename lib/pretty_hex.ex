defmodule PrettyHex do

  @replacement_char "."

  defp is_space?(c), do: c == " " || (c >= "\t" && c <= "\r")

  defp hex_line(<<>>), do: ""
  defp hex_line(<<x::bytes-size(1), tail::binary>>), do: Base.encode16(x) <> " " <> hex_line(tail)

  defp text_line(<<>>), do: ""
  defp text_line(<<x::bytes-size(1), tail::binary>>) do
    case (String.printable? x) && not is_space? x do
      true -> x <> text_line(tail)
      false -> @replacement_char <> text_line(tail)
    end
  end

  @doc """
  This function will hex dump the given binary string. It takes a binary string argument, an optional address start (default is 0),
  and optional address size (default is 32).

  ## Example
  iex> PrettyHex.pretty_hex("This is a test. Just a test.")
 "00000000:  54 68 69 73 20 69 73 20 61 20 74 65 73 74 2E 20     This.is.a.test..
  00000010:  4A 75 73 74 20 61 20 74 65 73 74 2E                 Just.a.test."

  iex> PrettyHex.pretty_hex("Another test.", 0x10f0)
 "000010F0:  41 6E 6F 74 68 65 72 20 74 65 73 74 2E              Another.test."

  iex> PrettyHex.pretty_hex(<<0x45, 0x55, 0xff, 0x12, 0x32, 0x16, 0x70>>, 0xfc00, 64)
 "000000000000FC00:  45 55 FF 12 32 16 70                                EU..2.p"
  """
  def pretty_hex(line, addr \\ 0, addr_size \\ 32)
  def pretty_hex(<<>>, _, _), do: ""
  def pretty_hex(<<line::bytes-size(16), tail::binary>>, addr, addr_size) do
    "#{:io_lib.format("~#{div(addr_size, 4)}.16.0B:", [addr])}  #{hex_line(line)}    #{text_line(line)}\n" <> pretty_hex(tail, addr + 16)
  end
  def pretty_hex(line, addr, addr_size) do
    "#{:io_lib.format("~#{div(addr_size, 4)}.16.0B:", [addr])}  #{hex_line(line)}" <> String.duplicate("   ", 16 - byte_size(line)) <> "    #{text_line(line)}"
  end

end
