class Kaze < Formula
  desc "Lightweight terminal anime client and media player controller with mpv"
  homepage "https://github.com/yashh1323/kaze"
  version "4.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-darwin-amd64.tar.gz"
      sha256 "e75a6043f3ffc6f942c4972410b4eed733513ac12da1461040ede804d2925f84"
    elsif Hardware::CPU.arm?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-darwin-arm64.tar.gz"
      sha256 "3e00ff48fd392308bc032f23638f1da1b6825238b2f7f985e5b7745994e400c5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-linux-amd64.tar.gz"
      sha256 "55410ea5452a11b5463f3d89e22ece79d617a36c550024bc2bbda535b2f3c32a"
    elsif Hardware::CPU.arm?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-linux-arm64.tar.gz"
      sha256 "aa753411cf4c94fad70e33e5427f5468e55d6886968ad5a83e2a1dd8a760e781"
    end
  end

  depends_on "mpv"

  def install
    bin.install "kaze"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "Kaze v#{version}", shell_output("#{bin}/kaze --version")
  end
end
