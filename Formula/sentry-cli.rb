class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.8.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.8.0/sentry-cli-Darwin-universal"
    sha256 "2c26914636c47ab9bf9e710484ad7b44d371cbec8bd29cafb36b3cf877bf4285"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.0/sentry-cli-Linux-aarch64"
        sha256 "eaea24b5b47b61a96d9a2e353268ea41fd9a8c5b7979694330df614d4af672bf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.0/sentry-cli-Linux-armv7"
        sha256 "f5cf9d6b3101f740f2d60c371c0a76330cb5072206216641edce72353e8cf503"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.0/sentry-cli-Linux-x86_64"
        sha256 "13f8cb34ae01a6a272d7d7c22e277a105286615b4020de900ea95a8de47cdbb6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.8.0/sentry-cli-Linux-i686"
        sha256 "ecbbc8e9b8050831cc1196edfc8df6d72660c4fdc7d844722ab6bc2a3a778173"
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
