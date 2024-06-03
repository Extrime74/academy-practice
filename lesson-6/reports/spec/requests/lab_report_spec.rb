require 'rails_helper'

RSpec.describe 'LabReports', type: :request do
  describe 'GET index' do
    it 'renders the index page' do
      get lab_reports_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    it 'renders the new page' do
      get new_lab_report_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new lab report and redirects' do
        valid_params = { lab_report: { title: 'Rails application', description: 'Laboratory reports', grade: 'A' } }
        expect {
          post lab_reports_path, params: valid_params
        }.to change(LabReport, :count).by(1)
        expect(response).to redirect_to(lab_report_path(LabReport.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new lab report and re-renders the form' do
        invalid_params = { lab_report: { title: 'Rails application', description: 'Laboratory reports', grade: '123' } }
        expect {
          post lab_reports_path, params: invalid_params
        }.not_to change(LabReport, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH update' do
    it 'updates the lab report and redirects' do
      lab_report = LabReport.create(title: 'Rails application', description: 'Laboratory reports', grade: 'A')
      valid_params = { lab_report: { title: 'Updated Title' } }
      patch lab_report_path(lab_report), params: valid_params
      expect(response).to redirect_to(lab_report_path(lab_report))
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the lab report and redirects to index' do
      lab_report = LabReport.create(title: 'Rails application', description: 'Laboratory reports', grade: 'A')
      expect {
        delete lab_report_path(lab_report)
      }.to change(LabReport, :count).by(-1)
      expect(response).to redirect_to(lab_reports_path)
    end
  end
end
