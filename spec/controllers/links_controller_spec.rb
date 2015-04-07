require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  let!(:user) { create(:user) }
  let!(:boss_link) { create(:boss_link) }
  let!(:boss) { boss_link.user }
  before { sign_in boss }

  describe 'GET index' do
    it 'successfully gets the index page' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'assigns the @links variable' do
      link = create(:first_link)
      get :index
      @links = assigns(:links)
      expect(@links).to eq(Link.all.order(votes: :desc))
      expect(link).to eq(@links.first)
    end
  end

  describe 'GET new' do
    it 'successfully gets the index page' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it 'assigns the @link variable' do
      get :new
      @link = assigns(:link)
      assert @link.new_record?
    end
  end

  describe 'POST create' do
    it 'successfully creates a link' do
      expect{
          post :create, link: attributes_for(:link)
        }.to change(Link, :count).by(1)
    end

    it 'redirects to the link page on save' do
      post :create, link: attributes_for(:link)
      @link = assigns(:link)
      expect(response).to redirect_to(@link)
    end
  end

  describe 'GET edit' do
    it 'successfully gets the edit page' do
      get :edit, id: boss_link.id
      expect(response).to render_template(:edit)
    end

    it 'redirects if not link owner' do
      sign_in user 
      get :edit, id: boss_link.id
      @link = assigns :link
      expect(response).to redirect_to(@link)
      expect(flash[:notice]).to eq("Nope")
    end
  end

  describe 'POST update' do
    it 'successfully updates a link' do
      post :update, id: boss_link.id, link: { title: "Updated"}
      link = assigns :link
      expect(link.title).to eq("Updated") 
    end

    it 'renders edit if form invalid' do
      post :update, id: boss_link.id, link: { title: " "}
      expect(response).to render_template(:edit)
    end
  end

end
