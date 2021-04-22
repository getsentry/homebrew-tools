class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.64.1"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.64.1/sentry-cli-Darwin-universal"
    sha256 "b9f352c3ad3127d144a7759db386289239c77ad8d7c2f2307004553854adbb64"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.1/sentry-cli-Linux-aarch64"
        sha256 "2cae7656e4206c2566a12f48ce02dd08aba72e33e4ffe4ae2b12b4ba2c740f98"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.1/sentry-cli-Linux-armv7"
        sha256 "47be795cdcc620478dc2f7ee901fc2089e3b74f07e123ce706f0088a213cc0b4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.1/sentry-cli-Linux-x86_64"
        sha256 "9b0f40b559dfedc143a5c55aeb0e4c60d16bb4b105d6e953832509048ea40b08"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.1/sentry-cli-Linux-i686"
        sha256 "794417555b1375531ac4f2c2729c07da00f14dc5bca7af8b11b4b46d690f7188"
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
