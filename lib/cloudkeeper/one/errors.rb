module Cloudkeeper
  module One
    module Errors
      autoload :StandardError, 'cloudkeeper/one/errors/standard_error'
      autoload :ArgumentError, 'cloudkeeper/one/errors/argument_error'
      autoload :NetworkConnectionError, 'cloudkeeper/one/errors/network_connection_error'
      autoload :MultiError, 'cloudkeeper/one/errors/multi_error'
      autoload :InvalidConfigurationError, 'cloudkeeper/one/errors/invalid_configuration_error'

      autoload :Opennebula, 'cloudkeeper/one/errors/opennebula'
      autoload :Actions, 'cloudkeeper/one/errors/actions'
    end
  end
end
