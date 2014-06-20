require 'spec_helper'
require 'iceburn/filters'

module Iceburn
  describe Filters, :type => :controller do
    class MocksController < ActionController::Base
      include Filters

      def index
        respond_to do |format|
          format.json { render json: { attr: 'value' } }
        end
      end
    end

    before do
      @controller = MocksController.new
    end

    it "stops html requests and returns a blank response" do
      get :index, :format => :html

      expect(response).to be_success
      expect(response.header['Content-Type']).to match('text/html')
      expect(response.body).to be_blank
    end

    it "passes on json requests" do
      get :index, :format => :json

      expect(response).to be_success
      expect(response.header['Content-Type']).to match('application/json')
      expect(response.body).to eq("{\"attr\":\"value\"}")
    end
  end
end
