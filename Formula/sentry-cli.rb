class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.51.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.51.1/sentry-cli-Darwin-universal"
    sha256 "6a19197a3d5c3105a7c297cb2e2d90a8462c658c08469e304ddffec48b0e73f6"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.1/sentry-cli-Linux-aarch64"
        sha256 "97906258835ea6f7f8f2fb1cd590572789494f03605c08ef51af45d4f6d3d211"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.1/sentry-cli-Linux-armv7"
        sha256 "cd62f58ccb179687dcfaf7f69c14d673581d8f322dadca1550f9383e068efb1a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.1/sentry-cli-Linux-x86_64"
        sha256 "ab4a2727699c6f06aaff83722bc7a10a1008f6a15e768ce132c80d7ebdd53216"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.51.1/sentry-cli-Linux-i686"
        sha256 "7735f2b9e42b9eb82014fc92923aa8c9a5a270ae591ecf6a6e0f817e029a8343"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
