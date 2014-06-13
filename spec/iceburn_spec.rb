require 'spec_helper'

describe Iceburn do
  it "has a logger" do
    expect(Iceburn.logger).to eq(Rails.logger)
  end
end
