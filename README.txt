This is a little desktop widget which can be used to monitor RSS feeds.
Its probably not unlike the many other RSS readers you can find online but this one
is mine and as such is designed to meet my exact need; which is to monitor RSS feeds
from a source repository (both the main line and branches) during a day to keep me
up to date with the changes my team is putting in.

----

Some 'git stuff' for this branch:


git clone https://github.com/bvanderlaan/RSSReaderDesktopWidget.git
## or git pull

git branch -r
## shows remote branch origin/snap

git branch --track snap origin/snap
## tracks the (see also ################################################################################)

git checkout snap
