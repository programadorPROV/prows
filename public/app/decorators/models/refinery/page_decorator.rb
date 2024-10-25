::Refinery::Page.class_eval do
    def self.show_menu
        where :show_in_menu => true
    end
end