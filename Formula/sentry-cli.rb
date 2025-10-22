class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.57.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.57.0/sentry-cli-Darwin-universal"
    sha256 "e5d890e92b5cef66b93898d2d81aad89ed9ec9a962364fd164eff0cef77ef99f"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.57.0/sentry-cli-Linux-aarch64"
        sha256 "cb3ce12b59dd6cb5d516a3d3ac07b79d99544856f49ebd88b022851cbba71c2d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.57.0/sentry-cli-Linux-armv7"
        sha256 "7d3acba06f184069418a4fa9d24145d12669786115e51ce66b179943c0e7e6ae"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.57.0/sentry-cli-Linux-x86_64"
        sha256 "c214ddd4b3e1143018c23c040ae347ecba0ed9a0ff4826679bc21d9796e9a96a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.57.0/sentry-cli-Linux-i686"
        sha256 "76199ca9c0db562c741b5d6a63d402de1678cbf107e94d181d14e2248600d932"
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
