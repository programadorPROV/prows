# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PvStocks" do
    describe "Admin" do
      describe "pv_stocks", type: :feature do
        refinery_login

        describe "pv_stocks list" do
          before do
            FactoryGirl.create(:pv_stock, :name => "UniqueTitleOne")
            FactoryGirl.create(:pv_stock, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pv_stocks_admin_pv_stocks_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.pv_stocks_admin_pv_stocks_path

            click_link "Add New Pv Stock"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::PvStocks::PvStock, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::PvStocks::PvStock, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:pv_stock, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.pv_stocks_admin_pv_stocks_path

              click_link "Add New Pv Stock"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::PvStocks::PvStock, :count)

              expect(page).to have_content("There were problems")
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.pv_stocks_admin_pv_stocks_path
                click_link "Add New Pv Stock"
                fill_in "Name", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::PvStocks::PvStock.count).to eq(1)
              end

              it "should show locale marker for page" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                end
              end

              it "should show name in the admin menu" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a pv_stock with title for primary and secondary locale" do
              before do
                visit refinery.pv_stocks_admin_pv_stocks_path
                click_link "Add New Pv Stock"
                fill_in "Name", :with => "First column"
                click_button "Save"

                visit refinery.pv_stocks_admin_pv_stocks_path
                within ".actions" do
                  click_link "Edit this pv_stock"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                expect(Refinery::PvStocks::PvStock.count).to eq(1)
                expect(Refinery::PvStocks::PvStock::Translation.count).to eq(2)
              end

              it "should show locale flag for page" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'EN')
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end

              it "should show name in backend locale in the admin menu" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_content('First column')
                end
              end
            end

            describe "add a name with title only for secondary locale" do
              before do
                visit refinery.pv_stocks_admin_pv_stocks_path
                click_link "Add New Pv Stock"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::PvStocks::PvStock.last
                within "#pv_stock_#{p.id}" do
                  expect(page).to have_css(".locale_marker", content: 'CS')
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:pv_stock, :name => "A name") }

          it "should succeed" do
            visit refinery.pv_stocks_admin_pv_stocks_path

            within ".actions" do
              click_link "Edit this pv stock"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:pv_stock, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pv_stocks_admin_pv_stocks_path

            click_link "Remove this pv stock forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::PvStocks::PvStock.count).to eq(0)
          end
        end

      end
    end
  end
end
