require 'rails_helper'

RSpec.describe WinesController, :type => :controller do
    render_views

    describe 'GET index' do
        it 'shows all wines'
        it 'index render correctly' do
            sign_in @user
            get :index
            expect(response).to render_template('index')
        end
    end

    describe 'GET show' do
        it 'show render correctly'
    end
end