class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.64.0"
  license "BSD-3-Clause"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.64.0/sentry-cli-Darwin-universal"
    sha256 "2ea8893149fb0ec0d21792e7bf2eaf282c1a472b0c70f40e295d026fb546520d"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.0/sentry-cli-Linux-aarch64"
        sha256 "af8d05c0dc0040e76c895bff8a06cfc1e8baeba6d1934dc0b95da1c8440b1fbd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.0/sentry-cli-Linux-armv7"
        sha256 "88c22e1a462cbe3c1ad81149e54026365d6a1c12029d07b5b45e6ffcc9833475"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.0/sentry-cli-Linux-x86_64"
        sha256 "ae936cc38c2fe175e8a83649fc45461d062cb27f579c40b5c5ff538ec0d92521"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.64.0/sentry-cli-Linux-i686"
        sha256 "b8ddb941975eb0a01d120e2c2192ccfce81b598f12a3a7e12e0444bb4e883234"
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
