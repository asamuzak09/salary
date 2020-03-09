require 'rails_helper'

RSpec.describe Shift, type: :model do
  context "kind method test" do
    it "00:00 - 00:00 なら休日" do
      result = Shift.kind(Time.parse("00:00"),Time.parse("00:00"))
      expect(result).to eq :holiday
    end
    
    it "08:00 - 17:00 なら平日" do
      result = Shift.kind(Time.parse("08:00"),Time.parse("17:00"))
      expect(result).to eq :working_day
    end 
  
   end 
end
