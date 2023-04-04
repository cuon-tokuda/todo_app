require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #show" do
    context "when category exists" do
      let(:category) { create(:category) }

      it "renders the show template" do
        get :show, params: { id: category.id }
        expect(response).to render_template(:show)
      end
    end

    context "when category does not exist" do
      it "renders 404 page" do
        get :show, params: { id: -1 } # Use -1 as a non-existing ID for demonstration purposes
        expect(response.status).to eq(404)
        expect(response.body).to eq(File.read(Rails.root.join('public/404.html')))
      end
    end
  end
end
