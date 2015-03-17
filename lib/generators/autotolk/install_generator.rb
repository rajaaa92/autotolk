require 'rails/generators'

module Autotolk
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path("../../templates", __FILE__)

    argument :_namespace, :type => :string, :required => false, :desc => "Tolk url namespace"
    desc "Autotolk installation generator"
    def install
      display "Overriding tolk/application.js..."
      create_file "app/assets/javascripts/tolk/application.js", "//= require tolk/layout.js\n//= require tolk/actions.js\n//= require tolk/interpolations.js\n//= require autotolk/locales.js
"
      display "Disabling overridden file in main application.js..."
      inject_into_file "app/assets/javascripts/application.js", "\n//= stub tolk/application", after: "//= require_tree ."

      display "Adding autotolk to routes..."
      inject_into_file "config/routes.rb", "\nmatch 'translate' => 'translations#translate', via: :get", after: "mount Tolk::Engine, at: '/tolk', as: 'tolk'"

      display "Creating initalizer..."
      initializer = (File.open(Rails.root.join("config/initializers/autotolk.rb")) rescue nil).try :read
      unless initializer
        template "autotolk.rb", "config/initializers/autotolk.rb"
      else
        display "You already have a config file. I'm generating a new 'autotolk.rb.example' that you can review."
        template "autotolk.rb", "config/initializers/autotolk.rb.example"
      end
      display "Initializer created. Visit config/initializers/autotolk.rb to change your tokens.", :magenta

      display "Job's done, hope everything went well. Now your locales will be translated automatically when you visit /tolk/locales/XX!", :blue
    end

    private

    def display output, color = :black
      say("           -  #{output}", color)
    end
  end
end
