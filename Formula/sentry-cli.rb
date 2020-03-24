class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.52.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.0/sentry-cli-Darwin-x86_64"
    sha256 "97c9bafbcf87bd7dea4f1069fe18f8e8265de6f7eab20c62ca9299e0fa8c2af6"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.0/sentry-cli-Linux-x86_64"
    sha256 "d6aeb45efbcdd3ec780f714b5082046ea1db31ff60ed0fc39916bbc8b6d708be"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.0/sentry-cli-Linux-i686"
    sha256 "b0dca09ef68c3f8399b0be228691bc4060922a27c7bb85c1cf44f95ab93dbc5e"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
