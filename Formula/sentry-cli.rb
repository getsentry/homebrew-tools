class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.4/sentry-cli-Darwin-universal"
    sha256 "4731b13a003b33a206e5c7b27578710736869a02f675783adf30d13587c86e8b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.4/sentry-cli-Linux-aarch64"
        sha256 "5a0f7f257a1d620fc806de3c5662af2ca2b2c903bd2699f8bf7e91a9f32677dc"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.4/sentry-cli-Linux-armv7"
        sha256 "8bd82bab2fe879b27a33cf2cdebf783fd598416eb4588bab7fbe790a3fb0d068"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.4/sentry-cli-Linux-x86_64"
        sha256 "a3b39ba6dee8db1bebf48532dade2d23aa3330544b7416f3974acc03fee2a466"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.4/sentry-cli-Linux-i686"
        sha256 "e48c0dc345bfd7b93e8564ca1035c8759cc4cc733726967a94962badf3bb02ff"
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
