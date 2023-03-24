class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.16.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.16.0/sentry-cli-Darwin-universal"
    sha256 "5d8c5ff0c3c42b988ee77aff765a7f733bb1264822126dc1952f8ba3556678d5"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.0/sentry-cli-Linux-aarch64"
        sha256 "0a86384509757c2e1cf14499d27cdaa9f5a6d9bd0b1b8e375260c4715e67059f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.0/sentry-cli-Linux-armv7"
        sha256 "7b73e9b5458a2066a20d986709755066c69c250922b66d6254c0f8a8890f2eff"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.0/sentry-cli-Linux-x86_64"
        sha256 "0beccfae24d5162e11cdbfee01af7cd49046661ba3d53481226aff08d77443fe"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.16.0/sentry-cli-Linux-i686"
        sha256 "015d6837b36676b7ef613d7fa5d19ea703b82af059d526efbeda06cd83d02c2d"
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
