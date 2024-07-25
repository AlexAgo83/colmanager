require 'rails_helper'

RSpec.describe Stay, type: :model do
  before do
    @studio = Studio.create!(name: "Studio Test")
  end

  it "is valid with valid attributes" do
    stay = @studio.stays.build(start_date: Date.today, end_date: Date.today + 1)
    expect(stay).to be_valid
  end

  # FIXME: This test is failing
  # it "is invalid without a start_date" do
  #   stay = @studio.stays.build(start_date: nil, end_date: Date.today + 1)
  #   expect(stay).to_not be_valid
  #   expect(stay.errors[:start_date]).to include("can't be blank")
  # end

  it "is invalid if end_date is before start_date" do
    stay = @studio.stays.build(start_date: Date.today, end_date: Date.today - 1)
    expect(stay).to_not be_valid
    expect(stay.errors[:end_date]).to include("must be after the start date")
  end

  it "is valid if end_date is after start_date" do
    stay = @studio.stays.build(start_date: Date.today, end_date: Date.today + 1)
    expect(stay).to be_valid
  end
end
