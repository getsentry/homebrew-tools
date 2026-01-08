class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.0.3"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.0.3/sentry-cli-Darwin-universal"
    sha256 "de726ed1b4efd7c3a2b35481fbc80213c24696b00f476d001d52b8eab87c4d38"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.3/sentry-cli-Linux-aarch64"
        sha256 "2617026dcaa0c9fc413bf0cbd83d0e2ac9dc75b3adbb4de8128ba1e2723fef46"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.3/sentry-cli-Linux-armv7"
        sha256 "b14004c1de1c2c19f51972547b3588cac1a332558d55a89baa5becb218de738f"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.3/sentry-cli-Linux-x86_64"
        sha256 "0dba6a25c7d2aa22d4140e65e5652214e4a8dfb2dc3463ab87359abe06c21272"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.0.3/sentry-cli-Linux-i686"
        sha256 "ae73f0edff817f1e71614305ef666199fb3b46f8d7cb890a08654e9d03fef923"
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
