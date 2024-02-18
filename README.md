# AUTOCOMB

Automatically generate combs for your programs. No more manually creating custom icons for your whatever the fuck program and no need to fuck around with electron apps like Discord `--processStart Discord.exe` stfu we copying the .lnk from Start Menu!!!

# Features

- Automatic comb generation for each application on your system!
- Customizable styles and colors and shadows
- Very small filesize due to not bundling in a ton of icons!

# Installation

Install using [Meters on Demand](https://github.com/meters-on-demand/cli):

```
mond install reisir/autocomb
```

# Manual installation

1. Install [Rainmeter](https://rainmeter.net)
2. Download the [latest release of Autocomb](https://github.com/reisir/autocomb/releases)
3. Install the .rmskin

# Usage

When you click on the main Autocomb skin it automatically reads and generates combs for each program in your start menu. It misses steam games and other such entries that don't point directly to an .exe (for now).

You can right click any Autocomb and select "edit variables" to edit the settings. Once you've edited the variables, save the file (ctrl + s) and right click any Autocomb and select "Refresh Autocomb" to load the new settings.

Whenever you install a new application, you can load the main Autocomb skin and click on it to regenerate all combs. 

# F.A.Q.

## I edited an autocomb but all my changes dissapeared??

Autocombs are automatically generated. Every comb is wiped and re-generated whenever you load Autocomb.ini. You're not supposed to edit the generated files by hand.

## You've said you hate launcher skins?

Yes but Autocomb is an interesting project. And I like doing things better than other people :3

# TODO: 

Please for the love of god can someone PR these in thanks

- [ ] Ability to make custom icons. Save them in a conf file in case the autocomb main script is run again.
- [ ] Automatic aligner that loops through the combs and puts them in a grid.
- [ ] Way to detect Steam games and get icons for em
 
