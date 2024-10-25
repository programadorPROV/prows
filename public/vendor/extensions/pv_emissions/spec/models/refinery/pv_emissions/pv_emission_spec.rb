require 'spec_helper'

module Refinery
  module PvEmissions
    describe PvEmission do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:pv_emission,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
