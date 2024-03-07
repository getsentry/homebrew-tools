class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.0/sentry-cli-Darwin-universal"
    sha256 "8ede3324bd7a7f66f1d05020a95c2b538584c9cde54e40e250f96c1d065454cc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.0/sentry-cli-Linux-aarch64"
        sha256 "ddfac08ce0396513d5a0a88933c747e9abfba24de6b299956bc89db05671b09c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.0/sentry-cli-Linux-armv7"
        sha256 "b2640ba81fd2d683b3e0eea079125ab4786c1ceaa97916b8440414ad56fe4f36"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.0/sentry-cli-Linux-x86_64"
        sha256 "7f1a2e2786c6d94d0c9b6560a9ff73801b64c7ba78831cf6aa502f183968fbd0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.0/sentry-cli-Linux-i686"
        sha256 "93c78acc5359d57af273d9047ea1a9d255f7732297dd7f0dd8a4bafc66c1c8c4"
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
