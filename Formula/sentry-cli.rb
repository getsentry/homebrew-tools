class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.0.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.0.0/sentry-cli-Darwin-universal"
    sha256 "b2eb3f411eef8082037fd3cd1e561178a9f084028820d74619195e10cfc5e4e8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.0/sentry-cli-Linux-aarch64"
        sha256 "815686a698e60e41a34035a00a0f11194db266e4b92259b979254a51eaf7bc12"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.0/sentry-cli-Linux-armv7"
        sha256 "b9c2de7bb303e304a046876cf82f7cc1f2c2a68353cdcae4ffa38b80004e5607"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.0/sentry-cli-Linux-x86_64"
        sha256 "460d2053f273fdbd26d88ccb35965448447c4b3715ddc8c6b476a3d243e54430"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.0/sentry-cli-Linux-i686"
        sha256 "74f9c694a165fe3884dcafd04a7f0e686c93cd0d999ec55d58ce363bd97abe93"
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
