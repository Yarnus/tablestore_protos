# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse) do
  @moduledoc false
  (
    defstruct(tunnel: nil, channels: [], tunnel_rpo: nil)

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          [] |> encode_tunnel(msg) |> encode_channels(msg) |> encode_tunnel_rpo(msg)
        end
      )

      []

      [
        defp(encode_tunnel(acc, msg)) do
          case(msg.tunnel) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:tunnel]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_channels(acc, msg)) do
          case(msg.channels) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<18>>, Protox.Encode.encode_message(value)]
                end)
              ]
          end
        end,
        defp(encode_tunnel_rpo(acc, msg)) do
          field_value = msg.tunnel_rpo

          case(field_value) do
            nil ->
              acc

            _ ->
              [acc, <<24>>, Protox.Encode.encode_int64(field_value)]
          end
        end
      ]

      []
    )

    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def(decode(bytes)) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def(decode!(bytes)) do
          {msg, set_fields} =
            parse_key_value(
              [],
              bytes,
              struct(ExAliyunOts.TableStoreTunnel.DescribeTunnelResponse)
            )

          case([:tunnel] -- set_fields) do
            [] ->
              msg

            missing_fields ->
              raise(Protox.RequiredFieldsError.new(missing_fields))
          end
        end
      )

      (
        @spec parse_key_value([atom], binary, struct) :: {struct, [atom]}
        defp(parse_key_value(set_fields, <<>>, msg)) do
          {msg, set_fields}
        end

        defp(parse_key_value(set_fields, bytes, msg)) do
          {new_set_fields, field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreTunnel.TunnelInfo.decode!(delimited)
                field = {:tunnel, Protox.Message.merge(msg.tunnel, value)}
                {[:tunnel | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStoreTunnel.ChannelInfo.decode!(delimited)
                field = {:channels, msg.channels ++ List.wrap(value)}
                {[:channels | set_fields], [field], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                field = {:tunnel_rpo, value}
                {[:tunnel_rpo | set_fields], [field], rest}

              {tag, wire_type, rest} ->
                {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
                {set_fields, [], rest}
            end

          msg_updated = struct(msg, field)
          parse_key_value(new_set_fields, rest, msg_updated)
        end
      )

      []
    )

    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:tunnel, {:default, nil}, {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}},
        2 => {:channels, :unpacked, {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}},
        3 => {:tunnel_rpo, {:default, 0}, :int64}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        channels: {2, :unpacked, {:message, ExAliyunOts.TableStoreTunnel.ChannelInfo}},
        tunnel: {1, {:default, nil}, {:message, ExAliyunOts.TableStoreTunnel.TunnelInfo}},
        tunnel_rpo: {3, {:default, 0}, :int64}
      }
    end

    []
    @spec required_fields() :: [:tunnel]
    def(required_fields()) do
      [:tunnel]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:tunnel)) do
        {:ok, nil}
      end,
      def(default(:channels)) do
        {:error, :no_default_value}
      end,
      def(default(:tunnel_rpo)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end