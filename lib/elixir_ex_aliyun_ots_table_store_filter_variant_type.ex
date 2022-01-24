# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStoreFilter.VariantType) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :VT_INTEGER
      def(default()) do
        :VT_INTEGER
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:VT_INTEGER)) do
          0
        end

        def(encode("VT_INTEGER")) do
          0
        end
      ),
      (
        def(encode(:VT_DOUBLE)) do
          1
        end

        def(encode("VT_DOUBLE")) do
          1
        end
      ),
      (
        def(encode(:VT_STRING)) do
          3
        end

        def(encode("VT_STRING")) do
          3
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(0)) do
        :VT_INTEGER
      end,
      def(decode(1)) do
        :VT_DOUBLE
      end,
      def(decode(3)) do
        :VT_STRING
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{0, :VT_INTEGER}, {1, :VT_DOUBLE}, {3, :VT_STRING}]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def(has_constant?(:VT_INTEGER)) do
          true
        end,
        def(has_constant?(:VT_DOUBLE)) do
          true
        end,
        def(has_constant?(:VT_STRING)) do
          true
        end
      ]

      def(has_constant?(_)) do
        false
      end
    )
  )
end