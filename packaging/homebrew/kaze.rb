class Kaze < Formula
  desc "Lightweight terminal anime client and media player controller with mpv"
  homepage "https://github.com/yashh1323/kaze"
  version "4.3.0"
  license "Freeware"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-darwin-amd64.tar.gz"
      sha256 "9f5e314f63d8794b700b31cba17b09fcd259ed5aababe42b08d3a001a168d113"
    elsif Hardware::CPU.arm?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-darwin-arm64.tar.gz"
      sha256 "b6613dfffbfca316d903428219d803564009a5725884cfdf8ae7233f66b5d994"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-linux-amd64.tar.gz"
      sha256 "892c77fd0b5fc9df140631e0b89579cbe9f28dd3465613a4508d0d7792a82abc"
    elsif Hardware::CPU.arm?
      url "https://github.com/yashh1323/kaze/releases/download/v4.3.0/kaze-linux-arm64.tar.gz"
      sha256 "c9958cdd00b601b262d7630495013e45decd95f4e20a9c9157788c00c3c35915"
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
