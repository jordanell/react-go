exports.config =
  conventions:
    assets:  /^(src\/assets\/)/
    ignored: /^(src\/styles\/overrides|(.*?\/)?[_]\w*)/

  paths:
    public: './public'
    watched: ["src"]

  files:
    javascripts:
      defaultExtension: "coffee"
      joinTo:
        'app.js': /^(src)/
        'vendor.js': /^(bower_components|vendor)/
      order:
        before: ["bower_components/jquery/jquery.js"]

    stylesheets:
      defaultExtension: 'scss'
      joinTo:
        'app.css': /^src\/styles\/app.scss/
        'vendor.css': /^bower_components|vendor/

  # Activate the brunch plugins
  plugins:
    react:
      autoIncludeCommentBlock: yes
    sass:
      debug: 'comments'

  modules:
    nameCleaner: (path) ->
      path
        # Strip the src/ prefix from module names
        .replace(/^src\//, '')

        # Strip the .cjsx extension from module names
        .replace(/\.cjsx/, '')