config.load_autoconfig()

c.downloads.location.directory = "~/dow"
c.url.default_page = "file:///home/jd/.config/qutebrowser/homepage.html"
c.url.start_pages = "file:///home/jd/.config/qutebrowser/homepage.html"
c.content.tls.certificate_errors = "ask-block-thirdparty"
config.bind("\\d", "spawn -u dict")
config.bind("\\w", "spawn -u wiki")

config.source('nord-qutebrowser.py')
