require 'rails_helper'

RSpec.describe StaysController, type: :controller do
  describe "POST #create" do
    before do
      @studio = Studio.create!(name: "Studio Test")
      @stay = @studio.stays.create!(start_date: Date.today, end_date: Date.today + 5)
    end

    let(:valid_absences) do
      [
        { studio: @studio.name, start_date: (Date.today + 2).to_s, end_date: (Date.today + 3).to_s }
      ]
    end

    it "creates stays and updates accordingly" do
      post :create, params: { absences: valid_absences }, as: :json

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["message"]).to eq("Stays updated successfully")

      @studio.reload
      expect(@studio.stays.count).to eq(2)
      expect(@studio.stays.where(start_date: Date.today, end_date: Date.today + 1)).to be_present
      expect(@studio.stays.where(start_date: Date.today + 4, end_date: Date.today + 5)).to be_present
    end
  end
end
