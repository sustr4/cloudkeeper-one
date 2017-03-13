module Cloudkeeper
  module One
    module ApplianceActions
      module Removal
        def remove_appliance(appliance_id)
          remove_templates :find_by_appliance_id, appliance_id
          remove_images :find_by_appliance_id, appliance_id
        end

        def remove_image_list(image_list_id)
          remove_templates :find_by_image_list_id, image_list_id
          remove_images :find_by_image_list_id, image_list_id
        end

        def remove_expired
          handle_iteration(image_handler.expired) { |item| image_handler.delete item }
        end

        def remove_templates(method, value)
          handle_iteration(template_handler.send(method, value)) { |item| template_handler.delete item }
        end

        def remove_images(method, value)
          handle_iteration(image_handler.send(method, value)) do |item|
            image_handler.expire item
            image_handler.delete item
          end
        end

        private

        def handle_iteration(items)
          raise Cloudkeeper::One::Errors::ArgumentError, 'Iteration error handler was called without a block!' unless block_given?

          error = nil
          items.each do |item|
            begin
              yield item
            rescue Cloudkeeper::One::Errors::StandardError => ex
              error = ex
              next
            end
          end

          raise error if error
        end
      end
    end
  end
end
