class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.75.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.75.0/sentry-cli-Darwin-universal"
    sha256 "b64d948db80b4a462e54b869ea9e258c62d1a9facbfaa57c68756695dad9f41c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.0/sentry-cli-Linux-aarch64"
        sha256 "c93f55cae48e91495b0f13bc50ae8a057f76452b73c40752ab4aab30f4ef19ce"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.0/sentry-cli-Linux-armv7"
        sha256 "c81b622bd11cf01228ece983f538ac2689b2dd49bf3ebb44ff605bf9e254ca32"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.0/sentry-cli-Linux-x86_64"
        sha256 "19b4c6d3bcb65df151a22aa188bae4804c8a7b8dcd4051893125781188b43f5f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.0/sentry-cli-Linux-i686"
        sha256 "b1a1ea42ed158935f84d783fe7c8efbb6ebc8615f441e6dd93380d3d4bc93257"
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
