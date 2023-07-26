class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.1/sentry-cli-Darwin-universal"
    sha256 "26db98e09b4fc42f2b341e1bf61c36648cf67a6e8784a816a33a476f451d9faa"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.1/sentry-cli-Linux-aarch64"
        sha256 "5b64a6df219c065cdb5c0502f03562461b6d01d3dcabc8f4994f68aab05710a4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.1/sentry-cli-Linux-armv7"
        sha256 "e3db0973c8d1968c9f034866d43204777a8e055731e345970b0b3380b53eea59"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.1/sentry-cli-Linux-x86_64"
        sha256 "3603956ecdfe03fa8914871fd3895e18cee2261fdef4f5070ab052d0ca094c3c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.1/sentry-cli-Linux-i686"
        sha256 "9e55f8e9c78971c93f0ff13301c3961108b7e07c9730b0eb6dac11da5b45c2c7"
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
