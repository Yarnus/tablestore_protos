# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.GetShardIteratorRequest) do
  @moduledoc false
  (
    defstruct(stream_id: nil, shard_id: nil)

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          [] |> encode_stream_id(msg) |> encode_shard_id(msg)
        end
      )

      []

      [
        defp(encode_stream_id(acc, msg)) do
          try do
            case(msg.stream_id) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:stream_id]))

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.stream_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:stream_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_shard_id(acc, msg)) do
          try do
            case(msg.shard_id) do
              nil ->
                raise(Protox.RequiredFieldsError.new([:shard_id]))

              _ ->
                [acc, <<18>>, Protox.Encode.encode_string(msg.shard_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:shard_id, "invalid field value"), __STACKTRACE__)
          end
        end
      ]

      []
    )

    (
      (
        @spec decode(binary) :: {:ok, struct} | {:error, any}
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            {msg, set_fields} =
              parse_key_value([], bytes, struct(ExAliyunOts.TableStore.GetShardIteratorRequest))

            case([:stream_id, :shard_id] -- set_fields) do
              [] ->
                msg

              missing_fields ->
                raise(Protox.RequiredFieldsError.new(missing_fields))
            end
          end
        )
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
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:stream_id | set_fields], [stream_id: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[:shard_id | set_fields], [shard_id: delimited], rest}

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

    (
      @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStore.GetShardIteratorRequest,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{1 => {:stream_id, {:scalar, ""}, :string}, 2 => {:shard_id, {:scalar, ""}, :string}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{shard_id: {2, {:scalar, ""}, :string}, stream_id: {1, {:scalar, ""}, :string}}
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "streamId",
          kind: {:scalar, ""},
          label: :required,
          name: :stream_id,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "shardId",
          kind: {:scalar, ""},
          label: :required,
          name: :shard_id,
          tag: 2,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:stream_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("streamId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("stream_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "streamId",
             kind: {:scalar, ""},
             label: :required,
             name: :stream_id,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:shard_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardId",
             kind: {:scalar, ""},
             label: :required,
             name: :shard_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("shardId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardId",
             kind: {:scalar, ""},
             label: :required,
             name: :shard_id,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("shard_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shardId",
             kind: {:scalar, ""},
             label: :required,
             name: :shard_id,
             tag: 2,
             type: :string
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: [:stream_id | :shard_id]
    def(required_fields()) do
      [:stream_id, :shard_id]
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:stream_id)) do
        {:ok, ""}
      end,
      def(default(:shard_id)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end