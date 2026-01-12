class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.1.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.1.0/sentry-cli-Darwin-universal"
    sha256 "56144785a1894467662643b8090d0620e18e6831a93228260538b4e944ab9e72"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.1.0/sentry-cli-Linux-aarch64"
        sha256 "279c5db7601ecb028461a6c735926cf5616b192df42eb9e55d46cc300e5f5161"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.1.0/sentry-cli-Linux-armv7"
        sha256 "25e15889846b94ab65ac4fe9d05a16f83c325b598c525a3e99865aad8b6c2fc4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.1.0/sentry-cli-Linux-x86_64"
        sha256 "7fdf7be2875a6fdb7bc2a3802bf3276ed776a89b66fbb00f977bc73358c2bc3d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.1.0/sentry-cli-Linux-i686"
        sha256 "2f8502dee540eda7dc3cc4e7d72ff38d9fc20c295c80b85077a7fbe1dc67b434"
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
