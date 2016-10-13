class Legislator
  attr_reader :full_name

  def initialize(raw_legislator)
    @full_name = "#{raw_legislator[:first_name]} #{raw_legislator[:last_name]}"
  end

  def self.all_by(attribute)
    SunlightService.legislators(attribute).map do |raw_legislator|
      Legislator.new(raw_legislator)
    end
  end
end
