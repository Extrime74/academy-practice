require 'rails_helper'

RSpec.describe "LabReports", type: :request do
  describe "GET /lab_reports" do
    it "returns a successful response" do
      get lab_reports_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /lab_reports/:id" do
    let(:lab_report) { FactoryBot.create(:lab_report) }

    it "returns a successful response" do
      get lab_report_path(lab_report)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /lab_reports/new" do
    it "returns a successful response" do
      get new_lab_report_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /lab_reports" do
    context "with valid parameters" do
      it "creates a new lab report" do
        expect {
          post lab_reports_path, params: { lab_report: FactoryBot.create(:lab_report) }
        }.to change(LabReport, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable entity status" do
        post lab_reports_path, params: { lab_report: { title: nil, description: "Some description", grade: "A", user_id: 1 } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /lab_reports/:id" do
    let(:lab_report) { FactoryBot.create(:lab_report) }

    context "with valid parameters" do
      it "updates the lab report" do
        patch lab_report_path(lab_report), params: { lab_report: { title: "Updated title" } }
        lab_report.reload
        expect(lab_report.title).to eq("Updated title")
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable entity status" do
        patch lab_report_path(lab_report), params: { lab_report: { title: nil, description: "Updated description" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /lab_reports/:id" do
    let!(:lab_report) { FactoryBot.create(:lab_report) }

    it "destroys the lab report" do
      expect {
        delete lab_report_path(lab_report)
      }.to change(LabReport, :count).by(-1)
    end
  end
end