class ServoGstPluginsGood < Formula
  desc "GStreamer plugins (well-supported, under the LGPL)"
  homepage "https://gstreamer.freedesktop.org/"
  url "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.5.tar.xz"
  sha256 "e83ab4d12ca24959489bbb0ec4fac9b90e32f741d49cda357cb554b2cb8b97f9"
  license "LGPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "flac"
  depends_on "gettext"
  depends_on "gtk+3"
  depends_on "jpeg-turbo"
  depends_on "lame"
  depends_on "libpng"
  depends_on "libshout"
  depends_on "libsoup"
  depends_on "libvpx"
  depends_on "orc"
  depends_on "servo-gst-plugins-base"
  depends_on "speex"
  depends_on "taglib"

  def install
    system "meson", *std_meson_args, "build", "-Dgoom=disabled", "-Dximagesrc=disabled"
    system "meson", "compile", "-C", "build", "-v"
    system "meson", "install", "-C", "build"
  end

  test do
    gst = Formula["servo-gstreamer"].opt_bin/"gst-inspect-1.0"
    output = shell_output("#{gst} --plugin cairo")
    assert_match version.to_s, output
  end
end
