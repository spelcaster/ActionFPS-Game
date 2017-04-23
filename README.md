# ActionFPS Game [![Build Status](https://travis-ci.org/ActionFPS/ActionFPS-Game.svg?branch=master)](https://travis-ci.org/ActionFPS/ActionFPS-Game) [![CircleCI](https://circleci.com/gh/ActionFPS/ActionFPS-Game.svg?style=svg)](https://circleci.com/gh/ActionFPS/ActionFPS-Game) [![Build status](https://ci.appveyor.com/api/projects/status/dx4x857jldgx5d9h/branch/master?svg=true)](https://ci.appveyor.com/project/ScalaWilliam/actionfps-game/branch/master)

> Game client and server for [ActionFPS](https://actionfps.com/)

_See: [ActionFPS Tutorial](https://docs.actionfps.com/tutorial.html)
· [Development Guide](https://docs.actionfps.com/game-development-guide.html)
· [Contributor Guide](https://docs.actionfps.com/contributor-guide.html)_

# Quickstart

You have two choices:
1. Download a pre-built binary.
2. Run from sources.

## Download

You have two download choices:
* Directly from [automatically built development release](https://github.com/ActionFPS/ActionFPS-Game/releases).
* Through [ActionFPS Play page](https://actionfps.com/play).

## Run from source

### Windows

1. Install Windows Visual C++ Studio Express 2010
2. Open `source/vcpp/cube.vcxproj` and build "Release"
3. Install ActionFPS & copy `packages` directory from there into here. This is because we're separating media from code.
4. Launch `actionfps_release.bat`

### Linux

On Ubuntu or the like:

```
$ sudo apt-get install clang make automake libsdl1.2-dev libogg-dev \
  libsdl-image1.2-dev libcurl4-openssl-dev libopenal-dev libvorbis-dev openssl libssl-dev -y
$ (cd source/src && make install)
$ ./install-packages.sh
$ ./actionfps.sh
```

### Mac

Install [XCode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) and [brew](http://brew.sh).

```
$ brew install openssl
$ ./install-packages.sh
$ (cd source/xcode && make)
$ open source/xcode/build/Release/actionfps.dmg
```

## Connect to a test server
This server is synchronised with the [`master` branch](https://help.github.com/articles/github-glossary/#branch).

In the game, type: `/connect woop.ac 7654` or open link `actionfps://woop.ac:7654` in your browser.

## Media

Media in `packages` directory is separated from the repository.
AssaultCube packages are download at installation time on Windows and Linux.

This brings several benefits:
- Licences are now clearly separated - the codebase can stay zlib.
- Will enforce a decoupled architecture so that game releases do not depend on media releases
  and force us to make sane choices.
- Separation of concerns.
- Smaller downloads and easier distribution.
- Smaller repository.

Goal would be download the media not at installation time, but at runtime.
This would enable:
- Versioning, repositories, etc, of individual media for improved sharing.
  It would be possible, for example, for people to manage the lifecycle of their maps and media.
  We would be able to fetch stuff
- Adding new media without having to re-release the game.
- Provide extremely fast media downloads by using CDN or BitTorrent (yes this is possible!).
