require 'rails_helper'

describe "Legislator" do
  context ".all_by(attribute)" do
    it "it returns an array of legislators" do
      VCR.use_cassette("sunlight_service.legislators") do
        legislators = Legislator.all_by(state: "CO")
        legislator = legislators.first

        expect(legislators.count).to eq(9)
        expect(legislator.full_name).to eq("Ken Buck")
      end
    end
  end
end
