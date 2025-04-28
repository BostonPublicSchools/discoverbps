class SchoolDataJob < ApplicationJob
  queue_as :high_priority  # You can change this for different priority levels

  def perform(action)
    SchoolData.send(action)
  end
end
