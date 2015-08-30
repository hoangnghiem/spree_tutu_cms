require 'spec_helper'

RSpec.describe Spree::Cms::Page, type: :model do

  describe "validations" do
    subject {build(:page)}
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
    it { should_not allow_value('123,abc-asfda').for(:url) }
    it { should_not allow_value('abc.com').for(:url) }
    it { should allow_value('abc-com').for(:url) }
    it { should allow_value('privacy/abc').for(:url) }
    it { should allow_value('privacy').for(:url) }
  end

  it "should assign user to correct role" do
    puts create(:page).inspect
  end
end
