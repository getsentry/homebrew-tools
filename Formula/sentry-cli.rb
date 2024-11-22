class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.39.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.39.0/sentry-cli-Darwin-universal"
    sha256 "38a2a24677fae94d4b0ffed5f3d554feaf792a1b397b026cfd9defce095fe0da"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.0/sentry-cli-Linux-aarch64"
        sha256 "bad001e2a89287ef539fbec0f5328b85cdd2a7058bb4a24844da99fbd6972d35"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.0/sentry-cli-Linux-armv7"
        sha256 "034ddc9708b1e5d53fd633076ff34ed083af62617298a201ee49d4969de672ae"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.0/sentry-cli-Linux-x86_64"
        sha256 "8fb858fbf4d6a78a6a2f21b18ef1c39ce3b70a2e6823aaa6d4b53af0953be451"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.39.0/sentry-cli-Linux-i686"
        sha256 "30a092ddab2d5656f0effab716b98570f75c501ddf1d342620c44c633c483338"
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
