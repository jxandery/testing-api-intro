class Legislator < OpenStruct

  def self.service
    @service ||= SunlightService.new
  end

  # the method below is the same as Legislator.find_by()
  def self.find_by(zipcode: "")
    service.legislators(zipcode).map do |legislator|
      Legislator.new(legislator)
    end
  end
end
