class ServoGstLibav < Formula
  desc "GStreamer plugins for Libav (a fork of FFmpeg)"
  homepage "https://gstreamer.freedesktop.org/"
  url "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.5.tar.xz"
  sha256 "b152e3cc49d014899f53c39d8a6224a44e1399b4cf76aa5f9a903fdf9793c3cc"
  license "LGPL-2.1-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "yasm" => :build
  depends_on "ffmpeg"
  depends_on "servo-gst-plugins-base"
  depends_on "xz" # For LZMA

  def install
    mkdir "build" do
      system "meson", *std_meson_args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end

  test do
    system "#{Formula["servo-gstreamer"].opt_bin}/gst-inspect-1.0", "libav"
  end
end
