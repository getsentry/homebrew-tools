class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.6.1"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.6.1/sentry-cli-Darwin-universal"
    sha256 "25f0cea3ad39690082c8c5df7a98eac068d7fcbec933f4cb2acecf914a105106"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.1/sentry-cli-Linux-aarch64"
        sha256 "ea17bcce48fd8a252174db9743503b967351c1ed498c296fdfa40b4cb609bbc5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.1/sentry-cli-Linux-armv7"
        sha256 "4554398346e78c6c7145c1e790e686b6afb18b3618a84ef1fcd5ebe5f5ec4f72"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.1/sentry-cli-Linux-x86_64"
        sha256 "e25efd0278e2576d531fa9931faf61f6f0f6cda99024b55f694fb2588297f653"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.6.1/sentry-cli-Linux-i686"
        sha256 "097ffb42a386363c6052e65b3eede52f081e3b391fba5c1a24ebf05e39678f25"
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
