class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.2/sentry-cli-Darwin-universal"
    sha256 "acecfc825dc87725bccbfe3aef55dcb195d43d3a2aec3d255758a2dc97a86e34"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.2/sentry-cli-Linux-aarch64"
        sha256 "bbb704c491eeb46be92877fcc39a712be53388435d256b7e112f76a4a37de91c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.2/sentry-cli-Linux-armv7"
        sha256 "5e457b2bf7f678704edb2214f73597cd08e7146e1032182852ed5d4ba9612721"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.2/sentry-cli-Linux-x86_64"
        sha256 "f19511e24fda6c44b62da3fd8d5d7193eada4fa885626b275b930b3cd435435b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.2/sentry-cli-Linux-i686"
        sha256 "9aebde0aafc57a598c53c16ebfe0aa57152d948371e69edacccd241d1888166f"
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
