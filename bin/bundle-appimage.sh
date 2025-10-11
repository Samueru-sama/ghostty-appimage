#!/bin/sh

set -eux

ARCH="$(uname -m)"
GHOSTTY_VERSION="$(cat VERSION)"

export UPINFO="gh-releases-zsync|$(echo "${GITHUB_REPOSITORY}" | tr '/' '|')|latest|Ghostty-*$ARCH.AppImage.zsync"
export URUNTIME_PRELOAD=1
export DEPLOY_OPENGL=1
export EXEC_WRAPPER=1
export OUTNAME="Ghostty-${GHOSTTY_VERSION}-${ARCH}.AppImage"
export DESKTOP="./ghostty-${GHOSTTY_VERSION}/zig-out/share/applications/com.mitchellh.ghostty.desktop"
export ICON="./ghostty-${GHOSTTY_VERSION}/zig-out/share/icons/hicolor/256x256/apps/com.mitchellh.ghostty.png"

./quick-sharun ./ghostty-${GHOSTTY_VERSION}/zig-out/bin/ghostty
cp -rf ./ghostty-${GHOSTTY_VERSION}/zig-out/share/* ./AppDir/share/
echo 'unset ARGV0' >>./AppDir/.env
# temp fix for https://github.com/pkgforge-dev/ghostty-appimage/issues/93
ln -s /usr/share/glvnd/egl_vendor.d/10_nvidia.json ./AppDir/share/glvnd/egl_vendor.d/10_nvidia.json

./uruntime2appimage

mkdir -p ./dist
mv -v ./*.AppImage* ./dist
