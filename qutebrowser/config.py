# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig(False)

c.downloads.location.directory = "~/dow"
c.content.javascript.can_access_clipboard = True
c.colors.webpage.preferred_color_scheme = "dark"
c.content.tls.certificate_errors = "ask-block-thirdparty"
c.url.default_page = "file:///home/jd/.config/qutebrowser/homepage.html"
c.url.start_pages = "file:///home/jd/.config/qutebrowser/homepage.html"

config.bind("\\d", "spawn -u dict")
config.bind("\\w", "spawn -u wiki")

config.source('nord-qutebrowser.py')
