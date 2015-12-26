$:.push File.expand_path("../lib", __FILE__)

require "administrate/version"

Gem::Specification.new do |s|
  s.name = "administrate"
  s.version = Administrate::VERSION
  s.authors = ["Grayson Wright"]
  s.email = ["grayson@thoughtbot.com"]
  s.homepage = "https://administrate-docs.herokuapp.com/"
  s.summary = "A Rails engine for creating super-flexible admin dashboards"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "autoprefixer-rails"
  s.add_dependency "datetime_picker_rails"
  s.add_dependency "inline_svg"
  s.add_dependency "kaminari"
  s.add_dependency "momentjs-rails"
  s.add_dependency "neat"
  s.add_dependency "normalize-rails"
  s.add_dependency "rails"
  s.add_dependency "sass-rails"
  s.add_dependency "selectize-rails"

  s.description = <<-DESCRIPTION
Administrate is heavily inspired by projects like Rails Admin and ActiveAdmin,
but aims to provide a better user experience for site admins,
and to be easier for developers to customize.

To do that, we're following a few simple rules:

- No DSLs (domain-specific languages)
- Support the simplest use cases,
  and let the user override defaults with standard tools
  such as plain Rails controllers and views.
- Break up the library into core components and plugins,
  so each component stays small and easy to maintain.
  DESCRIPTION
end
