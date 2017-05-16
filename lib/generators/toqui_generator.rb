class ToquiGenerator < Rails::Generators::Base
  desc "This generator creates an initializer files with the default config"
  source_root File.expand_path "../initializers", __FILE__

  def copy_initializer
    copy_file "toqui.rb", "config/initializers/toqui.rb"
  end
end