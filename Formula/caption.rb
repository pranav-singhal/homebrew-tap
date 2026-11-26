class Caption < Formula
  desc "Transcribe videos, podcasts and lectures on-device to timestamped text"
  homepage "https://github.com/pranav-singhal/caption"
  url "https://github.com/pranav-singhal/caption/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "187c2aef10d52153d2ba22b4a54ce46e4e0c643153cb57c744e0547ae420dcad"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ffmpeg"
  depends_on macos: :tahoe
  depends_on "yt-dlp"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/caption --version")
    output = shell_output("#{bin}/caption not-a-url 2>&1", 1)
    assert_match "not a valid URL", output
  end
end
