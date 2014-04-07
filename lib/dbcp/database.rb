module Dbcp
  class Database
    class UnsupportedDatabaseAdapter < StandardError; end

    class << self
      def build(args)
        klass_for_adapter(args['adapter']).new args
      end

      def klass_for_adapter(adapter)
        klass = case adapter
        when /mysql/
          MysqlDatabase
        when /postgres/
          PostgresDatabase
        else
          raise UnsupportedDatabaseAdapter.new("Unsupported database adapter: #{adapter}")
        end
      end
    end

    include Virtus.value_object
    values do
      attribute :adapter
      attribute :database
      attribute :host, String, default: 'localhost'
      attribute :socket
      attribute :username
      attribute :password
    end
  end
end