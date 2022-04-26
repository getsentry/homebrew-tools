class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.4/sentry-cli-Darwin-universal"
    sha256 "2a68d4d8bde9c8288bdbf36972af0750c5283ef72c9d1ec3145611a3c63d8263"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.4/sentry-cli-Linux-aarch64"
        sha256 "3fdf9ff93fc5daca3f78dcb48c3da2f45051c368ee85bdf29358222489a6bcd4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.4/sentry-cli-Linux-armv7"
        sha256 "d6ff4881f688c130f937a8f8633bfb31dfbefe927adb10c22d8cb34342fd73af"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.4/sentry-cli-Linux-x86_64"
        sha256 "7d0310369055eff794e0e22d43461b95e9d72b20a3d84c5d18b3270d105dadd0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.4/sentry-cli-Linux-i686"
        sha256 "389c56a06a936a12f42a09827ffdda738fd8a761b87452664207515dde44d774"
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
