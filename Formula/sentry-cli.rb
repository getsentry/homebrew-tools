class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.63.0"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.63.0/sentry-cli-Darwin-universal"
    sha256 "5e6aa63d56805e5b8c53c481d67ea84e9c7c1d416b159ff0c50062368f78f638"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.0/sentry-cli-Linux-aarch64"
        sha256 "c922abae3281c8a6c90cf434593ac2d2d4fad4daf823bd1580b11888c1e4650f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.0/sentry-cli-Linux-armv7"
        sha256 "7d8398c8f6079499408743155015fb5da3f1848a25aa630513e5c756eef266a4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.0/sentry-cli-Linux-x86_64"
        sha256 "aa19e3c4138c910409a1e1b17a5ff9c57e3d6d03a338be1821603ff9b898898a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.63.0/sentry-cli-Linux-i686"
        sha256 "e98496b1e1eb211d4a3e949ae505845135c8c2ad9d6fe8824e50af139a4be2a4"
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
