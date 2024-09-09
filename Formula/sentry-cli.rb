class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.36.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.36.0/sentry-cli-Darwin-universal"
    sha256 "c13b7500d11a2ef62e6c8b54b56ea90ddd4131f731b450f3a7fa6fd3e8e00af4"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.0/sentry-cli-Linux-aarch64"
        sha256 "93f8988e5c4c27ec47d5c03ea39edeb8a21f7816e82922aed2bfe01dc0a62a20"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.0/sentry-cli-Linux-armv7"
        sha256 "cef9b3e6a279fa9fc2a512168aa6fba9f953fcf2f0c9e5e72f2301caba83af9e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.0/sentry-cli-Linux-x86_64"
        sha256 "3a9ebce904a69bf42ef3f2f445b521765e68d1401524d2ed1d8def95db92b3b7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.36.0/sentry-cli-Linux-i686"
        sha256 "5c9ec874801e8df5e1f5a39130035a3e4ac84e6b5cf541a6eb1b05b1763a3ded"
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
