c.fonts.default_family = "Fira Code Nerd Font"
c.downloads.location.directory = "~/dow"
c.content.javascript.can_access_clipboard = True
c.colors.webpage.preferred_color_scheme = True
c.content.tls.certificate_errors = "ask-block-thirdparty"
c.url.default_page = "file:///home/jd/.config/qutebrowser/homepage.html"
c.url.start_pages = "file:///home/jd/.config/qutebrowser/homepage.html"

config.bind("\\d", "spawn -u dict")
config.bind("\\w", "spawn -u wiki")

config.source('nord-qutebrowser.py')
