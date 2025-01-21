class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.41.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.41.1/sentry-cli-Darwin-universal"
    sha256 "4b6703bb6160accb7d3552128945357910ff273fde5d5a8aa4d1668958bb9472"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.1/sentry-cli-Linux-aarch64"
        sha256 "a2361706bd8fd624edd73945f70e7ff761163258476292872dadea1bfe2f241e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.1/sentry-cli-Linux-armv7"
        sha256 "1425497df41f65a6b1777ad2806324bcf5980044c8b48a7cffc0e1ba5e471857"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.1/sentry-cli-Linux-x86_64"
        sha256 "a007369907840f26b68d0ce83037abf2b14fc68162fdef1d071885a1ace5e3cf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.41.1/sentry-cli-Linux-i686"
        sha256 "11988b764a08ff3711582854cae7e0b31cfbb3164bb1c9798d4fb1e89c0a9a02"
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
