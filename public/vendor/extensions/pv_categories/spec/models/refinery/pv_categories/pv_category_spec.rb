require 'spec_helper'

module Refinery
  module PvCategories
    describe PvCategory do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:pv_category,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
