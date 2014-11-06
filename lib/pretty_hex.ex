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

  def pretty_hex(<<>>, _), do: ""
  def pretty_hex(<<line::bytes-size(16), tail::binary>>, addr) do
    :binary.list_to_bin(:io_lib.format("~8.16.0B:  ", [addr])) <> hex_line(line) <> "    " <> text_line(line) <> "\n" <> pretty_hex(tail, addr + 16)
  end
  def pretty_hex(line, addr) do
    :binary.list_to_bin(:io_lib.format("~8.16.0B:  ", [addr])) <> hex_line(line) <> String.duplicate("   ", 16 - byte_size(line)) <> "    " <> text_line(line)
  end


end
