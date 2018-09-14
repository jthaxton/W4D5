require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users template' do 
      get :new 
      expect(response).to render_template('new')
    end 
  end
  
  describe 'POST #create' do 
    context 'with invalid params' do
      it 'validates the presence of username and password' do
        post :create, params: {user: {username: 'robert', password: ''} }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end
    
    context 'with valid params' do 
      it 'successfully checks the database and saves' do 
        post :create, params: {user: {username: 'robert1', password: 'starwars'} }
        User.find_by_username('robert').to be_present
      end
    end
    context 'with valid params' do
      
      it 'redirects user to links index on success' do
        post :create, params: { user: { username: 'jack_bruce', password: 'password' } }
        expect(response).to redirect_to(links_url)
      end
      
      it 'logs in user' do 
        post :create, params: { user: { username: 'jack_bruce', password: 'password' } }
        user = User.find_by_username('jack_bruce')
        expect(session[:session_token]).to eq(user.session_token)
      end
    end 
  
  end
end 
  
  


