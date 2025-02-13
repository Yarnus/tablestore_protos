# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.Range) do
  @moduledoc false
  (
    defstruct(from: nil, to: nil)

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
          [] |> encode_from(msg) |> encode_to(msg)
        end
      )

      []

      [
        defp(encode_from(acc, msg)) do
          try do
            case(msg.from) do
              nil ->
                acc

              _ ->
                [acc, "\t", Protox.Encode.encode_double(msg.from)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:from, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_to(acc, msg)) do
          try do
            case(msg.to) do
              nil ->
                acc

              _ ->
                [acc, <<17>>, Protox.Encode.encode_double(msg.to)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:to, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.Range))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_double(bytes)
                {[from: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_double(bytes)
                {[to: value], rest}

              {tag, wire_type, rest} ->
                {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
                {[], rest}
            end

          msg_updated = struct(msg, field)
          parse_key_value(rest, msg_updated)
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
          ExAliyunOts.TableStoreSearch.Range,
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
      %{1 => {:from, {:scalar, 0.0}, :double}, 2 => {:to, {:scalar, 0.0}, :double}}
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{from: {1, {:scalar, 0.0}, :double}, to: {2, {:scalar, 0.0}, :double}}
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "from",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :from,
          tag: 1,
          type: :double
        },
        %{
          __struct__: Protox.Field,
          json_name: "to",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :to,
          tag: 2,
          type: :double
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:from)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "from",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :from,
             tag: 1,
             type: :double
           }}
        end

        def(field_def("from")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "from",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :from,
             tag: 1,
             type: :double
           }}
        end

        []
      ),
      (
        def(field_def(:to)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "to",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :to,
             tag: 2,
             type: :double
           }}
        end

        def(field_def("to")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "to",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :to,
             tag: 2,
             type: :double
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:from)) do
        {:ok, 0.0}
      end,
      def(default(:to)) do
        {:ok, 0.0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end