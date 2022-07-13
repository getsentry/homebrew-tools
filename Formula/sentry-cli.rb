class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.4.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.4.0/sentry-cli-Darwin-universal"
    sha256 "f7cd6887521f0a1c91fb8358cbc1a8077b46294f92818627499c8ca73ed0a082"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.0/sentry-cli-Linux-aarch64"
        sha256 "9b5a1a37ea70f35fba96dd6ce73c28edec91dcabc9e091da0589b185f536d57e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.0/sentry-cli-Linux-armv7"
        sha256 "36dbae09800d7abab953945d969ccefda23d73a1c03a95501831582e5bcaaa14"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.0/sentry-cli-Linux-x86_64"
        sha256 "361329221eb6d1047b1889e8b66b3553d8689a605fa384bf31fbb3f756083106"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.4.0/sentry-cli-Linux-i686"
        sha256 "ea2601cdf5eda821388c9445b945903201f63d6468dad620d9039a8c40c38e5a"
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
