Settings.read(Rails.root.join('config', 'settings.yml'))

Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
Settings.extract!(:test, :development, :production)

Settings.resolve!

raise 'Not found app.secret key in config/settings.yml. See config/settings.yml.example' if Settings['app'].blank? || Settings['app']['secret'].blank?
MissTusur::Application.config.secret_token = Settings['app']['secret']
