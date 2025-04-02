# frozen_string_literal: true

module Google
  def self.walk_times(home_latitude, home_longitude, school_coordinates)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{home_latitude},#{home_longitude}&destinations=#{school_coordinates}&mode=walking&units=imperial&sensor=false"
    get_results(url)
  end

  def self.drive_times(home_latitude, home_longitude, school_coordinates)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{home_latitude},#{home_longitude}&destinations=#{school_coordinates}&mode=driving&units=imperial&sensor=false"
    get_results(url)
  end

  def self.get_results(url)
    escaped_url = URI.escape(url)
    response = Faraday.new(url: escaped_url).get.body
    json_response = MultiJson.load(response, symbolize_keys: true)
    json_response.try(:[], :rows).try(:[], 0).try(:[], :elements)
  end
end
