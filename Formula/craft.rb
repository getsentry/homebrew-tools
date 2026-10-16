class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "2.35.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/2.35.0/craft-darwin-arm64.gz"
      sha256 "27de3a7b04add7286241c934974ffd8be7c7943910eedde3e2fc951a83325856"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/2.35.0/craft-darwin-x64.gz"
      sha256 "d61ac503c1606aa293d1f482d2adc8a1d0cf56c1239ca0a072695880f8769e03"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/2.35.0/craft-linux-arm64.gz"
      sha256 "403f4d782a5e8abaa19b2e6248ee6af3a36f866f9400b86da37e517f442a6283"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/2.35.0/craft-linux-x64.gz"
      sha256 "6f8ed0edef49f50cb39e4a6d836f53b3971a8cbc9ec8643970b1bae0eaeee6f8"
    else
      raise "Unsupported Linux CPU architecture"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["craft-*"].first => "craft"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/craft --version").chomp
  end
end
