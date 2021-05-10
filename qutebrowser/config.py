import dracula.draw

config.load_autoconfig()

c.downloads.location.directory = "~/dow"
c.url.default_page = "file:///home/jd/.config/qutebrowser/homepage.html"
c.url.start_pages = "file:///home/jd/.config/qutebrowser/homepage.html"

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8,
    }
})
