#!/bin/sh

dotdirs="config fonts icons themes vnc mozilla"

for dir in $dotdirs; do
	mkdir -p ~/.$dir
	cp -rf $dir/* ~/.$dir/
done

dotfiles=".Xclients"
cp -rf $dotfiles ~/

for d in ~/.mozilla/firefox/*default*; do
    if [ -f "${d}/prefs.js" ]; then
      ln -sf ../firefox-themes                                                                "${d}/chrome"
      echo "user_pref(\"toolkit.legacyUserProfileCustomizations.stylesheets\", true);" >>     "${d}/prefs.js"
      echo "user_pref(\"browser.tabs.drawInTitlebar\", true);" >>                             "${d}/prefs.js"
      echo "user_pref(\"browser.uidensity\", 0);" >>                                          "${d}/prefs.js"
      echo "user_pref(\"layers.acceleration.force-enabled\", true);" >>                       "${d}/prefs.js"
      echo "user_pref(\"mozilla.widget.use-argb-visuals\", true);" >>                         "${d}/prefs.js"
    fi
done

