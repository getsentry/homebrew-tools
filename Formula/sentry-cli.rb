class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.9.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.9.0/sentry-cli-Darwin-universal"
    sha256 "db65a1ae2ff0322f0fcdae8848151f32159c53f80372ff1da961277498fa2ed0"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.9.0/sentry-cli-Linux-aarch64"
        sha256 "0130b100deabf8a391945253de6dd173c021e0922bf0e0d0327b4c4ec6d1000f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.9.0/sentry-cli-Linux-armv7"
        sha256 "602d0bb3dc29f99edd65646087ccabcfdfa5299bbea087b9371cd54801a756c3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.9.0/sentry-cli-Linux-x86_64"
        sha256 "8d24e65b07eee362cd8e8b80a98b6029c66950c01cc58b4345f235fae2e243a4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.9.0/sentry-cli-Linux-i686"
        sha256 "ad782c3fb8e4c3d0bf1883ca27b29298c5c309d594ade73a65bcae55844c2b25"
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
