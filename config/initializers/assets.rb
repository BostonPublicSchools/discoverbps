# frozen_string_literal: true

# This file contains Ruby code related to assets. This may include models, controllers, services, or other components.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# TODO: For rails 5.0
# Rails.application.config.assets.precompile += [
#   'application.css', 'application.js'
# ]
