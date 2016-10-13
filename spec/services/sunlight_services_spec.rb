require 'rails_helper'

describe "SunlightService" do
  it "filters by attributes for /legislators" do
    VCR.use_cassette("sunlight_service.legislators") do
      legislators = SunlightService.legislators({state: "CO"})
      legislator = legislators.first

      expect(legislators.count).to eq(9)
      expect(legislator[:first_name]).to eq("Ken")
      expect(legislator[:last_name]).to eq("Buck")
    end
  end
end
