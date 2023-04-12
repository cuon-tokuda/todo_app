require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show" do
    context "when category exists" do
      let(:category) { create(:category) }
      subject { get :show, params: { id: category.id } }

      it "renders the show template" do
        subject
        expect(response).to render_template(:show)
      end
    end

    context "when category does not exist" do
      subject { get :show, params: { id: -1 } }
      it "renders 404 page" do
        subject
        expect(response.status).to eq(404)
        expect(response.body).to eq(File.read(Rails.root.join('public/404.html')))
      end
    end
  end
end
