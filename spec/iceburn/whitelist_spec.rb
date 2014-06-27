require 'spec_helper'
require 'iceburn/whitelist'

module Iceburn
  class Controller
    include Whitelist
  end

  describe Whitelist do
    subject { Controller.new }

    context "when a whitelist is defined with only controllers" do
      before do
        Controller.class_eval { iceburn_whitelist 'sessions', 'users' }
      end

      it "defines a whitelist" do
        expect(Controller.iceburn_whitelisted_routes).to include('sessions')
        expect(Controller.iceburn_whitelisted_routes).to include('users')
      end

      it "whitelists controllers in the whitelist" do
        allow(subject).to receive(:params).and_return(:controller => 'sessions')
        expect(subject.send(:controller_whitelisted?)).to eq(true)
        expect(subject).to be_whitelisted
      end

      it "allows other controllers to be filtered html" do
        allow(subject).to receive(:params).and_return(:controller => 'posts')
        expect(subject.send(:controller_whitelisted?)).to eq(false)
        expect(subject).to_not be_whitelisted
      end
    end

    context "when a whitelist is defined with actions" do
      before do
        Controller.class_eval { iceburn_whitelist 'sessions#new' }
      end

      it "defines a whitelist" do
        expect(Controller.iceburn_whitelisted_routes).to include('sessions#new')
      end

      it "whitelists controllers in the whitelist" do
        allow(subject).to receive(:params).and_return \
          :controller => 'sessions', :action => 'new'
        expect(subject).to be_whitelisted
        expect(subject.send(:action_whitelisted?)).to eq(true)
      end

      it "allows other controllers to be filtered html" do
        allow(subject).to receive(:params).and_return(:controller => 'posts')
        expect(subject.send(:action_whitelisted?)).to eq(false)
        expect(subject).to_not be_whitelisted
      end
    end

    context "when no whitelist is defined" do
      before do
        Controller.class_eval { iceburn_whitelist([]) }
      end

      it "allows all controllers to be filtered html" do
        allow(subject).to receive(:params).and_return(:controller => 'sessions')
        expect(subject.send(:controller_whitelisted?)).to eq(false)
        expect(subject.send(:action_whitelisted?)).to eq(false)
        expect(subject).to_not be_whitelisted
      end
    end
  end
end
