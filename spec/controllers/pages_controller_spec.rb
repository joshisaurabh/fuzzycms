require 'spec_helper'

describe PagesController do

  describe "#index" do
    it 'is successful' do
      get :index
      response.should be_success
    end
  end
  describe '#edit' do
    it 'is successful when logged in' do
      execute_login
      
      put :edit, :id => 12
      response.should render_template(:edit)
    end

    it 'redirects to login when user not logged in' do
      put :edit, :id => 12
      response.should redirect_to(new_user_session_path)
    end

  end

end