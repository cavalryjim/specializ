require 'iron_worker'
require_relative 'fibonacci_worker'

IronWorker.configure do |config|
  config.token = 'dngc_0NZBP4GBqkVH2kiFgefkO4'
  config.project_id = '4f6b6490f6a48e5c14004825'
end

worker = FibonacciWorker.new
worker.max = 1000
worker.run_local



