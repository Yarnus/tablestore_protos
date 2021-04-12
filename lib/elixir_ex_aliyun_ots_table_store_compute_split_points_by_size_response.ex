# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse) do
  @moduledoc false
  (
    defstruct(consumed: nil, schema: [], split_points: [], locations: [])

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
          []
          |> encode_consumed(msg)
          |> encode_schema(msg)
          |> encode_split_points(msg)
          |> encode_locations(msg)
        end
      )

      []

      [
        defp(encode_consumed(acc, msg)) do
          case(msg.consumed) do
            nil ->
              raise(Protox.RequiredFieldsError.new([:consumed]))

            field_value ->
              [acc, "\n", Protox.Encode.encode_message(field_value)]
          end
        end,
        defp(encode_schema(acc, msg)) do
          case(msg.schema) do
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
        defp(encode_split_points(acc, msg)) do
          case(msg.split_points) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, <<26>>, Protox.Encode.encode_bytes(value)]
                end)
              ]
          end
        end,
        defp(encode_locations(acc, msg)) do
          case(msg.locations) do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
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
              struct(ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse)
            )

          case([:consumed] -- set_fields) do
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
                value = ExAliyunOts.TableStore.ConsumedCapacity.decode!(delimited)
                field = {:consumed, Protox.Message.merge(msg.consumed, value)}
                {[:consumed | set_fields], [field], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = ExAliyunOts.TableStore.PrimaryKeySchema.decode!(delimited)
                field = {:schema, msg.schema ++ List.wrap(value)}
                {[:schema | set_fields], [field], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes
                value = delimited
                field = {:split_points, msg.split_points ++ List.wrap(value)}
                {[:split_points | set_fields], [field], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                <<delimited::binary-size(len), rest::binary>> = bytes

                value =
                  ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation.decode!(
                    delimited
                  )

                field = {:locations, msg.locations ++ List.wrap(value)}
                {[:locations | set_fields], [field], rest}

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
        1 => {:consumed, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        2 => {:schema, :unpacked, {:message, ExAliyunOts.TableStore.PrimaryKeySchema}},
        3 => {:split_points, :unpacked, :bytes},
        4 =>
          {:locations, :unpacked,
           {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}}
      }
    end

    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        consumed: {1, {:default, nil}, {:message, ExAliyunOts.TableStore.ConsumedCapacity}},
        locations:
          {4, :unpacked,
           {:message, ExAliyunOts.TableStore.ComputeSplitPointsBySizeResponse.SplitLocation}},
        schema: {2, :unpacked, {:message, ExAliyunOts.TableStore.PrimaryKeySchema}},
        split_points: {3, :unpacked, :bytes}
      }
    end

    []
    @spec required_fields() :: [:consumed]
    def(required_fields()) do
      [:consumed]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:consumed)) do
        {:ok, nil}
      end,
      def(default(:schema)) do
        {:error, :no_default_value}
      end,
      def(default(:split_points)) do
        {:error, :no_default_value}
      end,
      def(default(:locations)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end