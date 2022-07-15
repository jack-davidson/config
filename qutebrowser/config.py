# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig(False)

c.content.javascript.can_access_clipboard = True
c.content.tls.certificate_errors = 'ask-block-thirdparty'

c.url.default_page = 'file:///home/jd/.config/qutebrowser/homepage.html'
c.url.start_pages = 'file:///home/jd/.config/qutebrowser/homepage.html'
c.downloads.location.directory = '~/dow'

config.set('content.notifications.enabled', True, 'https://calendar.google.com/*')

c.content.pdfjs = True
c.content.register_protocol_handler = True
c.fonts.default_size = '10.0pt'
c.tabs.favicons.show = 'pinned'
c.tabs.show = 'multiple'
c.tabs.title.alignment = 'center'

padding = {
    'bottom': 5,
    'left': 5,
    'right': 5,
    'top': 5,
}
c.statusbar.padding = padding
c.tabs.padding = padding

config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)

config.bind('\\d', 'spawn -u dict')
config.bind('\\w', 'spawn -u wiki')

c.colors.webpage.preferred_color_scheme = 'dark'
config.source('nord-qutebrowser.py')
