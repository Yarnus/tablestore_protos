# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreSearch.NestedFilter) do
  @moduledoc false
  (
    defstruct(path: nil, filter: nil)

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
          [] |> encode_path(msg) |> encode_filter(msg)
        end
      )

      []

      [
        defp(encode_path(acc, msg)) do
          try do
            case(msg.path) do
              nil ->
                acc

              _ ->
                [acc, "\n", Protox.Encode.encode_string(msg.path)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:path, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_filter(acc, msg)) do
          try do
            case(msg.filter) do
              nil ->
                acc

              _ ->
                [acc, <<18>>, Protox.Encode.encode_message(msg.filter)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:filter, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(ExAliyunOts.TableStoreSearch.NestedFilter))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[path: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   filter:
                     Protox.MergeMessage.merge(
                       msg.filter,
                       ExAliyunOts.TableStoreSearch.Query.decode!(delimited)
                     )
                 ], rest}

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
          ExAliyunOts.TableStoreSearch.NestedFilter,
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
      %{
        1 => {:path, {:scalar, ""}, :string},
        2 => {:filter, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        filter: {2, {:scalar, nil}, {:message, ExAliyunOts.TableStoreSearch.Query}},
        path: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "path",
          kind: {:scalar, ""},
          label: :optional,
          name: :path,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "filter",
          kind: {:scalar, nil},
          label: :optional,
          name: :filter,
          tag: 2,
          type: {:message, ExAliyunOts.TableStoreSearch.Query}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:path)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "path",
             kind: {:scalar, ""},
             label: :optional,
             name: :path,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("path")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "path",
             kind: {:scalar, ""},
             label: :optional,
             name: :path,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:filter)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, nil},
             label: :optional,
             name: :filter,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
           }}
        end

        def(field_def("filter")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "filter",
             kind: {:scalar, nil},
             label: :optional,
             name: :filter,
             tag: 2,
             type: {:message, ExAliyunOts.TableStoreSearch.Query}
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
      def(default(:path)) do
        {:ok, ""}
      end,
      def(default(:filter)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end