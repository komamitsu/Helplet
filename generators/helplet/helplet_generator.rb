class HelpletGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
  end

  def manifest
    record do |m|
      m.class_collisions 'Help', 'HelpHelper', 'HelpsController'
      m.directory 'app/models'
      m.directory 'app/helpers'
      m.directory 'app/controllers'
      m.directory 'config/helplet'

      m.template 'model.rb',      'app/models/help.rb'
      m.template 'controller.rb', 'app/controllers/helps_controller.rb'
      m.template 'helper.rb',     'app/helpers/help_helper.rb'
      m.file     'template_normal.erb', 'config/helplet/template_normal.erb'
      m.file     'template_edit.erb',   'config/helplet/template_edit.erb'
      m.migration_template 'migration.rb', 'db/migrate', :assigns => {}, :migration_file_name => "create_helps"
    end
  end
end

