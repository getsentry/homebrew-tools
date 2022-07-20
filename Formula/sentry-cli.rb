class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.5.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.5.0/sentry-cli-Darwin-universal"
    sha256 "8b89e12451a269075afe6322ec55a5fe55579068f32a92c1f46947809441144c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.0/sentry-cli-Linux-aarch64"
        sha256 "4d4bfdefc86738feec7e59ff5b0e7c824c37fa8c150e8926a020b0a1e4f84120"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.0/sentry-cli-Linux-armv7"
        sha256 "f790d039493e49cb4af8d7a8c63bb1ccc4b911c497369a4e8117093d884b06db"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.0/sentry-cli-Linux-x86_64"
        sha256 "f35d3cee001eb20b0706da9ddd939890371b0fd7b430a7ef3d3dfae8718b75a3"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.5.0/sentry-cli-Linux-i686"
        sha256 "16f63c0f5c9d0a6d462a031d3215860f908fd068c7a4117d5aa95bd8187ce60b"
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
