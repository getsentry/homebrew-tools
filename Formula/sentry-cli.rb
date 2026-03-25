class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.3.4"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.3.4/sentry-cli-Darwin-universal"
    sha256 "c17862f5ff58049a684585b831a36b76ff588e0d3a5b409c58c339478c6245f7"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.4/sentry-cli-Linux-aarch64"
        sha256 "e3d349052ce90a66c1513a68677de31007a80c530c57b9138563e46f7d0fec78"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.4/sentry-cli-Linux-armv7"
        sha256 "91d81060442df92103cf837b36c160a2856bd2df4d56eb8b22d59105b42d4699"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.4/sentry-cli-Linux-x86_64"
        sha256 "c747e594dcb29daf0843178a64c7dc92c1338c1caa6d81f414851884f6eb6830"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.3.4/sentry-cli-Linux-i686"
        sha256 "d3150ceeb5a41a9400c6ace5e74b2cedbefb2e1f998809a8c38e105862c5eba3"
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
