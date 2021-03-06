require 'fog/core/collection'
require 'fog/google/models/compute/backend_service'

module Fog
  module Compute
    class Google
      class BackendServices < Fog::Collection
        model Fog::Compute::Google::BackendService

        def all(filters={})
          data = service.list_backend_services.body['items'] || []
          load(data)
        end

        def get(identity)
          response = nil
          response = service.get_backend_service(identity)
          return nil if response.nil?
          new(response.body)
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
