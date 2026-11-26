class Caption < Formula
  desc "Turn a video URL into a timestamped .srt file, transcribed on-device"
  homepage "https://github.com/pranav-singhal/caption"
  url "https://github.com/pranav-singhal/caption/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9a4c98c3ff6f5ccebb5a5d182ebafdcd3a2f076252945c5867c49949af2f1ed5"
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
