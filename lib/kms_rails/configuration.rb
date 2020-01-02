module KmsRails
  module ConfigurationBase
    attr_writer :configuration

    class Configuration
      attr_accessor :fake_kms_api, :alias_prefix, :kms_client

      def initialize
        @fake_kms_api = false
        @alias_prefix = ''
        @kms_client = Aws::KMS::Client.new
      end
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(self.configuration)
    end

    def reset_config
      @configuration = Configuration.new
    end
  end

  extend ConfigurationBase
end
