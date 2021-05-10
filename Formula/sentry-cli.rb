class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.64.2"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.64.2/sentry-cli-Darwin-universal"
    sha256 "2bf00a200403da3f455122c2d80a391f8689c358b950e87c202e6871d5cd3f58"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.2/sentry-cli-Linux-aarch64"
        sha256 "3bb64a2d3836d0987d7295d652699a0b6155013e4d573c1530c582937d128d91"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.2/sentry-cli-Linux-armv7"
        sha256 "6b9968c0c08113e18a98b825577ce3bc9f80590e721f4b0e07d3188d6b5cf371"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.2/sentry-cli-Linux-x86_64"
        sha256 "77b26ef4477b852c7cedd5d82b068875a2a8ad221fdd6cc465a1e250ec640c38"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.2/sentry-cli-Linux-i686"
        sha256 "8297318252e09401aea1210899268fbf32b3b84759aeb9511142521f9467d22d"
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
